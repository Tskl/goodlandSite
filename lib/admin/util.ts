import { translit } from '@/lib/greek'

/** Κείμενο από φόρμα: κενό → null. */
export function str(fd: FormData, k: string): string | null {
  const v = fd.get(k)
  if (typeof v !== 'string') return null
  const t = v.trim()
  return t === '' ? null : t
}

export function num(fd: FormData, k: string): number | null {
  const v = str(fd, k)
  if (v == null) return null
  const n = Number(v)
  return Number.isFinite(n) ? n : null
}

/** «295.000», «295000», «295.000 €» → 295000. Κενό → null. */
export function parsePrice(v: string | null): number | null {
  if (!v) return null
  const n = Number(v.replace(/[^\d]/g, ''))
  if (!Number.isFinite(n) || n <= 0) throw new Error('Η τιμή πρέπει να είναι θετικός αριθμός (π.χ. 295000).')
  return n
}

/** «76,9» → 76.9 */
export function parseSqm(v: string | null): number {
  const n = Number((v ?? '').replace(',', '.').replace(/[^\d.]/g, ''))
  if (!Number.isFinite(n) || n <= 0) throw new Error('Τα τετραγωνικά πρέπει να είναι θετικός αριθμός.')
  return n
}

/** «1» → [1] · «4-5» → [4,5] · «Ισόγειο» / «0» → [0] · «5,6» → [5,6] */
export function parseFloors(v: string | null): number[] {
  if (!v) return []
  const t = v.trim().toLowerCase()
  if (/^(ισ|ισόγειο|ισογειο|ground|g)$/.test(t)) return [0]
  const nums = t.split(/[^0-9]+/).filter(Boolean).map(Number)
  if (!nums.length) throw new Error('Όροφος: γράψε αριθμό (π.χ. 3), εύρος για μεζονέτα (π.χ. 4-5) ή «Ισόγειο».')
  if (nums.length === 2 && /-/.test(t) && nums[1] > nums[0]) {
    const out: number[] = []
    for (let i = nums[0]; i <= nums[1]; i++) out.push(i)
    return out
  }
  return [...new Set(nums)].sort((a, b) => a - b)
}

export function floorsText(f: number[] | null | undefined): string {
  if (!f || !f.length) return ''
  if (f.length === 1 && f[0] === 0) return 'Ισόγειο'
  return f.length > 1 ? `${f[0]}-${f[f.length - 1]}` : String(f[0])
}

/** «Γλυφάδας 10» + «Γλυφάδα» → «glyfadas-10-glyfada» */
export function slugify(...parts: string[]): string {
  return translit(parts.join(' '))
    .toLowerCase()
    .replace(/&/g, ' ')
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 80)
}

/** Μήνυμα σφάλματος για τον χρήστη: τα μηνύματα των triggers είναι ήδη ελληνικά. */
export function userMessage(e: unknown): string {
  const err = e as { message?: string; code?: string; constraint?: string }
  const m = (err?.message ?? 'Κάτι πήγε στραβά.')
    // «στους {4,5}» από τη βάση → «στους ορόφους 4-5»
    .replace(/στους \{([\d,]*)\}/, (_, x: string) => `στους ορόφους ${x.split(',').map((n) => (n === '0' ? 'ισόγειο' : n)).join('-') || '—'}`)
    .replace(/στον όροφο 0\b/, 'στο ισόγειο')
  if (err?.code === '23505' && /slug/.test(err.constraint ?? m)) return 'Υπάρχει ήδη σελίδα με αυτό το URL.'
  if (err?.code === '23514' && !/[α-ω]/i.test(m)) return 'Κάποια τιμή δεν είναι αποδεκτή. Έλεγξε τα πεδία.'
  return m
}

export const UNIT_TYPES: [string, string][] = [
  ['apartment', 'Διαμέρισμα'],
  ['maisonette', 'Μεζονέτα'],
  ['loft-apartment', 'Διαμέρισμα με σοφίτα'],
]

export const STATUSES: [string, string][] = [
  ['available', 'Διαθέσιμο'],
  ['reserved', 'Κρατημένο'],
  ['sold', 'Πουλήθηκε'],
]

export const ENERGY = ['Α+', 'Α', 'Β+', 'Β', 'Γ', 'Δ', 'Ε', 'Ζ', 'Η']

export function euro(n: number | null | undefined): string {
  return n ? `${String(n).replace(/\B(?=(\d{3})+(?!\d))/g, '.')} €` : ''
}
