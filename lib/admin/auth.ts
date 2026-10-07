import { createHash, createHmac, randomBytes, scrypt as scryptCb, timingSafeEqual } from 'node:crypto'
import { promisify } from 'node:util'
import { cookies } from 'next/headers'
import { redirect } from 'next/navigation'
import { db } from '@/lib/db'

/**
 * Σύνδεση στο admin — χωρίς εξωτερικά πακέτα.
 *   κωδικός:  scrypt (node:crypto) με τυχαίο salt
 *   session:  cookie «id.λήξη.υπογραφή», υπογραφή HMAC-SHA256
 * Κλειδί υπογραφής: ADMIN_SECRET αν υπάρχει, αλλιώς παράγεται από το
 * DATABASE_URL (αλλάζει ο κωδικός της βάσης → αποσυνδέονται όλοι, που είναι σωστό).
 */
const scrypt = promisify(scryptCb) as (pw: string, salt: Buffer, len: number) => Promise<Buffer>

const COOKIE = 'gl_admin'
const DAYS = 30

export type Admin = { id: number; username: string; displayName: string }

function secret(): Buffer {
  const s = process.env.ADMIN_SECRET || `gl-admin:${process.env.DATABASE_URL ?? ''}`
  return createHash('sha256').update(s).digest()
}

// ── Κωδικοί ─────────────────────────────────────────────────────────
export async function hashPassword(pw: string): Promise<string> {
  const salt = randomBytes(16)
  const key = await scrypt(pw, salt, 64)
  return `scrypt$${salt.toString('base64')}$${key.toString('base64')}`
}

export async function verifyPassword(pw: string, stored: string): Promise<boolean> {
  const [alg, saltB64, keyB64] = stored.split('$')
  if (alg !== 'scrypt' || !saltB64 || !keyB64) return false
  const want = Buffer.from(keyB64, 'base64')
  const got = await scrypt(pw, Buffer.from(saltB64, 'base64'), want.length)
  return got.length === want.length && timingSafeEqual(got, want)
}

export function passwordProblem(pw: string): string | null {
  if (pw.length < 10) return 'Ο κωδικός θέλει τουλάχιστον 10 χαρακτήρες.'
  if (!/[0-9]/.test(pw) || !/[^0-9]/.test(pw)) return 'Ο κωδικός θέλει και γράμματα και αριθμούς.'
  return null
}

// ── Session ─────────────────────────────────────────────────────────
function sign(data: string): string {
  return createHmac('sha256', secret()).update(data).digest('base64url')
}

export async function startSession(adminId: number) {
  const exp = Math.floor(Date.now() / 1000) + DAYS * 86400
  const data = `${adminId}.${exp}`
  ;(await cookies()).set(COOKIE, `${data}.${sign(data)}`, {
    httpOnly: true,
    secure: process.env.NODE_ENV === 'production',
    sameSite: 'lax',
    path: '/',
    maxAge: DAYS * 86400,
  })
}

export async function endSession() {
  ;(await cookies()).delete(COOKIE)
}

/** Ο συνδεδεμένος χρήστης, ή null. */
export async function getAdmin(): Promise<Admin | null> {
  const raw = (await cookies()).get(COOKIE)?.value
  if (!raw) return null
  const [id, exp, sig] = raw.split('.')
  if (!id || !exp || !sig) return null
  const good = Buffer.from(sign(`${id}.${exp}`))
  const given = Buffer.from(sig)
  if (good.length !== given.length || !timingSafeEqual(good, given)) return null
  if (Number(exp) < Date.now() / 1000) return null
  const { rows } = await db().query(
    'SELECT id, username, display_name FROM site.admins WHERE id = $1 AND is_active',
    [Number(id)],
  )
  if (!rows[0]) return null
  return { id: Number(rows[0].id), username: rows[0].username, displayName: rows[0].display_name }
}

/** Για σελίδες και actions του admin: χωρίς σύνδεση → /admin/login. */
export async function requireAdmin(): Promise<Admin> {
  const a = await getAdmin()
  if (!a) redirect('/admin/login')
  return a
}

/** Ο κωδικός της βάσης, όπως είναι μέσα στο DATABASE_URL — για το πρώτο στήσιμο. */
export function databasePassword(): string {
  try {
    return decodeURIComponent(new URL(process.env.DATABASE_URL ?? '').password)
  } catch {
    return ''
  }
}

export function sameSecret(a: string, b: string): boolean {
  const x = createHash('sha256').update(a).digest()
  const y = createHash('sha256').update(b).digest()
  return timingSafeEqual(x, y) && a.length > 0
}
