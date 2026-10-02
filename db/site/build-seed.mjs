// Παράγει το 002_seed.sql από τα σημερινά content/*.ts.
// Τρέξιμο από τη ρίζα του project:   node db/site/build-seed.mjs
// Τρέχει ΜΙΑ φορά, για τη μεταφορά. Μετά η βάση είναι η πηγή αλήθειας.
import fs from 'node:fs'
import path from 'node:path'

const ROOT = process.cwd()
const rd = (p) => fs.readFileSync(path.join(ROOT, p), 'utf8')

/** Φορτώνει ένα content/*.ts που είναι σκέτο `export const x: T[] = [...]`. */
function loadTs(file, name) {
  const src = rd(file)
    .replace(/^import[^\n]*\n/gm, '')
    .replace(new RegExp(`export const ${name}[^=]*=`), 'globalThis.__X =')
  return new Function(src + '\nreturn globalThis.__X')()
}
/** Βγάζει ένα `const NAME: Record<string,string> = {...}` από το lib/greek.ts. */
function loadMap(name) {
  const m = rd('lib/greek.ts').match(new RegExp(`const ${name}[^=]*=\\s*(\\{[\\s\\S]*?\\n\\})`))
  if (!m) throw new Error('δεν βρέθηκε ' + name)
  return new Function('return ' + m[1].replace(/\/\*[\s\S]*?\*\//g, ''))()
}

const properties = loadTs('content/properties.ts', 'properties')
const areas = loadTs('content/areas.ts', 'areas')
const interiors = loadTs('content/interiors.ts', 'interiors')
const services = loadTs('content/services.ts', 'services')
const IN_AREA = loadMap('IN_AREA')
const LATIN = loadMap('LATIN')

// ── SQL ─────────────────────────────────────────────────────────────
const q = (v) =>
  v === null || v === undefined || v === '' ? 'NULL'
  : typeof v === 'number' ? String(v)
  : typeof v === 'boolean' ? (v ? 'true' : 'false')
  : `'${String(v).replace(/'/g, "''")}'`
/** Για στήλες NOT NULL DEFAULT '': κενό → '' αντί για NULL. */
const qs = (v) => (q(v) === 'NULL' ? "''" : q(v))
const arr = (a) => (a && a.length ? `'{${a.join(',')}}'::smallint[]` : `'{}'::smallint[]`)
const out = []
const emit = (s) => out.push(s)

// ── Μετατροπές ──────────────────────────────────────────────────────

/** «- Α. - Β. - Γ.» → μία κουκκίδα ανά γραμμή. */
function bullets(s) {
  if (!s) return s
  const t = s.trim()
  if (!/^-\s/.test(t)) return t
  return t.split(/(?:^|\s)-\s+/).map((x) => x.trim()).filter(Boolean).join('\n')
}

/** «150.000€» → 150000 */
function priceEur(p) {
  if (!p) return null
  const n = Number(String(p).replace(/[^\d]/g, ''))
  return Number.isFinite(n) && n > 0 ? n : null
}

const UNIT_TYPE = { 'Διαμέρισμα': 'apartment', 'Μεζονέτα': 'maisonette', 'Διαμέρισμα με σοφίτα': 'loft-apartment' }

// Ίδιος κανόνας με αυτόν που θα χρησιμοποιεί το site (lib/floors.ts).
const ord = (n) => `${n}ος`
const ordEn = (n) => n + (n % 10 === 1 && n !== 11 ? 'st' : n % 10 === 2 && n !== 12 ? 'nd' : n % 10 === 3 && n !== 13 ? 'rd' : 'th')
function autoFloorEl(f) {
  if (!f?.length) return ''
  if (f.length === 1 && f[0] === 0) return 'Ισόγειο'
  return f.map((n) => (n === 0 ? 'Ισόγειο' : ord(n))).join('-') + ' όροφος'
}
const norm = (s) => (s || '').replace(/\s*-\s*/g, '-').replace(/\s+/g, ' ').trim().toLowerCase()

/** Κρατάμε ετικέτα ορόφου μόνο όταν λέει κάτι παραπάνω από τους αριθμούς (π.χ. «Ισόγειο 3»). */
function floorOverride(u, floors) {
  if (norm(u.floor?.el) === norm(autoFloorEl(floors))) return { el: null, en: null }
  const el = u.floor.el.trim()
  const m = el.match(/^Ισόγειο\s+(\d+)$/)
  return { el, en: m ? `Ground floor ${m[1]}` : null }
}

/** Όροφοι: από τα δεδομένα, αλλιώς από την ετικέτα («6ος όροφος» → [6]). */
function floorsOf(u) {
  if (u.floors?.length) return u.floors
  const ns = [...(u.floor?.el || '').matchAll(/(\d+)ος/g)].map((m) => Number(m[1]))
  if (ns.length) return ns
  if (/Ισόγειο/.test(u.floor?.el || '')) return [0]
  return []
}

// ── Περιοχές ────────────────────────────────────────────────────────
emit('-- ΠΑΡΑΓΟΜΕΝΟ από db/site/build-seed.mjs — μην το γράφεις με το χέρι.')
emit(`-- ${new Date().toISOString()}`)
emit('BEGIN;\n')
emit('-- Περιοχές')
const areaNames = [...new Set([...properties.map((p) => p.area.el), ...areas.map((a) => a.area.el)])]
for (const a of areaNames) {
  if (!IN_AREA[a] || !LATIN[a]) throw new Error(`Λείπει άρθρο/λατινικά για την περιοχή «${a}» στο lib/greek.ts`)
  emit(`INSERT INTO site.areas (name_el, name_en, in_el) VALUES (${q(a)}, ${q(LATIN[a])}, ${q(IN_AREA[a])});`)
}
const areaId = (name) => `(SELECT id FROM site.areas WHERE name_el = ${q(name)})`

// ── Ακίνητα ─────────────────────────────────────────────────────────
const warnings = []
properties.forEach((p, pi) => {
  emit(`\n-- ${p.address.el}, ${p.area.el}`)
  emit(`INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES (${q(p.slug)}, true, ${q(p.address.el)}, ${q(p.address.en)}, ${areaId(p.area.el)}, ${q(p.kind)}, ${q(p.energyClass)},
  ${qs(bullets(p.buildingDescription?.el))}, ${q(bullets(p.buildingDescription?.en))},
  ${q(p.seo?.title?.el)}, ${q(p.seo?.title?.en)}, ${q(p.seo?.description?.el)}, ${q(p.seo?.description?.en)}, ${(pi + 1) * 10});`)
  const pid = `(SELECT id FROM site.properties WHERE slug = ${q(p.slug)})`

  ;(p.units || []).filter(Boolean).forEach((u, ui) => {
    const floors = floorsOf(u)
    if (!u.floors?.length) warnings.push(`${p.slug}/${u.id}: όροφοι από την ετικέτα «${u.floor?.el}» → ${JSON.stringify(floors)}`)
    const fo = floorOverride(u, floors)
    const type = UNIT_TYPE[u.type?.el]
    if (!type) throw new Error(`Άγνωστος τύπος «${u.type?.el}» στο ${u.id}`)
    const status = u.status === 'unknown' ? (warnings.push(`${u.id}: unknown → available`), 'available') : u.status
    emit(`INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES (${pid}, ${q(u.id)}, ${q(type)}, ${arr(floors)}, ${q(fo.el)}, ${q(fo.en)}, ${q(u.sqm)}, ${q(u.bedrooms)}, ${q(status)}, ${q(priceEur(u.price))},
  ${qs(u.description?.el)}, ${q(u.description?.en)}, ${(ui + 1) * 10});`)
  })

  const planSrc = new Set((p.plans || []).map((x) => x.src))
  ;(p.images || []).filter((src) => !planSrc.has(src)).forEach((src, i) =>
    emit(`INSERT INTO site.media (property_id, kind, url, sort_order) VALUES (${pid}, 'photo', ${q(src)}, ${(i + 1) * 10});`))
  ;(p.plans || []).forEach((pl, i) =>
    emit(`INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES (${pid}, 'plan', ${q(pl.src)}, ${q(pl.code)}, ${pl.floor}, ${(i + 1) * 10});`))
  ;(p.units || []).filter(Boolean).forEach((u) =>
    (u.plan || []).forEach((code) =>
      emit(`INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = ${q(u.id)} AND m.plan_code = ${q(code)};`)))
})

// ── Ολοκληρωμένα έργα ───────────────────────────────────────────────
areas.forEach((a, ai) => {
  emit(`\n-- Ολοκληρωμένα: ${a.area.el}`)
  emit(`INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES (${q(a.slug)}, true, ${areaId(a.area.el)}, ${(ai + 1) * 10});`)
  const aid = `(SELECT id FROM site.completed_areas WHERE slug = ${q(a.slug)})`
  a.buildings.forEach((b, bi) =>
    emit(`INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES (${aid}, ${q(b.address.el)}, ${q(b.address.en)}, ${qs(b.specs?.el)}, ${q(b.specs?.en)}, ${q(b.description?.el)}, ${q(b.description?.en)}, ${(bi + 1) * 10});`))
  a.images.forEach((src, i) =>
    emit(`INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES (${aid}, 'photo', ${q(src)}, ${(i + 1) * 10});`))
})

// ── Διαμορφώσεις ────────────────────────────────────────────────────
interiors.forEach((it, ii) => {
  emit(`\n-- Διαμόρφωση: ${it.title.el}`)
  emit(`INSERT INTO site.interiors (slug, slug_locked, title_el, title_en, intro_el, intro_en, sort_order)
VALUES (${q(it.slug)}, true, ${q(it.title.el)}, ${q(it.title.en)}, ${q(it.intro?.el)}, ${q(it.intro?.en)}, ${(ii + 1) * 10});`)
  const iid = `(SELECT id FROM site.interiors WHERE slug = ${q(it.slug)})`
  it.images.forEach((src, i) =>
    emit(`INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES (${iid}, 'photo', ${q(src)}, ${(i + 1) * 10});`))
})

// ── Υπηρεσίες ───────────────────────────────────────────────────────
emit('\n-- Υπηρεσίες')
services.forEach((s, i) =>
  emit(`INSERT INTO site.services (title_el, title_en, description_el, description_en, href, sort_order)
VALUES (${q(s.title.el)}, ${q(s.title.en)}, ${q(s.description.el)}, ${q(s.description.en)}, ${q(s.href)}, ${(i + 1) * 10});`))

emit('\nCOMMIT;')

const target = path.join(ROOT, 'db/site/002_seed.sql')
fs.writeFileSync(target, out.join('\n') + '\n')
console.log(`OK → ${path.relative(ROOT, target)}`)
console.log(`περιοχές ${areaNames.length} · ακίνητα ${properties.length} · διαμερίσματα ${properties.reduce((n, p) => n + p.units.filter(Boolean).length, 0)} · ολοκληρωμένα ${areas.length} · διαμορφώσεις ${interiors.length} · υπηρεσίες ${services.length}`)
if (warnings.length) console.log('Προσοχή:\n  ' + warnings.join('\n  '))
