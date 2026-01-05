/**
 * API REST - Bonsai Tracker MVP
 * Test du framework en conditions réelles
 */

import express, { Request, Response, NextFunction } from 'express'
import cors from 'cors'
import helmet from 'helmet'
import rateLimit from 'express-rate-limit'
import * as Sentry from '@sentry/node'
import path from 'path'
import { fileURLToPath } from 'url'
import { BonsaiService } from '../services/BonsaiService.js'
import { SiteService } from '../services/SiteService.js'
import type { CreateBonsaiInput, UpdateBonsaiInput, TransferBonsaiInput, BonsaiFilter } from '../types/bonsai.js'
import type { CreateSiteInput, UpdateSiteInput, SiteFilter } from '../types/site.js'
import { errorLogger } from '../utils/errorLogger.js'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const app = express()
const bonsaiService = new BonsaiService()
const siteService = new SiteService()
const PORT = process.env.PORT || 3000
const NODE_ENV = process.env.NODE_ENV || 'development'

// Sentry - Production error monitoring
if (process.env.SENTRY_DSN) {
  Sentry.init({
    dsn: process.env.SENTRY_DSN,
    environment: NODE_ENV,
    tracesSampleRate: NODE_ENV === 'production' ? 0.1 : 1.0,
  })
  console.log('✓ Sentry initialized')
}

// CORS - Restricted by environment
const ALLOWED_ORIGINS = NODE_ENV === 'production'
  ? (process.env.ALLOWED_ORIGINS || 'https://bonsai-tracker.com').split(',')
  : ['http://localhost:3000', 'http://localhost:3001', 'http://127.0.0.1:3000', 'http://127.0.0.1:3001']

const corsOptions: cors.CorsOptions = {
  origin: (origin, callback) => {
    // Allow requests with no origin (mobile apps, curl, etc.) in dev
    if (!origin && NODE_ENV !== 'production') {
      callback(null, true)
      return
    }
    if (origin && ALLOWED_ORIGINS.includes(origin)) {
      callback(null, true)
    } else {
      callback(new Error(`CORS: Origin ${origin} not allowed`))
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}

// Rate Limiting
const apiLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: NODE_ENV === 'production' ? 100 : 1000, // 100 req/15min in prod
  message: { error: 'Too many requests, please try again later' },
  standardHeaders: true,
  legacyHeaders: false,
})

// Middleware - Security
app.use(helmet({
  contentSecurityPolicy: NODE_ENV === 'production' ? undefined : false,
}))
app.use(cors(corsOptions))
app.use('/api/', apiLimiter) // Rate limit API routes
app.use(express.json({ limit: '10kb' })) // Limit body size

// Health check endpoint (before static files)
app.get('/health', (_req: Request, res: Response) => {
  res.json({
    status: 'healthy',
    environment: NODE_ENV,
    timestamp: new Date().toISOString()
  })
})

app.use(express.static(path.join(__dirname, '../../public')))

// Seed data
async function seedData() {
  // Check if data already exists (for SQLite persistence)
  const existingSites = await siteService.findAll()
  if (existingSites.length > 0) {
    console.log(`✓ Using existing data: ${existingSites.length} sites`)
    const existingBonsais = await bonsaiService.findAll()
    console.log(`✓ Using existing data: ${existingBonsais.length} bonsais`)
    return
  }

  // Sites - capture IDs for foreign keys
  const siteNord = await siteService.create({ name: 'Pépinière Nord', location: 'Saint-Denis', capacity: 100, type: 'pepiniere' })
  const siteSud = await siteService.create({ name: 'Pépinière Sud', location: 'Saint-Pierre', capacity: 80, type: 'pepiniere' })
  const siteEst = await siteService.create({ name: 'Pépinière Est', location: 'Saint-André', capacity: 60, type: 'pepiniere' })
  await siteService.create({ name: 'Showroom Centre', location: 'Saint-Paul', capacity: 30, type: 'showroom' })
  console.log('✓ 4 sites de démo chargés')

  // Bonsais - use actual site IDs
  await bonsaiService.create({ species: 'Ficus retusa', age: 8, siteId: siteNord.id, metadata: { style: 'moyogi', origin: 'Taiwan', height: 35 } })
  await bonsaiService.create({ species: 'Pinus thunbergii', age: 25, siteId: siteNord.id, status: 'treatment', metadata: { style: 'chokkan', height: 60 } })
  await bonsaiService.create({ species: 'Juniperus chinensis', age: 15, siteId: siteSud.id, metadata: { style: 'shakan', height: 45, origin: 'China' } })
  await bonsaiService.create({ species: 'Acer palmatum', age: 12, siteId: siteSud.id, metadata: { style: 'moyogi', origin: 'Japan', height: 40 } })
  await bonsaiService.create({ species: 'Zelkova serrata', age: 18, siteId: siteEst.id, status: 'healthy', metadata: { style: 'hokidachi', height: 55 } })
  await bonsaiService.create({ species: 'Carmona microphylla', age: 5, siteId: siteNord.id, metadata: { style: 'informal', height: 20, notes: 'Débutant' } })
  console.log('✓ 6 bonsais de démo chargés')
}

// Routes API

// GET /api/bonsais - Liste avec filtres
app.get('/api/bonsais', async (req: Request, res: Response) => {
  try {
    const filter: BonsaiFilter = {}
    if (req.query.siteId) filter.siteId = req.query.siteId as string
    if (req.query.status) filter.status = req.query.status as any
    if (req.query.species) filter.species = req.query.species as string
    if (req.query.minAge) filter.minAge = parseInt(req.query.minAge as string, 10)
    if (req.query.maxAge) filter.maxAge = parseInt(req.query.maxAge as string, 10)

    const bonsais = await bonsaiService.findAll(Object.keys(filter).length > 0 ? filter : undefined)
    res.json(bonsais)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// GET /api/bonsais/:id - Détails
app.get('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    const bonsai = await bonsaiService.findById(req.params.id)
    if (!bonsai) {
      res.status(404).json({ error: 'Bonsai not found' })
      return
    }
    res.json(bonsai)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// POST /api/bonsais - Créer
app.post('/api/bonsais', async (req: Request, res: Response) => {
  try {
    const input: CreateBonsaiInput = req.body
    const bonsai = await bonsaiService.create(input)
    res.status(201).json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// PUT /api/bonsais/:id - Modifier
app.put('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    const input: UpdateBonsaiInput = req.body
    const bonsai = await bonsaiService.update(req.params.id, input)
    res.json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// POST /api/bonsais/:id/transfer - Transférer
app.post('/api/bonsais/:id/transfer', async (req: Request, res: Response) => {
  try {
    const input: TransferBonsaiInput = req.body
    const bonsai = await bonsaiService.transfer(req.params.id, input)
    res.json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// DELETE /api/bonsais/:id - Supprimer
app.delete('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    await bonsaiService.delete(req.params.id)
    res.status(204).send()
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// GET /api/stats - Statistiques
app.get('/api/stats', async (_req: Request, res: Response) => {
  try {
    const bonsais = await bonsaiService.findAll()

    const sites = new Map<string, number>()
    const statuses = new Map<string, number>()
    const species = new Map<string, number>()

    bonsais.forEach(b => {
      sites.set(b.siteId, (sites.get(b.siteId) || 0) + 1)
      statuses.set(b.status, (statuses.get(b.status) || 0) + 1)
      species.set(b.species, (species.get(b.species) || 0) + 1)
    })

    const avgAge = bonsais.length > 0
      ? bonsais.reduce((sum, b) => sum + b.age, 0) / bonsais.length
      : 0

    res.json({
      total: bonsais.length,
      avgAge: Math.round(avgAge * 10) / 10,
      bySite: Object.fromEntries(sites),
      byStatus: Object.fromEntries(statuses),
      bySpecies: Object.fromEntries(species)
    })
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// ============================================
// Routes API - Sites
// ============================================

// GET /api/sites - Liste avec filtres
app.get('/api/sites', async (req: Request, res: Response) => {
  try {
    const filter: SiteFilter = {}
    if (req.query.type) filter.type = req.query.type as any
    if (req.query.location) filter.location = req.query.location as string
    if (req.query.minCapacity) filter.minCapacity = parseInt(req.query.minCapacity as string, 10)

    const sites = await siteService.findAll(Object.keys(filter).length > 0 ? filter : undefined)
    res.json(sites)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// GET /api/sites/:id - Détails
app.get('/api/sites/:id', async (req: Request, res: Response) => {
  try {
    const site = await siteService.findById(req.params.id)
    if (!site) {
      res.status(404).json({ error: 'Site not found' })
      return
    }
    res.json(site)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// POST /api/sites - Créer
app.post('/api/sites', async (req: Request, res: Response) => {
  try {
    const input: CreateSiteInput = req.body
    const site = await siteService.create(input)
    res.status(201).json(site)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// PUT /api/sites/:id - Modifier
app.put('/api/sites/:id', async (req: Request, res: Response) => {
  try {
    const input: UpdateSiteInput = req.body
    const site = await siteService.update(req.params.id, input)
    res.json(site)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// DELETE /api/sites/:id - Supprimer
app.delete('/api/sites/:id', async (req: Request, res: Response) => {
  try {
    await siteService.delete(req.params.id)
    res.status(204).send()
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// GET /api/sites/stats - Statistiques sites
app.get('/api/sites-stats', async (_req: Request, res: Response) => {
  try {
    const stats = await siteService.getStats()
    res.json(stats)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// Error monitoring endpoint
app.get('/api/errors', (_req: Request, res: Response) => {
  res.json({
    stats: errorLogger.getStats(),
    recentErrors: errorLogger.getLogs('error').slice(-10)
  })
})

// Request logging middleware
app.use((req: Request, _res: Response, next) => {
  errorLogger.info(`${req.method} ${req.path}`, {
    query: req.query,
    ip: req.ip
  })
  next()
})

// Global error handler with Sentry
app.use((err: Error, req: Request, res: Response, _next: NextFunction) => {
  // Log to Sentry in production
  if (process.env.SENTRY_DSN) {
    Sentry.captureException(err, {
      extra: {
        method: req.method,
        path: req.path,
        query: req.query,
      }
    })
  }

  // Log locally
  errorLogger.error(err.message, { stack: err.stack })

  // CORS errors
  if (err.message.includes('CORS')) {
    res.status(403).json({ error: 'CORS policy violation' })
    return
  }

  // Generic error response
  res.status(500).json({
    error: NODE_ENV === 'production' ? 'Internal server error' : err.message
  })
})

// Start server
seedData().then(() => {
  app.listen(PORT, () => {
    console.log(`
╔═══════════════════════════════════════════════════╗
║                                                   ║
║   🌳 BONSAI TRACKER - MVP Web                     ║
║   Test Framework Projet Claude Code               ║
║                                                   ║
║   Server: http://localhost:${PORT}                  ║
║   API:    http://localhost:${PORT}/api/bonsais      ║
║   Health: http://localhost:${PORT}/health           ║
║                                                   ║
║   Security:                                       ║
║   ✓ Helmet (headers)                              ║
║   ✓ CORS (${NODE_ENV === 'production' ? 'restricted' : 'dev mode'})                            ║
║   ✓ Rate Limit (${NODE_ENV === 'production' ? '100' : '1000'}/15min)                       ║
║   ${process.env.SENTRY_DSN ? '✓' : '○'} Sentry (${process.env.SENTRY_DSN ? 'active' : 'set SENTRY_DSN'})                       ║
║                                                   ║
╚═══════════════════════════════════════════════════╝
`)
  })
})
