/**
 * BonsaiService - Gestion des bonsaïs
 * Implémenté avec TDD (RED → GREEN → REFACTOR)
 * Supports both in-memory (testing) and SQLite (production) storage
 */

import type {
  Bonsai,
  CreateBonsaiInput,
  UpdateBonsaiInput,
  TransferBonsaiInput,
  BonsaiFilter
} from '../types/bonsai.js'
import { getDatabase } from '../db/database.js'
import type Database from 'better-sqlite3'

const USE_SQLITE = process.env.USE_SQLITE === 'true'

export class BonsaiService {
  private bonsais: Map<string, Bonsai> = new Map()
  private db: Database.Database | null = null

  constructor() {
    if (USE_SQLITE) {
      this.db = getDatabase()
    }
  }

  /**
   * Crée un nouveau bonsai
   * Chunk 1/6 - TDD DONE
   */
  async create(input: CreateBonsaiInput): Promise<Bonsai> {
    this.validateCreateInput(input)

    const now = new Date()
    const bonsai: Bonsai = {
      id: this.generateId(),
      species: input.species,
      age: input.age,
      siteId: input.siteId,
      status: input.status ?? 'healthy',
      acquisitionDate: input.acquisitionDate ?? now,
      metadata: input.metadata ?? {},
      createdAt: now,
      updatedAt: now
    }

    if (this.db) {
      const stmt = this.db.prepare(`
        INSERT INTO bonsais (id, species, age, site_id, status, acquisition_date, metadata, created_at, updated_at)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
      `)
      stmt.run(
        bonsai.id,
        bonsai.species,
        bonsai.age,
        bonsai.siteId,
        bonsai.status,
        bonsai.acquisitionDate.toISOString(),
        JSON.stringify(bonsai.metadata),
        bonsai.createdAt.toISOString(),
        bonsai.updatedAt.toISOString()
      )
    } else {
      this.bonsais.set(bonsai.id, bonsai)
    }

    return bonsai
  }

  /**
   * Met à jour un bonsai existant
   * Chunk 2/6 - TDD DONE
   */
  async update(id: string, input: UpdateBonsaiInput): Promise<Bonsai> {
    const bonsai = await this.findById(id)
    if (!bonsai) {
      throw new Error(`Bonsai not found: ${id}`)
    }

    const updated: Bonsai = {
      ...bonsai,
      ...(input.species && { species: input.species }),
      ...(input.age !== undefined && { age: input.age }),
      ...(input.status && { status: input.status }),
      ...(input.metadata && {
        metadata: { ...bonsai.metadata, ...input.metadata }
      }),
      updatedAt: new Date()
    }

    if (this.db) {
      const stmt = this.db.prepare(`
        UPDATE bonsais SET species = ?, age = ?, status = ?, metadata = ?, updated_at = ?
        WHERE id = ?
      `)
      stmt.run(
        updated.species,
        updated.age,
        updated.status,
        JSON.stringify(updated.metadata),
        updated.updatedAt.toISOString(),
        id
      )
    } else {
      this.bonsais.set(id, updated)
    }

    return updated
  }

  /**
   * Supprime un bonsai
   * Chunk 3/6 - TDD IN PROGRESS
   */
  async delete(id: string): Promise<boolean> {
    if (this.db) {
      const bonsai = await this.findById(id)
      if (!bonsai) {
        throw new Error(`Bonsai not found: ${id}`)
      }
      const stmt = this.db.prepare('DELETE FROM bonsais WHERE id = ?')
      const result = stmt.run(id)
      return result.changes > 0
    }

    const exists = this.bonsais.has(id)
    if (!exists) {
      throw new Error(`Bonsai not found: ${id}`)
    }
    return this.bonsais.delete(id)
  }

  /**
   * Trouve un bonsai par ID
   * Chunk 4/6 - TDD IN PROGRESS
   */
  async findById(id: string): Promise<Bonsai | null> {
    if (this.db) {
      const stmt = this.db.prepare('SELECT * FROM bonsais WHERE id = ?')
      const row = stmt.get(id) as any
      return row ? this.rowToBonsai(row) : null
    }
    return this.bonsais.get(id) ?? null
  }

  /**
   * Convert database row to Bonsai object
   */
  private rowToBonsai(row: any): Bonsai {
    return {
      id: row.id,
      species: row.species,
      age: row.age,
      siteId: row.site_id,
      status: row.status,
      acquisitionDate: new Date(row.acquisition_date),
      lastTransferDate: row.last_transfer_date ? new Date(row.last_transfer_date) : undefined,
      metadata: JSON.parse(row.metadata || '{}'),
      createdAt: new Date(row.created_at),
      updatedAt: new Date(row.updated_at)
    }
  }

  /**
   * Liste tous les bonsais avec filtres optionnels
   * Chunk 5/6 - TDD IN PROGRESS
   */
  async findAll(filter?: BonsaiFilter): Promise<Bonsai[]> {
    if (this.db) {
      let sql = 'SELECT * FROM bonsais WHERE 1=1'
      const params: any[] = []

      if (filter) {
        if (filter.siteId) {
          sql += ' AND site_id = ?'
          params.push(filter.siteId)
        }
        if (filter.status) {
          sql += ' AND status = ?'
          params.push(filter.status)
        }
        if (filter.species) {
          sql += ' AND LOWER(species) LIKE ?'
          params.push(`%${filter.species.toLowerCase()}%`)
        }
        if (filter.minAge !== undefined) {
          sql += ' AND age >= ?'
          params.push(filter.minAge)
        }
        if (filter.maxAge !== undefined) {
          sql += ' AND age <= ?'
          params.push(filter.maxAge)
        }
      }

      const stmt = this.db.prepare(sql)
      const rows = stmt.all(...params) as any[]
      return rows.map(row => this.rowToBonsai(row))
    }

    // In-memory fallback
    let results = Array.from(this.bonsais.values())

    if (filter) {
      if (filter.siteId) {
        results = results.filter(b => b.siteId === filter.siteId)
      }
      if (filter.status) {
        results = results.filter(b => b.status === filter.status)
      }
      if (filter.species) {
        results = results.filter(b =>
          b.species.toLowerCase().includes(filter.species!.toLowerCase())
        )
      }
      if (filter.minAge !== undefined) {
        results = results.filter(b => b.age >= filter.minAge!)
      }
      if (filter.maxAge !== undefined) {
        results = results.filter(b => b.age <= filter.maxAge!)
      }
    }

    return results
  }

  /**
   * Transfère un bonsai vers un autre site
   * Chunk 6/6 - TDD IN PROGRESS
   */
  async transfer(id: string, input: TransferBonsaiInput): Promise<Bonsai> {
    const bonsai = await this.findById(id)
    if (!bonsai) {
      throw new Error(`Bonsai not found: ${id}`)
    }

    if (bonsai.siteId === input.targetSiteId) {
      throw new Error(`Bonsai already at site: ${input.targetSiteId}`)
    }

    const now = new Date()
    const transferred: Bonsai = {
      ...bonsai,
      siteId: input.targetSiteId,
      lastTransferDate: now,
      updatedAt: now
    }

    if (this.db) {
      const stmt = this.db.prepare(`
        UPDATE bonsais SET site_id = ?, last_transfer_date = ?, updated_at = ?
        WHERE id = ?
      `)
      stmt.run(
        transferred.siteId,
        transferred.lastTransferDate!.toISOString(),
        transferred.updatedAt.toISOString(),
        id
      )
    } else {
      this.bonsais.set(id, transferred)
    }

    return transferred
  }

  // --- Private helpers ---

  private validateCreateInput(input: CreateBonsaiInput): void {
    if (!input.species?.trim()) {
      throw new Error('Species is required')
    }
    if (input.age < 0) {
      throw new Error('Age must be positive')
    }
    if (!input.siteId?.trim()) {
      throw new Error('Site ID is required')
    }
  }

  private generateId(): string {
    return `bonsai_${Date.now()}_${Math.random().toString(36).slice(2, 9)}`
  }
}
