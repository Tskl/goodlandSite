'use server'

import { revalidatePath, updateTag } from 'next/cache'
import { redirect } from 'next/navigation'
import { del, put } from '@vercel/blob'
import { db } from '@/lib/db'
import { CONTENT_TAG } from '@/lib/content'
import {
  databasePassword, endSession, getAdmin, hashPassword, passwordProblem,
  requireAdmin, sameSecret, startSession, verifyPassword, type Admin,
} from './auth'
import { STATUSES, parseFloors, parsePrice, parseSqm, slugify, str, userMessage } from './util'

const ST = Object.fromEntries(STATUSES) as Record<string, string>

/* ════════════════════════════════════════════════════════════════════
   Όλες οι αλλαγές του admin. Κάθε action:
     1. ελέγχει ότι υπάρχει σύνδεση
     2. γράφει στη βάση (οι triggers της βάσης κάνουν τον τελικό έλεγχο)
     3. γράφει στο ιστορικό ποιος άλλαξε τι
     4. ανανεώνει αμέσως το δημόσιο site
     5. γυρνάει στη σελίδα με ?ok=… ή ?e=…
   ════════════════════════════════════════════════════════════════════ */

function refreshSite() {
  updateTag(CONTENT_TAG)
  revalidatePath('/', 'layout')
}

async function audit(a: Admin, table: string, rowId: number | null, action: 'insert' | 'update' | 'delete', summary: string, before?: unknown, after?: unknown) {
  await db().query(
    `INSERT INTO site.audit_log (admin_id, table_name, row_id, action, summary, before, after) VALUES ($1,$2,$3,$4,$5,$6,$7)`,
    [a.id, table, rowId, action, summary, before ? JSON.stringify(before) : null, after ? JSON.stringify(after) : null],
  )
}

/** «/admin/p/3#units» + μήνυμα → «/admin/p/3?ok=…#units» (το query ΠΡΙΝ το #). */
const back = (path: string, kind: 'ok' | 'e', msg: string) => {
  const [base, hash] = path.split('#')
  return `${base}${base.includes('?') ? '&' : '?'}${kind}=${encodeURIComponent(msg)}${hash ? `#${hash}` : ''}`
}

/** Εκτελεί, και μετά redirect με μήνυμα. Το redirect μένει ΕΞΩ από το try. */
async function run(path: string, okMsg: string, fn: (a: Admin) => Promise<string | void>) {
  const a = await requireAdmin()
  let target: string
  try {
    const next = await fn(a)
    refreshSite()
    target = back(next || path, 'ok', okMsg)
  } catch (e) {
    target = back(path, 'e', userMessage(e))
  }
  redirect(target)
}

// ── Σύνδεση ─────────────────────────────────────────────────────────
export async function loginAction(fd: FormData) {
  const username = (str(fd, 'username') ?? '').toLowerCase()
  const password = (fd.get('password') as string) ?? ''
  const { rows } = await db().query('SELECT id, password_hash FROM site.admins WHERE username = $1 AND is_active', [username])
  const ok = rows[0] ? await verifyPassword(password, rows[0].password_hash) : false
  if (!ok) {
    await new Promise((r) => setTimeout(r, 700))
    redirect('/admin/login?e=' + encodeURIComponent('Λάθος όνομα ή κωδικός.'))
  }
  await db().query('UPDATE site.admins SET last_login_at = now() WHERE id = $1', [rows[0].id])
  await startSession(Number(rows[0].id))
  redirect('/admin')
}

export async function logoutAction() {
  await endSession()
  redirect('/admin/login')
}

/** Πρώτο στήσιμο: μόνο όταν δεν υπάρχει κανένας χρήστης, και μόνο με τον κωδικό της βάσης. */
export async function setupAction(fd: FormData) {
  const { rows } = await db().query('SELECT count(*)::int AS n FROM site.admins')
  if (rows[0].n > 0) redirect('/admin/login')

  const dbpw = (fd.get('dbpassword') as string) ?? ''
  const username = (str(fd, 'username') ?? '').toLowerCase()
  const name = str(fd, 'display_name') ?? username
  const pw = (fd.get('password') as string) ?? ''
  const pw2 = (fd.get('password2') as string) ?? ''

  let err: string | null = null
  if (!sameSecret(dbpw, databasePassword())) err = 'Ο κωδικός της βάσης δεν είναι σωστός.'
  else if (!/^[a-z0-9._-]{3,40}$/.test(username)) err = 'Όνομα χρήστη: 3–40 λατινικά πεζά, αριθμοί, . _ -'
  else if (pw !== pw2) err = 'Οι δύο κωδικοί δεν είναι ίδιοι.'
  else err = passwordProblem(pw)
  if (err) {
    await new Promise((r) => setTimeout(r, 700))
    redirect('/admin/setup?e=' + encodeURIComponent(err))
  }

  const ins = await db().query(
    'INSERT INTO site.admins (username, password_hash, display_name) VALUES ($1,$2,$3) RETURNING id',
    [username, await hashPassword(pw), name],
  )
  await startSession(Number(ins.rows[0].id))
  redirect('/admin?ok=' + encodeURIComponent('Ο λογαριασμός σου είναι έτοιμος.'))
}

// ── Χρήστες ─────────────────────────────────────────────────────────
export async function createAdminAction(fd: FormData) {
  await run('/admin/users', 'Ο χρήστης δημιουργήθηκε.', async (a) => {
    const username = (str(fd, 'username') ?? '').toLowerCase()
    const name = str(fd, 'display_name') ?? username
    const pw = (fd.get('password') as string) ?? ''
    if (!/^[a-z0-9._-]{3,40}$/.test(username)) throw new Error('Όνομα χρήστη: 3–40 λατινικά πεζά, αριθμοί, . _ -')
    const p = passwordProblem(pw)
    if (p) throw new Error(p)
    const r = await db().query(
      'INSERT INTO site.admins (username, password_hash, display_name) VALUES ($1,$2,$3) RETURNING id',
      [username, await hashPassword(pw), name],
    ).catch((e) => { if (e.code === '23505') throw new Error('Υπάρχει ήδη χρήστης με αυτό το όνομα.'); throw e })
    await audit(a, 'admins', Number(r.rows[0].id), 'insert', `Νέος χρήστης: ${username}`)
  })
}

export async function changePasswordAction(fd: FormData) {
  await run('/admin/users', 'Ο κωδικός άλλαξε.', async (a) => {
    const id = Number(str(fd, 'id'))
    const pw = (fd.get('password') as string) ?? ''
    const p = passwordProblem(pw)
    if (p) throw new Error(p)
    await db().query('UPDATE site.admins SET password_hash = $1 WHERE id = $2', [await hashPassword(pw), id])
    await audit(a, 'admins', id, 'update', 'Αλλαγή κωδικού')
  })
}

export async function toggleAdminAction(fd: FormData) {
  await run('/admin/users', 'Έγινε.', async (a) => {
    const id = Number(str(fd, 'id'))
    if (id === a.id) throw new Error('Δεν μπορείς να απενεργοποιήσεις τον εαυτό σου.')
    await db().query('UPDATE site.admins SET is_active = NOT is_active WHERE id = $1', [id])
    await audit(a, 'admins', id, 'update', 'Ενεργοποίηση/απενεργοποίηση χρήστη')
  })
}

// ── Περιοχές ────────────────────────────────────────────────────────
async function areaIdFrom(fd: FormData): Promise<number> {
  const id = str(fd, 'area_id')
  if (id && id !== 'new') return Number(id)
  const name = str(fd, 'new_area_el')
  const en = str(fd, 'new_area_en')
  const inEl = str(fd, 'new_area_in')
  if (!name || !en || !inEl) throw new Error('Νέα περιοχή: συμπλήρωσε όνομα, όνομα στα αγγλικά και «στη/στο/στον …».')
  const r = await db().query(
    'INSERT INTO site.areas (name_el, name_en, in_el) VALUES ($1,$2,$3) RETURNING id',
    [name, en, inEl],
  ).catch((e) => {
    if (e.code === '23514') throw new Error('Το «στη/στο …» πρέπει να ξεκινά με στο, στη, στην, στον, στα, στου κ.λπ. και μετά το όνομα — π.χ. «στη Γλυφάδα».')
    if (e.code === '23505') throw new Error('Η περιοχή υπάρχει ήδη — διάλεξέ τη από τη λίστα.')
    throw e
  })
  return Number(r.rows[0].id)
}

// ── Ακίνητα ─────────────────────────────────────────────────────────
export async function createPropertyAction(fd: FormData) {
  await run('/admin/new', 'Το ακίνητο δημιουργήθηκε — κρυφό μέχρι να το δημοσιεύσεις.', async (a) => {
    const address = str(fd, 'address_el')
    if (!address) throw new Error('Γράψε τη διεύθυνση.')
    const areaId = await areaIdFrom(fd)
    const { rows: ar } = await db().query('SELECT name_el FROM site.areas WHERE id = $1', [areaId])
    const slug = str(fd, 'slug') ?? slugify(address, ar[0]?.name_el ?? '')
    const { rows: mx } = await db().query('SELECT coalesce(max(sort_order),0)+10 AS s FROM site.properties')
    const r = await db().query(
      `INSERT INTO site.properties (slug, address_el, area_id, kind, energy_class, sort_order, is_published, updated_by)
       VALUES ($1,$2,$3,$4,$5,$6,false,$7) RETURNING id`,
      [slug, address, areaId, str(fd, 'kind') ?? 'new-build', str(fd, 'energy_class'), mx[0].s, a.id],
    )
    const id = Number(r.rows[0].id)
    await audit(a, 'properties', id, 'insert', `Νέο ακίνητο: ${address} (${slug})`)
    return `/admin/p/${id}`
  })
}

export async function savePropertyAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  await run(`/admin/p/${id}`, 'Αποθηκεύτηκε.', async (a) => {
    const { rows: [before] } = await db().query('SELECT * FROM site.properties WHERE id = $1', [id])
    if (!before) throw new Error('Το ακίνητο δεν βρέθηκε.')
    const address = str(fd, 'address_el')
    if (!address) throw new Error('Η διεύθυνση δεν μπορεί να είναι κενή.')
    const slug = before.slug_locked ? before.slug : (str(fd, 'slug') ?? before.slug)
    const areaId = await areaIdFrom(fd)
    const vals = {
      slug, address_el: address, address_en: str(fd, 'address_en'), area_id: areaId,
      kind: str(fd, 'kind') ?? 'new-build', energy_class: str(fd, 'energy_class'),
      description_el: str(fd, 'description_el') ?? '', description_en: str(fd, 'description_en'),
      seo_title_el: str(fd, 'seo_title_el'), seo_title_en: str(fd, 'seo_title_en'),
      seo_description_el: str(fd, 'seo_description_el'), seo_description_en: str(fd, 'seo_description_en'),
      is_published: fd.get('is_published') === 'on',
    }
    await db().query(
      `UPDATE site.properties SET slug=$2, address_el=$3, address_en=$4, area_id=$5, kind=$6, energy_class=$7,
         description_el=$8, description_en=$9, seo_title_el=$10, seo_title_en=$11, seo_description_el=$12,
         seo_description_en=$13, is_published=$14, updated_by=$15 WHERE id=$1`,
      [id, vals.slug, vals.address_el, vals.address_en, vals.area_id, vals.kind, vals.energy_class,
       vals.description_el, vals.description_en, vals.seo_title_el, vals.seo_title_en, vals.seo_description_el,
       vals.seo_description_en, vals.is_published, a.id],
    )
    await audit(a, 'properties', id, 'update', `${address}: στοιχεία ακινήτου`, before, vals)
  })
}

export async function deletePropertyAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  await run(`/admin/p/${id}`, 'Το ακίνητο διαγράφηκε.', async (a) => {
    const { rows: [p] } = await db().query('SELECT * FROM site.properties WHERE id = $1', [id])
    if (!p) throw new Error('Το ακίνητο δεν βρέθηκε.')
    if (str(fd, 'confirm') !== p.address_el) throw new Error(`Για διαγραφή γράψε ακριβώς «${p.address_el}» στο πεδίο επιβεβαίωσης.`)
    const { rows: files } = await db().query('SELECT url FROM site.media WHERE property_id = $1', [id])
    await db().query('DELETE FROM site.properties WHERE id = $1', [id]) // ο trigger αρνείται τα παλιά URL
    await removeBlobs(files.map((f) => f.url))
    await audit(a, 'properties', id, 'delete', `Διαγραφή ακινήτου: ${p.address_el}`, p)
    return '/admin'
  })
}

// ── Διαμερίσματα ────────────────────────────────────────────────────
function unitValues(fd: FormData) {
  return {
    unit_type: str(fd, 'unit_type') ?? 'apartment',
    floors: parseFloors(str(fd, 'floors')),
    floor_label_el: str(fd, 'floor_label_el'),
    floor_label_en: str(fd, 'floor_label_en'),
    sqm: parseSqm(str(fd, 'sqm')),
    bedrooms: str(fd, 'bedrooms') ? Number(str(fd, 'bedrooms')) : null,
    status: str(fd, 'status') ?? 'available',
    price_eur: parsePrice(str(fd, 'price')),
    description_el: str(fd, 'description_el') ?? '',
    description_en: str(fd, 'description_en'),
  }
}

export async function addUnitAction(fd: FormData) {
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#units`, 'Το διαμέρισμα προστέθηκε.', async (a) => {
    const v = unitValues(fd)
    const { rows: mx } = await db().query('SELECT coalesce(max(sort_order),0)+10 AS s FROM site.units WHERE property_id = $1', [pid])
    const r = await db().query(
      `INSERT INTO site.units (property_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur,
         description_el, description_en, sort_order, updated_by)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13) RETURNING id`,
      [pid, v.unit_type, v.floors, v.floor_label_el, v.floor_label_en, v.sqm, v.bedrooms, v.status, v.price_eur,
       v.description_el, v.description_en, mx[0].s, a.id],
    )
    await audit(a, 'units', Number(r.rows[0].id), 'insert', `Νέο διαμέρισμα ${v.sqm} τ.μ.`, null, v)
  })
}

export async function saveUnitAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#u${id}`, 'Το διαμέρισμα αποθηκεύτηκε.', async (a) => {
    const { rows: [before] } = await db().query('SELECT * FROM site.units WHERE id = $1', [id])
    if (!before) throw new Error('Το διαμέρισμα δεν βρέθηκε.')
    const v = unitValues(fd)
    // Κατόψεις του διαμερίσματος: όσες τσεκαρίστηκαν. Όλα μαζί ή τίποτα (transaction),
    // ώστε μια κάτοψη σε λάθος όροφο να μην αφήσει το διαμέρισμα μισοαποθηκευμένο.
    const plans = fd.getAll('plan').map(Number).filter(Boolean)
    const c = await db().connect()
    try {
      await c.query('BEGIN')
      await c.query(
        `UPDATE site.units SET unit_type=$2, floors=$3, floor_label_el=$4, floor_label_en=$5, sqm=$6, bedrooms=$7,
           status=$8, price_eur=$9, description_el=$10, description_en=$11, updated_by=$12 WHERE id=$1`,
        [id, v.unit_type, v.floors, v.floor_label_el, v.floor_label_en, v.sqm, v.bedrooms, v.status, v.price_eur,
         v.description_el, v.description_en, a.id],
      )
      await c.query('DELETE FROM site.unit_plans WHERE unit_id = $1', [id])
      for (const m of plans) await c.query('INSERT INTO site.unit_plans (unit_id, media_id) VALUES ($1,$2)', [id, m])
      await c.query('COMMIT')
    } catch (e) {
      await c.query('ROLLBACK').catch(() => {})
      if ((e as { code?: string }).code === '23505') throw new Error('Μια από τις κατόψεις που τσέκαρες ανήκει ήδη σε άλλο διαμέρισμα.')
      throw e
    } finally {
      c.release()
    }
    const change = before.status !== v.status ? ` · ${ST[before.status]} → ${ST[v.status]}` : ''
    await audit(a, 'units', id, 'update', `Διαμέρισμα ${v.sqm} τ.μ.${change}`, before, { ...v, plans })
  })
}

/** Γρήγορη αλλαγή κατάστασης από τη λίστα. */
export async function setStatusAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  const status = str(fd, 'status') ?? 'available'
  await run(`/admin/p/${pid}#u${id}`, 'Η κατάσταση άλλαξε.', async (a) => {
    const { rows: [u] } = await db().query('SELECT sqm, status FROM site.units WHERE id = $1', [id])
    await db().query('UPDATE site.units SET status = $2, updated_by = $3 WHERE id = $1', [id, status, a.id])
    await audit(a, 'units', id, 'update', `Διαμέρισμα ${u?.sqm} τ.μ. · ${ST[u?.status] ?? u?.status} → ${ST[status] ?? status}`)
  })
}

export async function deleteUnitAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#units`, 'Το διαμέρισμα διαγράφηκε.', async (a) => {
    const { rows: [u] } = await db().query('DELETE FROM site.units WHERE id = $1 RETURNING *', [id])
    await audit(a, 'units', id, 'delete', `Διαγραφή διαμερίσματος ${u?.sqm} τ.μ.`, u)
  })
}

export async function moveUnitAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#units`, 'Η σειρά άλλαξε.', async () => {
    await swapOrder('units', 'property_id', id, str(fd, 'dir') === 'up' ? 'up' : 'down')
  })
}

// ── Φωτογραφίες / κατόψεις ──────────────────────────────────────────
/**
 * Ανέβασμα ΕΝΟΣ αρχείου (ο browser το έχει ήδη μικρύνει σε JPEG < 1 MB).
 * Καλείται από το components/admin/Uploader για κάθε αρχείο χωριστά.
 */
export async function uploadMediaAction(fd: FormData): Promise<{ ok: boolean; error?: string }> {
  const a = await getAdmin()
  if (!a) return { ok: false, error: 'Η σύνδεση έληξε — ξαναμπές.' }
  try {
    const pid = Number(str(fd, 'property_id'))
    const kind = str(fd, 'kind') === 'plan' ? 'plan' : 'photo'
    const file = fd.get('file')
    if (!(file instanceof Blob) || file.size === 0) throw new Error('Δεν ήρθε αρχείο.')
    if (file.size > 4 * 1024 * 1024) throw new Error('Το αρχείο είναι πολύ μεγάλο.')
    const { rows: [p] } = await db().query('SELECT slug FROM site.properties WHERE id = $1', [pid])
    if (!p) throw new Error('Το ακίνητο δεν βρέθηκε.')

    let planCode: string | null = null
    let planFloor: number | null = null
    if (kind === 'plan') {
      planCode = str(fd, 'plan_code')
      const f = parseFloors(str(fd, 'plan_floor'))
      if (!planCode) throw new Error('Γράψε κωδικό κάτοψης (π.χ. Α1).')
      if (f.length !== 1) throw new Error('Η κάτοψη θέλει έναν όροφο (π.χ. 1 ή Ισόγειο).')
      planFloor = f[0]
    }

    const blob = await put(`properties/${p.slug}/${kind}.jpg`, file, {
      access: 'public',
      addRandomSuffix: true,
      contentType: 'image/jpeg',
    })
    const { rows: mx } = await db().query(
      'SELECT coalesce(max(sort_order),0)+10 AS s FROM site.media WHERE property_id = $1 AND kind = $2', [pid, kind])
    try {
      await db().query(
        `INSERT INTO site.media (property_id, kind, url, width, height, bytes, plan_code, plan_floor, sort_order)
         VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)`,
        [pid, kind, blob.url, Number(str(fd, 'width')) || null, Number(str(fd, 'height')) || null, file.size,
         planCode, planFloor, mx[0].s],
      )
    } catch (e: any) {
      await del(blob.url).catch(() => {})
      if (e?.code === '23505') throw new Error(`Υπάρχει ήδη κάτοψη με κωδικό ${planCode}.`)
      throw e
    }
    await audit(a, 'media', null, 'insert', `${kind === 'plan' ? `Κάτοψη ${planCode}` : 'Φωτογραφία'} στο ${p.slug}`)
    refreshSite()
    return { ok: true }
  } catch (e) {
    return { ok: false, error: userMessage(e) }
  }
}

async function removeBlobs(urls: string[]) {
  const blobs = urls.filter((u) => /\.blob\.vercel-storage\.com\//.test(u))
  if (blobs.length) await del(blobs).catch(() => {})
}

export async function deleteMediaAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#media`, 'Διαγράφηκε.', async (a) => {
    const { rows: [m] } = await db().query('DELETE FROM site.media WHERE id = $1 RETURNING *', [id])
    if (m) await removeBlobs([m.url])
    await audit(a, 'media', id, 'delete', `Διαγραφή ${m?.kind === 'plan' ? `κάτοψης ${m.plan_code}` : 'φωτογραφίας'}`, m)
  })
}

export async function moveMediaAction(fd: FormData) {
  const id = Number(str(fd, 'id'))
  const pid = Number(str(fd, 'property_id'))
  await run(`/admin/p/${pid}#media`, 'Η σειρά άλλαξε.', async () => {
    await swapOrder('media', 'property_id', id, str(fd, 'dir') === 'up' ? 'up' : 'down', true)
  })
}

/** Ανταλλάσσει θέση με τον διπλανό (ίδιος γονέας· για media και ίδιο kind). */
async function swapOrder(table: 'units' | 'media', parent: 'property_id', id: number, dir: 'up' | 'down', sameKind = false) {
  const pool = db()
  const { rows: [me] } = await pool.query(`SELECT * FROM site.${table} WHERE id = $1`, [id])
  if (!me) return
  const kindCond = sameKind ? `AND kind = '${me.kind === 'plan' ? 'plan' : 'photo'}'` : ''
  const { rows: [other] } = await pool.query(
    `SELECT id, sort_order FROM site.${table} WHERE ${parent} = $1 ${kindCond}
       AND (sort_order, id) ${dir === 'up' ? '<' : '>'} ($2, $3)
     ORDER BY sort_order ${dir === 'up' ? 'DESC' : 'ASC'}, id ${dir === 'up' ? 'DESC' : 'ASC'} LIMIT 1`,
    [me[parent], me.sort_order, id],
  )
  if (!other) return
  // Αν έχουν ίδιο sort_order, δώσε καθαρές τιμές.
  const a = other.sort_order === me.sort_order ? me.sort_order + (dir === 'up' ? -1 : 1) : other.sort_order
  await pool.query(`UPDATE site.${table} SET sort_order = $2 WHERE id = $1`, [id, a])
  await pool.query(`UPDATE site.${table} SET sort_order = $2 WHERE id = $1`, [other.id, me.sort_order])
}
