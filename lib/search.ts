import type { Content } from './content'
import { formatPrice, unitsOf } from './features'
import { label, translit } from './greek'
import type { Lang } from './i18n'
import { href, t, tr, STATUS_KEY } from './i18n'

/**
 * Ευρετήριο αναζήτησης: ό,τι υπάρχει στο site σε μία λίστα.
 * Χτίζεται στον server από τα ίδια δεδομένα με τις σελίδες (lib/content),
 * ο browser το κατεβάζει μία φορά όταν ανοίγει η αναζήτηση.
 */
import { norm, type Hit } from './search-match'
export { norm, search, type Hit, type Kind } from './search-match'

/** Ελληνικά + greeklish, ώστε να πιάνει και «marousi» και «μαρουσι». */
const both = (...parts: (string | undefined | null)[]) => {
  const s = parts.filter(Boolean).join(' ')
  return `${norm(s)} ${norm(translit(s))}`
}

export function buildIndex(c: Content, lang: Lang): Hit[] {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)
  const out: Hit[] = []
  const bed = (n?: number) => (n == null ? '' : lang === 'en' ? `${n} bedroom${n === 1 ? '' : 's'}` : `${n} ${n === 1 ? 'υπνοδωμάτιο' : 'υπνοδωμάτια'}`)

  // Σελίδες
  const pages: [string, string, string][] = [
    ['/pros-polisi', T('forSale'), 'διαμερίσματα πώληση αγορά apartments sale buy'],
    ['/olokliromena-erga', T('completedFull'), 'ολοκληρωμένα έργα πολυκατοικίες παραδομένα completed projects'],
    ['/projects', T('interiors'), 'διαμορφώσεις εσωτερικοί χώροι κουζίνες μπάνια σαλόνια interiors'],
    ['/katalogos', T('services'), 'υπηρεσίες κατασκευή ανακαίνιση ενεργειακή αναβάθμιση services renovation'],
    ['/contact', T('contact'), 'επικοινωνία τηλέφωνο email διεύθυνση γραφείο χάρτης contact phone office'],
    ['/politiki-aporritou', T('privacy'), 'πολιτική απορρήτου gdpr cookies privacy'],
  ]
  for (const [p, title, extra] of pages) out.push({ k: 'page', title, sub: '', href: L(p), q: both(title, extra), w: 5 })

  // Ακίνητα και διαμερίσματα
  for (const p of c.properties) {
    const address = label(p.address, lang)
    const area = label(p.area, lang)
    const units = unitsOf(p)
    const avail = units.filter((u) => u.status === 'available').length
    out.push({
      k: 'property',
      title: address,
      sub: `${area} · ${avail ? `${avail} ${T('availableOf').toLowerCase()}` : T('stSold')}`,
      href: L(`/${p.slug}`),
      q: both(p.address.el, p.address.en, p.area.el, p.area.en, p.energyClass ? `κλαση ${p.energyClass}` : ''),
      w: avail ? 4 : 2,
    })
    for (const u of units) {
      const type = t(u.type, lang)
      const price = u.status === 'available' ? formatPrice(u.price, lang) : null
      const status = T(STATUS_KEY[u.status])
      out.push({
        k: 'unit',
        title: `${type} ${u.sqm ?? ''} ${T('sqmShort')}`.trim(),
        sub: [address, area, t(u.floor, lang), bed(u.bedrooms), price ?? status].filter(Boolean).join(' · '),
        href: L(`/${p.slug}#${u.id}`),
        q: both(u.type.el, u.type.en, `${u.sqm} τμ`, bed(u.bedrooms), u.bedrooms != null ? `${u.bedrooms} υπνοδωματια ${u.bedrooms} bedrooms` : '',
          u.floor.el, u.floor.en, T(STATUS_KEY[u.status]), p.address.el, p.area.el, p.area.en),
        w: u.status === 'available' ? 3 : 0,
        bd: u.bedrooms ?? undefined,
        sqm: u.sqm ?? undefined,
      })
    }
  }

  // Ολοκληρωμένα έργα
  for (const a of c.areas) {
    const name = label(a.area, lang)
    out.push({
      k: 'area',
      title: name,
      sub: `${T('completedFull')} · ${a.buildings.map((b) => label(b.address, lang).split(',')[0]).join(' · ')}`,
      href: L(`/${a.slug}`),
      q: both(a.area.el, a.area.en, ...a.buildings.map((b) => `${b.address.el} ${b.address.en ?? ''}`), 'ολοκληρωμενα εργα completed'),
      w: 2,
    })
  }

  // Διαμορφώσεις
  for (const i of c.interiors) {
    out.push({
      k: 'interior',
      title: t(i.title, lang),
      sub: T('interiors'),
      href: L(`/${i.slug}`),
      q: both(i.title.el, i.title.en, 'διαμορφωση εσωτερικοι χωροι interiors'),
      w: 1,
    })
  }

  return out
}
