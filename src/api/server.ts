/**
 * API REST - Bonsai Tracker MVP
 * Test du framework en conditions réelles
 */

import express, { Request, Response } from 'express'
import cors from 'cors'
import path from 'path'
import { fileURLToPath } from 'url'
import { BonsaiService } from '../services/BonsaiService.js'
import type { CreateBonsaiInput, UpdateBonsaiInput, TransferBonsaiInput, BonsaiFilter } from '../types/bonsai.js'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const app = express()
const service = new BonsaiService()
const PORT = process.env.PORT || 3000

// Middleware
app.use(cors())
app.use(express.json())
app.use(express.static(path.join(__dirname, '../../public')))

// Seed data
async function seedData() {
  await service.create({ species: 'Ficus retusa', age: 8, siteId: 'pepiniere-nord', metadata: { style: 'moyogi', origin: 'Taiwan', height: 35 } })
  await service.create({ species: 'Pinus thunbergii', age: 25, siteId: 'pepiniere-nord', status: 'treatment', metadata: { style: 'chokkan', height: 60 } })
  await service.create({ species: 'Juniperus chinensis', age: 15, siteId: 'pepiniere-sud', metadata: { style: 'shakan', height: 45, origin: 'China' } })
  await service.create({ species: 'Acer palmatum', age: 12, siteId: 'pepiniere-sud', metadata: { style: 'moyogi', origin: 'Japan', height: 40 } })
  await service.create({ species: 'Zelkova serrata', age: 18, siteId: 'pepiniere-est', status: 'healthy', metadata: { style: 'hokidachi', height: 55 } })
  await service.create({ species: 'Carmona microphylla', age: 5, siteId: 'pepiniere-nord', metadata: { style: 'informal', height: 20, notes: 'Débutant' } })
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

    const bonsais = await service.findAll(Object.keys(filter).length > 0 ? filter : undefined)
    res.json(bonsais)
  } catch (err) {
    res.status(500).json({ error: (err as Error).message })
  }
})

// GET /api/bonsais/:id - Détails
app.get('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    const bonsai = await service.findById(req.params.id)
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
    const bonsai = await service.create(input)
    res.status(201).json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// PUT /api/bonsais/:id - Modifier
app.put('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    const input: UpdateBonsaiInput = req.body
    const bonsai = await service.update(req.params.id, input)
    res.json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// POST /api/bonsais/:id/transfer - Transférer
app.post('/api/bonsais/:id/transfer', async (req: Request, res: Response) => {
  try {
    const input: TransferBonsaiInput = req.body
    const bonsai = await service.transfer(req.params.id, input)
    res.json(bonsai)
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// DELETE /api/bonsais/:id - Supprimer
app.delete('/api/bonsais/:id', async (req: Request, res: Response) => {
  try {
    await service.delete(req.params.id)
    res.status(204).send()
  } catch (err) {
    res.status(400).json({ error: (err as Error).message })
  }
})

// GET /api/stats - Statistiques
app.get('/api/stats', async (_req: Request, res: Response) => {
  try {
    const bonsais = await service.findAll()

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
║                                                   ║
╚═══════════════════════════════════════════════════╝
`)
  })
})
