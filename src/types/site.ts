/**
 * Types pour le module Site
 * SaaS B2B - Gestion des sites de pepiniere
 */

export interface Site {
  id: string
  name: string
  location: string
  capacity: number
  type: SiteType
  contact?: SiteContact
  metadata: SiteMetadata
  createdAt: Date
  updatedAt: Date
}

export type SiteType = 'pepiniere' | 'showroom' | 'stockage' | 'vente'

export interface SiteContact {
  name?: string
  phone?: string
  email?: string
}

export interface SiteMetadata {
  description?: string
  address?: string
  gpsCoords?: {
    lat: number
    lng: number
  }
  notes?: string
}

export interface CreateSiteInput {
  name: string
  location: string
  capacity: number
  type?: SiteType
  contact?: SiteContact
  metadata?: Partial<SiteMetadata>
}

export interface UpdateSiteInput {
  name?: string
  location?: string
  capacity?: number
  type?: SiteType
  contact?: SiteContact
  metadata?: Partial<SiteMetadata>
}

export interface SiteFilter {
  type?: SiteType
  location?: string
  minCapacity?: number
}
