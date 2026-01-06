/**
 * SiteService - Gestion des sites
 * Implémenté avec TDD (RED -> GREEN -> REFACTOR)
 * Supports both in-memory (testing) and SQLite (production) storage
 */

import type {
  Site,
  CreateSiteInput,
  UpdateSiteInput,
  SiteFilter
} from '../types/site.js'
import { getDatabase } from '../db/database.js'
import type Database from 'better-sqlite3'

const USE_SQLITE = process.env.USE_SQLITE === 'true'

export interface SiteStats {
  total: number
  totalCapacity: number
  byType: Record<string, number>
  byLocation: Record<string, number>
}

export class SiteService {
  private sites: Map<string, Site> = new Map()
  private db: Database.Database | null = null

  constructor() {
    if (USE_SQLITE) {
      this.db = getDatabase()
    }
  }

  /**
   * Convert database row to Site object
   */
  private rowToSite(row: any): Site {
    return {
      id: row.id,
      name: row.name,
      location: row.location,
      capacity: row.capacity,
      type: row.type,
      contact: row.contact,
      metadata: JSON.parse(row.metadata || '{}'),
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at)
    }
  }

  /**
   * Crée un nouveau site
   * Chunk 1/6 - TDD
   */
  async create(input: CreateSiteInput): Promise<Site> {
    this.validateCreateInput(input)

    const now = new Date()
    const site: Site = {
      id: this.generateId(),
      name: input.name,
      location: input.location,
      capacity: input.capacity,
      type: input.type ?? 'pepiniere',
      contact: input.contact,
      metadata: input.metadata ?? {},
      createdAt: now,
      updatedAt: now
    }

    if (this.db) {
      const stmt = this.db.prepare(`
        INSERT INTO sites (id, name, location, capacity, type, contact, metadata, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      `)
      stmt.run(
        site.id,
        site.name,
        site.location,
        site.capacity,
        site.type,
        site.contact || null,
        JSON.stringify(site.metadata),
        site.createdAt.toISOString(),
        site.updatedAt.toISOString()
      )
    } else {
      this.sites.set(site.id, site)
    }

    return site
  }

  /**
   * Met à jour un site existant
   * Chunk 2/6 - TDD
   */
  async update(id: string, input: UpdateSiteInput): Promise<Site> {
    const site = await this.findById(id)
    if (!site) {
      throw new Error(`Site not found: ${id}`)
    }

    const updated: Site = {
      ...site,
      ...(input.name && { name: input.name }),
      ...(input.location && { location: input.location }),
      ...(input.capacity !== undefined && { capacity: input.capacity }),
      ...(input.type && { type: input.type }),
      ...(input.contact && { contact: input.contact }),
      ...(input.metadata && {
        metadata: { ...site.metadata, ...input.metadata }
      }),
      updatedAt: new Date()
    }

    if (this.db) {
      const stmt = this.db.prepare(`
        UPDATE sites SET name = ?, location = ?, capacity = ?, type = ?, contact = ?, metadata = ?, updated_at = ?
        WHERE id = ?
      `)
      stmt.run(
        updated.name,
        updated.location,
        updated.capacity,
        updated.type,
        updated.contact || null,
        JSON.stringify(updated.metadata),
        updated.updatedAt.toISOString(),
        id
      )
    } else {
      this.sites.set(id, updated)
    }

    return updated
  }

  /**
   * Supprime un site
   * Chunk 3/6 - TDD
   */
  async delete(id: string): Promise<boolean> {
    if (this.db) {
      const site = await this.findById(id)
      if (!site) {
        throw new Error(`Site not found: ${id}`)
      }
      const stmt = this.db.prepare('DELETE FROM sites WHERE id = ?')
      const result = stmt.run(id)
      return result.changes > 0
    }

    const exists = this.sites.has(id)
    if (!exists) {
      throw new Error(`Site not found: ${id}`)
    }
    return this.sites.delete(id)
  }

  /**
   * Trouve un site par ID
   * Chunk 4/6 - TDD
   */
  async findById(id: string): Promise<Site | undefined> {
    if (this.db) {
      const stmt = this.db.prepare('SELECT * FROM sites WHERE id = ?')
      const row = stmt.get(id) as any
      return row ? this.rowToSite(row) : undefined
    }
    return this.sites.get(id)
  }

  /**
   * Liste les sites avec filtres optionnels
   * Chunk 5/6 - TDD
   */
  async findAll(filter?: SiteFilter): Promise<Site[]> {
    if (this.db) {
      let sql = 'SELECT * FROM sites WHERE 1=1'
      const params: any[] = []

      if (filter) {
        if (filter.type) {
          sql += ' AND type = ?'
          params.push(filter.type)
        }
        if (filter.location) {
          sql += ' AND location = ?'
          params.push(filter.location)
        }
        if (filter.minCapacity !== undefined) {
          sql += ' AND capacity >= ?'
          params.push(filter.minCapacity)
        }
      }

      const stmt = this.db.prepare(sql)
      const rows = stmt.all(...params) as any[]
      return rows.map(row => this.rowToSite(row))
    }

    // In-memory fallback
    let sites = Array.from(this.sites.values())

    if (filter) {
      if (filter.type) {
        sites = sites.filter(s => s.type === filter.type)
      }
      if (filter.location) {
        sites = sites.filter(s => s.location === filter.location)
      }
      if (filter.minCapacity !== undefined) {
        sites = sites.filter(s => s.capacity >= filter.minCapacity!)
      }
    }

    return sites
  }

  /**
   * Statistiques des sites
   * Chunk 6/6 - TDD
   */
  async getStats(): Promise<SiteStats> {
    const sites = await this.findAll()

    const byType: Record<string, number> = {}
    const byLocation: Record<string, number> = {}
    let totalCapacity = 0

    for (const site of sites) {
      byType[site.type] = (byType[site.type] || 0) + 1
      byLocation[site.location] = (byLocation[site.location] || 0) + 1
      totalCapacity += site.capacity
    }

    return {
      total: sites.length,
      totalCapacity,
      byType,
      byLocation
    }
  }

  // === Private Methods ===

  private validateCreateInput(input: CreateSiteInput): void {
    if (!input.name || input.name.trim() === '') {
      throw new Error('name is required')
    }
    if (!input.location || input.location.trim() === '') {
      throw new Error('location is required')
    }
    if (input.capacity < 0) {
      throw new Error('capacity must be positive')
    }
  }

  private generateId(): string {
    return `site-${Date.now()}-${Math.random().toString(36).slice(2, 8)}`
  }
}
