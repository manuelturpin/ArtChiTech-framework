/**
 * BonsaiService - Gestion des bonsaïs
 * Implémenté avec TDD (RED → GREEN → REFACTOR)
 */

import type {
  Bonsai,
  CreateBonsaiInput,
  UpdateBonsaiInput,
  TransferBonsaiInput,
  BonsaiFilter
} from '../types/bonsai.js'

export class BonsaiService {
  private bonsais: Map<string, Bonsai> = new Map()

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

    this.bonsais.set(bonsai.id, bonsai)
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

    this.bonsais.set(id, updated)
    return updated
  }

  /**
   * Supprime un bonsai
   * Chunk 3/6 - TDD IN PROGRESS
   */
  async delete(id: string): Promise<boolean> {
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
    return this.bonsais.get(id) ?? null
  }

  /**
   * Liste tous les bonsais avec filtres optionnels
   * Chunk 5/6 - TDD IN PROGRESS
   */
  async findAll(filter?: BonsaiFilter): Promise<Bonsai[]> {
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

    this.bonsais.set(id, transferred)
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
