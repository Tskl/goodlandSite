/**
 * Το «καθαρό» κομμάτι της αναζήτησης — χωρίς εξαρτήσεις, ώστε να μπαίνει
 * και στον browser (components/Search) χωρίς να κουβαλάει τίποτα άλλο.
 */
export type Kind = 'page' | 'property' | 'unit' | 'area' | 'interior'
export type Hit = {
  k: Kind
  title: string
  sub: string
  href: string
  /** κείμενο για ταίριασμα, ήδη κανονικοποιημένο */
  q: string
  /** βαρύτητα στην ταξινόμηση (μεγαλύτερο = πιο πάνω) */
  w: number
  /** μόνο για διαμερίσματα: για «2 υπνοδωμάτια», «80 τμ» */
  bd?: number
  sqm?: number
}

/**
 * Ταίριασμα ερωτήματος — κοινό για browser και server.
 * Καταλαβαίνει «2 υπνοδωμάτια» / «2 bedrooms» (ακριβώς 2, «4» = 4+),
 * «80 τμ» / «80 sqm» (± 5%), και σκέτους αριθμούς μόνο ως ολόκληρες λέξεις
 * («2» δεν ταιριάζει στο «Ολύμπου 21»).
 */
export function search(index: Hit[], query: string, limit = 30): Hit[] {
  let q = ` ${norm(query)} `
  const mb = q.match(/ (\d+) ?(υπνοδωματι\w*|υ δ|bedrooms?|beds?|bd|br) /)
  const bd = mb ? Number(mb[1]) : null
  if (mb) q = q.replace(mb[0], ' ')
  const ms = q.match(/ (\d+) ?τμ /)
  const sqm = ms ? Number(ms[1]) : null
  if (ms) q = q.replace(ms[0], ' ')
  const tokens = q.trim().split(' ').filter(Boolean)
  if (!tokens.length && bd == null && sqm == null) return []

  const scored: { h: Hit; s: number }[] = []
  for (const h of index) {
    let s = h.w * 10
    if (bd != null) {
      if (h.bd == null || (bd >= 4 ? h.bd < 4 : h.bd !== bd)) continue
      s += 8
    }
    if (sqm != null) {
      if (h.sqm == null) continue
      const d = Math.abs(h.sqm - sqm)
      if (d > Math.max(3, sqm * 0.05)) continue
      s += 8 - Math.min(7, d)
    }
    let ok = true
    const hay = ` ${h.q} `
    for (const tk of tokens) {
      if (/^\d+$/.test(tk)) {
        if (!hay.includes(` ${tk} `)) { ok = false; break }
        s += 6
        continue
      }
      const i = hay.indexOf(tk)
      if (i < 0) { ok = false; break }
      s += hay[i - 1] === ' ' ? 6 : 2
    }
    if (ok) scored.push({ h, s })
  }
  return scored.sort((a, b) => b.s - a.s).slice(0, limit).map((x) => x.h)
}

/** πεζά, χωρίς τόνους, ς→σ — «Μαρούσι» = «μαρουσι». */
export function norm(s: string): string {
  return (s ?? '')
    .normalize('NFD').replace(/[̀-ͯ]/g, '')
    .toLowerCase().replace(/ς/g, 'σ')
    .replace(/τ\.μ\.?|m2|m²|sqm/g, 'τμ')
    .replace(/[^\p{L}\p{N}]+/gu, ' ')
    .trim()
}

