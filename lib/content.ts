import { unstable_cache } from 'next/cache'
import type { Interior, L, ProjectArea, Property, Service, Unit } from '@/content/types'
import { db, hasDb } from './db'
import { floorLabel, UNIT_TYPE } from './floors'

/**
 * ΕΝΑ σημείο από όπου διαβάζει το site όλα τα δεδομένα του.
 *
 * - Με DATABASE_URL: από τη βάση (schema `site`), με cache.
 *   Ανανεώνεται κάθε ώρα, και αμέσως όταν σώζει το admin (revalidateTag('content')).
 *   Αν η βάση δεν απαντήσει, το Next κρατάει την τελευταία καλή έκδοση της σελίδας.
 * - Χωρίς DATABASE_URL (π.χ. τοπικά χωρίς .env.local): από τα παλιά content/*.ts.
 *
 * Επιστρέφει ΑΚΡΙΒΩΣ τους ίδιους τύπους που περίμεναν ως τώρα τα components.
 */
export type Content = {
  properties: Property[]
  areas: ProjectArea[]
  interiors: Interior[]
  services: Service[]
}

export const CONTENT_TAG = 'content'

const loadCached = unstable_cache(loadFromDb, ['site-content-v1'], {
  tags: [CONTENT_TAG],
  revalidate: 3600,
})

export async function getContent(): Promise<Content> {
  if (!hasDb()) return loadFromFiles()
  return loadCached()
}

// ── Από τα αρχεία (fallback) ──────────────────────────────────────
async function loadFromFiles(): Promise<Content> {
  const [{ properties }, { areas }, { interiors }, { services }] = await Promise.all([
    import('@/content/properties'),
    import('@/content/areas'),
    import('@/content/interiors'),
    import('@/content/services'),
  ])
  return { properties, areas, interiors, services }
}

// ── Από τη βάση ───────────────────────────────────────────────────
const L2 = (el: string | null, en: string | null): L => (en ? { el: el ?? '', en } : { el: el ?? '' })
const lines = (s: string | null) => (s ?? '').split('\n').map((x) => x.trim()).filter(Boolean)

/** «150000» → «150.000€» — η μορφή που διαβάζει το lib/features.priceNumber. */
const priceStr = (n: number | null) => (n ? `${String(n).replace(/\B(?=(\d{3})+(?!\d))/g, '.')}€` : undefined)

type Row = Record<string, any>

async function loadFromDb(): Promise<Content> {
  const pool = db()
  const [props, units, media, unitPlans, cAreas, cBuildings, ints, svcs] = await Promise.all([
    pool.query(`
      SELECT p.*, a.name_el AS area_name_el, a.name_en AS area_name_en, a.in_el AS area_in_el
      FROM site.properties p JOIN site.areas a ON a.id = p.area_id
      WHERE p.is_published ORDER BY p.sort_order, p.id`),
    pool.query(`SELECT * FROM site.units ORDER BY property_id, sort_order, id`),
    pool.query(`SELECT * FROM site.media ORDER BY sort_order, id`),
    pool.query(`SELECT up.unit_id, m.plan_code FROM site.unit_plans up JOIN site.media m ON m.id = up.media_id`),
    pool.query(`
      SELECT c.*, a.name_el AS area_name_el, a.name_en AS area_name_en, a.in_el AS area_in_el
      FROM site.completed_areas c JOIN site.areas a ON a.id = c.area_id
      WHERE c.is_published ORDER BY c.sort_order, c.id`),
    pool.query(`SELECT * FROM site.completed_buildings ORDER BY area_id, sort_order, id`),
    pool.query(`SELECT * FROM site.interiors WHERE is_published ORDER BY sort_order, id`),
    pool.query(`SELECT * FROM site.services WHERE is_published ORDER BY sort_order, id`),
  ])

  const by = <K extends string>(rows: Row[], key: K) => {
    const m = new Map<unknown, Row[]>()
    for (const r of rows) {
      const k = r[key]
      if (k == null) continue
      if (!m.has(k)) m.set(k, [])
      m.get(k)!.push(r)
    }
    return m
  }
  const unitsBy = by(units.rows, 'property_id')
  const mediaByProp = by(media.rows, 'property_id')
  const mediaByArea = by(media.rows, 'completed_area_id')
  const mediaByInt = by(media.rows, 'interior_id')
  const buildingsBy = by(cBuildings.rows, 'area_id')
  const plansByUnit = by(unitPlans.rows, 'unit_id')

  const area = (r: Row) => ({ el: r.area_name_el, en: r.area_name_en, in: r.area_in_el })

  const properties: Property[] = props.rows.map((p) => {
    const files = mediaByProp.get(p.id) ?? []
    const photos = files.filter((m) => m.kind === 'photo').map((m) => m.url as string)
    const plans = files
      .filter((m) => m.kind === 'plan')
      .map((m) => ({ code: m.plan_code as string, floor: Number(m.plan_floor), src: m.url as string }))

    const us: Unit[] = (unitsBy.get(p.id) ?? []).map((u) => {
      const floors: number[] = (u.floors ?? []).map(Number)
      const auto = floorLabel(floors)
      const pinned = (plansByUnit.get(u.id) ?? []).map((x) => x.plan_code as string)
      return {
        id: u.legacy_id ?? `u${u.id}`,
        floor: { el: u.floor_label_el ?? auto.el, en: u.floor_label_en ?? auto.en },
        type: UNIT_TYPE[u.unit_type] ?? UNIT_TYPE.apartment,
        sqm: Number(u.sqm),
        bedrooms: u.bedrooms ?? undefined,
        status: u.status,
        price: priceStr(u.price_eur),
        description: L2(u.description_el, u.description_en),
        floors,
        plan: pinned.length ? pinned : undefined,
      }
    })

    return {
      slug: p.slug,
      address: L2(p.address_el, p.address_en),
      area: area(p),
      kind: p.kind,
      energyClass: p.energy_class ?? undefined,
      buildingDescription: L2(p.description_el, p.description_en),
      units: us,
      images: photos,
      plans,
      seo: {
        title: L2(p.seo_title_el ?? `${p.address_el}, ${p.area_name_el}`, p.seo_title_en),
        description: p.seo_description_el ? L2(p.seo_description_el, p.seo_description_en) : undefined,
      },
    }
  })

  const areas: ProjectArea[] = cAreas.rows.map((c) => ({
    slug: c.slug,
    area: area(c),
    buildings: (buildingsBy.get(c.id) ?? []).map((b) => ({
      address: L2(b.address_el, b.address_en),
      specs: L2(b.specs_el, b.specs_en),
      description: b.description_el ? L2(b.description_el, b.description_en) : undefined,
    })),
    images: (mediaByArea.get(c.id) ?? []).map((m) => m.url),
  }))

  const interiors: Interior[] = ints.rows.map((i) => ({
    slug: i.slug,
    title: L2(i.title_el, i.title_en),
    intro: i.intro_el ? L2(i.intro_el, i.intro_en) : undefined,
    images: (mediaByInt.get(i.id) ?? []).map((m) => m.url),
  }))

  const services: Service[] = svcs.rows.map((s) => ({
    title: L2(s.title_el, s.title_en),
    description: L2(s.description_el, s.description_en),
    href: s.href,
  }))

  return { properties, areas, interiors, services }
}

/** Κουκκίδες της περιγραφής κτηρίου: μία ανά γραμμή (βάση) ή «- Α. - Β.» (παλιά αρχεία). */
export function bulletsOf(s: string | undefined): string[] {
  const t = (s ?? '').trim()
  if (!t) return []
  if (t.includes('\n')) return lines(t).map((x) => x.replace(/^-\s+/, ''))
  if (/^-\s/.test(t)) return t.split(/(?:^|\s)-\s+/).map((x) => x.trim()).filter(Boolean)
  return [t]
}
