/**
 * Tests SiteService - TDD
 * RED → GREEN → REFACTOR
 */

import { describe, it, expect, beforeEach } from 'vitest'
import { SiteService } from '../src/services/SiteService.js'
import type { CreateSiteInput, UpdateSiteInput, SiteFilter } from '../src/types/site.js'

describe('SiteService', () => {
  let service: SiteService

  beforeEach(() => {
    service = new SiteService()
  })

  // ============================================
  // CHUNK 1: create() - Création de site
  // ============================================
  describe('create()', () => {
    it('should create a site with required fields', async () => {
      const input: CreateSiteInput = {
        name: 'Pepiniere Nord',
        location: 'Saint-Denis',
        capacity: 100
      }

      const site = await service.create(input)

      expect(site.id).toBeDefined()
      expect(site.name).toBe('Pepiniere Nord')
      expect(site.location).toBe('Saint-Denis')
      expect(site.capacity).toBe(100)
      expect(site.type).toBe('pepiniere') // default
      expect(site.createdAt).toBeInstanceOf(Date)
      expect(site.updatedAt).toBeInstanceOf(Date)
    })

    it('should create a site with custom type', async () => {
      const input: CreateSiteInput = {
        name: 'Showroom Centre',
        location: 'Saint-Pierre',
        capacity: 50,
        type: 'showroom'
      }

      const site = await service.create(input)

      expect(site.type).toBe('showroom')
    })

    it('should create a site with contact info', async () => {
      const input: CreateSiteInput = {
        name: 'Test Site',
        location: 'Test Location',
        capacity: 25,
        contact: {
          name: 'Jean Dupont',
          phone: '0692123456',
          email: 'jean@example.com'
        }
      }

      const site = await service.create(input)

      expect(site.contact).toEqual({
        name: 'Jean Dupont',
        phone: '0692123456',
        email: 'jean@example.com'
      })
    })

    it('should throw error if name is empty', async () => {
      const input: CreateSiteInput = {
        name: '',
        location: 'Test',
        capacity: 10
      }

      await expect(service.create(input)).rejects.toThrow('name is required')
    })

    it('should throw error if capacity is negative', async () => {
      const input: CreateSiteInput = {
        name: 'Test',
        location: 'Test',
        capacity: -5
      }

      await expect(service.create(input)).rejects.toThrow('capacity must be positive')
    })
  })

  // ============================================
  // CHUNK 2: update() - Modification de site
  // ============================================
  describe('update()', () => {
    it('should update site name', async () => {
      const site = await service.create({
        name: 'Original Name',
        location: 'Test',
        capacity: 50
      })

      const updated = await service.update(site.id, { name: 'New Name' })

      expect(updated.name).toBe('New Name')
      expect(updated.updatedAt.getTime()).toBeGreaterThanOrEqual(site.updatedAt.getTime())
    })

    it('should update site capacity', async () => {
      const site = await service.create({
        name: 'Test',
        location: 'Test',
        capacity: 50
      })

      const updated = await service.update(site.id, { capacity: 100 })

      expect(updated.capacity).toBe(100)
    })

    it('should merge metadata on update', async () => {
      const site = await service.create({
        name: 'Test',
        location: 'Test',
        capacity: 50,
        metadata: { description: 'Original' }
      })

      const updated = await service.update(site.id, {
        metadata: { notes: 'New note' }
      })

      expect(updated.metadata.description).toBe('Original')
      expect(updated.metadata.notes).toBe('New note')
    })

    it('should throw error for non-existent site', async () => {
      await expect(service.update('non-existent', { name: 'Test' }))
        .rejects.toThrow('Site not found: non-existent')
    })
  })

  // ============================================
  // CHUNK 3: delete() - Suppression de site
  // ============================================
  describe('delete()', () => {
    it('should delete existing site', async () => {
      const site = await service.create({
        name: 'To Delete',
        location: 'Test',
        capacity: 10
      })

      const result = await service.delete(site.id)

      expect(result).toBe(true)
      await expect(service.findById(site.id)).resolves.toBeUndefined()
    })

    it('should throw error for non-existent site', async () => {
      await expect(service.delete('non-existent'))
        .rejects.toThrow('Site not found: non-existent')
    })
  })

  // ============================================
  // CHUNK 4: findById() - Recherche par ID
  // ============================================
  describe('findById()', () => {
    it('should find site by id', async () => {
      const created = await service.create({
        name: 'Find Me',
        location: 'Somewhere',
        capacity: 30
      })

      const found = await service.findById(created.id)

      expect(found).toBeDefined()
      expect(found?.name).toBe('Find Me')
    })

    it('should return undefined for non-existent id', async () => {
      const found = await service.findById('non-existent')
      expect(found).toBeUndefined()
    })
  })

  // ============================================
  // CHUNK 5: findAll() - Liste avec filtres
  // ============================================
  describe('findAll()', () => {
    beforeEach(async () => {
      // Créer des sites de test
      await service.create({ name: 'Pepiniere A', location: 'Nord', capacity: 100, type: 'pepiniere' })
      await service.create({ name: 'Showroom B', location: 'Sud', capacity: 50, type: 'showroom' })
      await service.create({ name: 'Pepiniere C', location: 'Nord', capacity: 200, type: 'pepiniere' })
    })

    it('should return all sites without filter', async () => {
      const sites = await service.findAll()
      expect(sites).toHaveLength(3)
    })

    it('should filter by type', async () => {
      const sites = await service.findAll({ type: 'pepiniere' })
      expect(sites).toHaveLength(2)
      expect(sites.every(s => s.type === 'pepiniere')).toBe(true)
    })

    it('should filter by location', async () => {
      const sites = await service.findAll({ location: 'Nord' })
      expect(sites).toHaveLength(2)
    })

    it('should filter by minimum capacity', async () => {
      const sites = await service.findAll({ minCapacity: 100 })
      expect(sites).toHaveLength(2)
      expect(sites.every(s => s.capacity >= 100)).toBe(true)
    })
  })

  // ============================================
  // CHUNK 6: getStats() - Statistiques
  // ============================================
  describe('getStats()', () => {
    beforeEach(async () => {
      await service.create({ name: 'Site A', location: 'Nord', capacity: 100, type: 'pepiniere' })
      await service.create({ name: 'Site B', location: 'Sud', capacity: 50, type: 'showroom' })
      await service.create({ name: 'Site C', location: 'Est', capacity: 75, type: 'pepiniere' })
    })

    it('should return total count', async () => {
      const stats = await service.getStats()
      expect(stats.total).toBe(3)
    })

    it('should return count by type', async () => {
      const stats = await service.getStats()
      expect(stats.byType.pepiniere).toBe(2)
      expect(stats.byType.showroom).toBe(1)
    })

    it('should return total capacity', async () => {
      const stats = await service.getStats()
      expect(stats.totalCapacity).toBe(225)
    })

    it('should return count by location', async () => {
      const stats = await service.getStats()
      expect(stats.byLocation.Nord).toBe(1)
      expect(stats.byLocation.Sud).toBe(1)
      expect(stats.byLocation.Est).toBe(1)
    })
  })
})
