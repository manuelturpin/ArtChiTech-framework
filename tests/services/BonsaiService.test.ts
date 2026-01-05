/**
 * Tests BonsaiService
 * TDD: RED → GREEN → REFACTOR
 */

import { describe, it, expect, beforeEach } from 'vitest'
import { BonsaiService } from '../../src/services/BonsaiService.js'
import type { CreateBonsaiInput, BonsaiFilter } from '../../src/types/bonsai.js'

describe('BonsaiService', () => {
  let service: BonsaiService

  beforeEach(() => {
    service = new BonsaiService()
  })

  // ============================================
  // Chunk 1: create()
  // ============================================
  describe('create()', () => {
    it('creates a bonsai with required fields', async () => {
      const input: CreateBonsaiInput = {
        species: 'Ficus retusa',
        age: 5,
        siteId: 'site_001'
      }

      const bonsai = await service.create(input)

      expect(bonsai.id).toBeDefined()
      expect(bonsai.species).toBe('Ficus retusa')
      expect(bonsai.age).toBe(5)
      expect(bonsai.siteId).toBe('site_001')
      expect(bonsai.status).toBe('healthy')
      expect(bonsai.createdAt).toBeInstanceOf(Date)
    })

    it('creates a bonsai with optional fields', async () => {
      const input: CreateBonsaiInput = {
        species: 'Pinus thunbergii',
        age: 25,
        siteId: 'site_002',
        status: 'treatment',
        metadata: {
          style: 'moyogi',
          height: 45,
          origin: 'Japan'
        }
      }

      const bonsai = await service.create(input)

      expect(bonsai.status).toBe('treatment')
      expect(bonsai.metadata.style).toBe('moyogi')
      expect(bonsai.metadata.height).toBe(45)
    })

    it('throws error when species is missing', async () => {
      const input = { species: '', age: 5, siteId: 'site_001' }

      await expect(service.create(input)).rejects.toThrow('Species is required')
    })

    it('throws error when age is negative', async () => {
      const input = { species: 'Ficus', age: -1, siteId: 'site_001' }

      await expect(service.create(input)).rejects.toThrow('Age must be positive')
    })

    it('throws error when siteId is missing', async () => {
      const input = { species: 'Ficus', age: 5, siteId: '' }

      await expect(service.create(input)).rejects.toThrow('Site ID is required')
    })
  })

  // ============================================
  // Chunk 2: update()
  // ============================================
  describe('update()', () => {
    it('updates bonsai species', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_001'
      })

      const updated = await service.update(created.id, {
        species: 'Ficus retusa'
      })

      expect(updated.species).toBe('Ficus retusa')
      expect(updated.age).toBe(5) // unchanged
    })

    it('updates bonsai status', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_001'
      })

      const updated = await service.update(created.id, {
        status: 'sick'
      })

      expect(updated.status).toBe('sick')
    })

    it('merges metadata on update', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_001',
        metadata: { style: 'chokkan', notes: 'original' }
      })

      const updated = await service.update(created.id, {
        metadata: { height: 30 }
      })

      expect(updated.metadata.style).toBe('chokkan')
      expect(updated.metadata.height).toBe(30)
      expect(updated.metadata.notes).toBe('original')
    })

    it('throws error when bonsai not found', async () => {
      await expect(
        service.update('nonexistent', { species: 'Test' })
      ).rejects.toThrow('Bonsai not found')
    })

    it('updates updatedAt timestamp', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_001'
      })

      // Small delay to ensure different timestamp
      await new Promise(r => setTimeout(r, 10))

      const updated = await service.update(created.id, { age: 6 })

      expect(updated.updatedAt.getTime()).toBeGreaterThan(
        created.updatedAt.getTime()
      )
    })
  })

  // ============================================
  // Chunk 3: delete()
  // ============================================
  describe('delete()', () => {
    it('deletes an existing bonsai', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_001'
      })

      const result = await service.delete(created.id)

      expect(result).toBe(true)
      expect(await service.findById(created.id)).toBeNull()
    })

    it('throws error when bonsai not found', async () => {
      await expect(service.delete('nonexistent')).rejects.toThrow(
        'Bonsai not found'
      )
    })
  })

  // ============================================
  // Chunk 4: findById()
  // ============================================
  describe('findById()', () => {
    it('finds existing bonsai by id', async () => {
      const created = await service.create({
        species: 'Ficus retusa',
        age: 10,
        siteId: 'site_001'
      })

      const found = await service.findById(created.id)

      expect(found).not.toBeNull()
      expect(found!.species).toBe('Ficus retusa')
    })

    it('returns null for non-existent id', async () => {
      const found = await service.findById('nonexistent')

      expect(found).toBeNull()
    })
  })

  // ============================================
  // Chunk 5: findAll()
  // ============================================
  describe('findAll()', () => {
    beforeEach(async () => {
      await service.create({ species: 'Ficus retusa', age: 5, siteId: 'site_A' })
      await service.create({ species: 'Pinus thunbergii', age: 25, siteId: 'site_A', status: 'treatment' })
      await service.create({ species: 'Juniperus chinensis', age: 15, siteId: 'site_B' })
      await service.create({ species: 'Ficus microcarpa', age: 8, siteId: 'site_B', status: 'sick' })
    })

    it('returns all bonsais without filter', async () => {
      const all = await service.findAll()

      expect(all).toHaveLength(4)
    })

    it('filters by siteId', async () => {
      const results = await service.findAll({ siteId: 'site_A' })

      expect(results).toHaveLength(2)
      expect(results.every(b => b.siteId === 'site_A')).toBe(true)
    })

    it('filters by status', async () => {
      const results = await service.findAll({ status: 'sick' })

      expect(results).toHaveLength(1)
      expect(results[0].species).toBe('Ficus microcarpa')
    })

    it('filters by species (partial match)', async () => {
      const results = await service.findAll({ species: 'ficus' })

      expect(results).toHaveLength(2)
    })

    it('filters by age range', async () => {
      const results = await service.findAll({ minAge: 10, maxAge: 20 })

      expect(results).toHaveLength(1)
      expect(results[0].species).toBe('Juniperus chinensis')
    })

    it('combines multiple filters', async () => {
      const results = await service.findAll({
        siteId: 'site_A',
        minAge: 10
      })

      expect(results).toHaveLength(1)
      expect(results[0].species).toBe('Pinus thunbergii')
    })
  })

  // ============================================
  // Chunk 6: transfer()
  // ============================================
  describe('transfer()', () => {
    it('transfers bonsai to another site', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_A'
      })

      const transferred = await service.transfer(created.id, {
        targetSiteId: 'site_B'
      })

      expect(transferred.siteId).toBe('site_B')
      expect(transferred.lastTransferDate).toBeInstanceOf(Date)
    })

    it('throws error when bonsai not found', async () => {
      await expect(
        service.transfer('nonexistent', { targetSiteId: 'site_B' })
      ).rejects.toThrow('Bonsai not found')
    })

    it('throws error when transferring to same site', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_A'
      })

      await expect(
        service.transfer(created.id, { targetSiteId: 'site_A' })
      ).rejects.toThrow('Bonsai already at site')
    })

    it('updates the bonsai in storage after transfer', async () => {
      const created = await service.create({
        species: 'Ficus',
        age: 5,
        siteId: 'site_A'
      })

      await service.transfer(created.id, { targetSiteId: 'site_B' })

      const found = await service.findById(created.id)
      expect(found!.siteId).toBe('site_B')
    })
  })
})
