/**
 * Types pour le module Bonsai
 * SaaS B2B - Traçabilité bonsaïs multi-sites
 */

export interface Bonsai {
  id: string
  species: string
  age: number
  siteId: string
  status: BonsaiStatus
  acquisitionDate: Date
  lastTransferDate?: Date
  metadata: BonsaiMetadata
  createdAt: Date
  updatedAt: Date
}

export type BonsaiStatus = 'healthy' | 'sick' | 'treatment' | 'quarantine' | 'sold'

export interface BonsaiMetadata {
  origin?: string
  style?: string
  height?: number
  potType?: string
  notes?: string
}

export interface CreateBonsaiInput {
  species: string
  age: number
  siteId: string
  status?: BonsaiStatus
  acquisitionDate?: Date
  metadata?: Partial<BonsaiMetadata>
}

export interface UpdateBonsaiInput {
  species?: string
  age?: number
  status?: BonsaiStatus
  metadata?: Partial<BonsaiMetadata>
}

export interface TransferBonsaiInput {
  targetSiteId: string
  reason?: string
}

export interface BonsaiFilter {
  siteId?: string
  status?: BonsaiStatus
  species?: string
  minAge?: number
  maxAge?: number
}
