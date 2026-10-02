import { Pool } from 'pg'

/**
 * Σύνδεση με τη βάση του site (Supabase «Goodland Site», schema `site`).
 * Μόνο μέσω DATABASE_URL — κανένα SDK του Supabase.
 *
 * Transaction pooler (port 6543): ένα pool ανά serverless instance, μικρό,
 * και χωρίς named prepared statements (το pg δεν τα χρησιμοποιεί αν δεν του
 * δώσεις `name`, οπότε είμαστε εντάξει).
 */
const g = globalThis as unknown as { __glPool?: Pool }

export function hasDb(): boolean {
  return !!process.env.DATABASE_URL
}

export function db(): Pool {
  if (!g.__glPool) {
    const url = process.env.DATABASE_URL
    if (!url) throw new Error('Λείπει το DATABASE_URL')
    g.__glPool = new Pool({
      connectionString: url,
      max: 3,
      idleTimeoutMillis: 10_000,
      connectionTimeoutMillis: 8_000,
      // Το Supabase απαιτεί TLS· το πιστοποιητικό του pooler δεν είναι στο
      // default trust store του Node, άρα κρυπτογράφηση χωρίς έλεγχο αλυσίδας.
      ssl: { rejectUnauthorized: false },
    })
  }
  return g.__glPool
}
