/**
 * Database Module - SQLite Configuration
 * Bonsai Tracker MVP
 */

import Database from 'better-sqlite3'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

// Database path: ./data/bonsai.db (relative to project root)
const DB_PATH = process.env.DB_PATH || path.join(__dirname, '../../data/bonsai.db')
const USE_MEMORY = process.env.DB_MEMORY === 'true'

let db: Database.Database | null = null

/**
 * Initialize database connection
 */
export function initDatabase(): Database.Database {
  if (db) return db

  // Use in-memory for tests, file for production
  const dbPath = USE_MEMORY ? ':memory:' : DB_PATH

  db = new Database(dbPath)
  db.pragma('journal_mode = WAL')
  db.pragma('foreign_keys = ON')

  // Create tables
  createTables(db)

  console.log(`✓ Database initialized: ${USE_MEMORY ? 'in-memory' : dbPath}`)
  return db
}

/**
 * Get database instance
 */
export function getDatabase(): Database.Database {
  if (!db) {
    return initDatabase()
  }
  return db
}

/**
 * Close database connection
 */
export function closeDatabase(): void {
  if (db) {
    db.close()
    db = null
  }
}

/**
 * Create database tables using better-sqlite3's exec method (not child_process)
 * Note: db.exec() is SQLite's method to run SQL, not shell command execution
 */
function createTables(database: Database.Database): void {
  // Sites table
  database.exec(`
    CREATE TABLE IF NOT EXISTS sites (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      location TEXT NOT NULL,
      capacity INTEGER NOT NULL DEFAULT 0,
      type TEXT NOT NULL DEFAULT 'pepiniere',
      contact TEXT,
      metadata TEXT DEFAULT '{}',
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    )
  `)

  // Bonsais table
  database.exec(`
    CREATE TABLE IF NOT EXISTS bonsais (
      id TEXT PRIMARY KEY,
      species TEXT NOT NULL,
      age INTEGER NOT NULL,
      site_id TEXT NOT NULL,
      status TEXT NOT NULL DEFAULT 'healthy',
      acquisition_date TEXT NOT NULL,
      last_transfer_date TEXT,
      metadata TEXT DEFAULT '{}',
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY (site_id) REFERENCES sites(id)
    )
  `)

  // Indexes for performance
  database.exec(`
    CREATE INDEX IF NOT EXISTS idx_bonsais_site ON bonsais(site_id);
    CREATE INDEX IF NOT EXISTS idx_bonsais_status ON bonsais(status);
    CREATE INDEX IF NOT EXISTS idx_bonsais_species ON bonsais(species);
    CREATE INDEX IF NOT EXISTS idx_sites_type ON sites(type);
    CREATE INDEX IF NOT EXISTS idx_sites_location ON sites(location);
  `)
}

/**
 * Reset database (for testing)
 */
export function resetDatabase(): void {
  if (db) {
    db.exec('DELETE FROM bonsais')
    db.exec('DELETE FROM sites')
  }
}

export default {
  initDatabase,
  getDatabase,
  closeDatabase,
  resetDatabase
}
