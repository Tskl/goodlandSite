import Link from 'next/link'
import { notFound } from 'next/navigation'
import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import {
  addUnitAction, deleteMediaAction, deletePropertyAction, deleteUnitAction, moveMediaAction,
  moveUnitAction, savePropertyAction, saveUnitAction, setStatusAction, uploadMediaAction,
} from '@/lib/admin/actions'
import { ENERGY, STATUSES, UNIT_TYPES, euro, floorsText } from '@/lib/admin/util'
import { floorLabel } from '@/lib/floors'
import { AdminBar, Field, Flash, type SP } from '@/components/admin/ui'
import { AreaPicker, Submit, Uploader } from '@/components/admin/client'

type Params = { params: Promise<{ id: string }>; searchParams: SP }

const STATUS_LABEL = Object.fromEntries(STATUSES) as Record<string, string>
const TYPE_LABEL = Object.fromEntries(UNIT_TYPES) as Record<string, string>

export default async function EditProperty({ params, searchParams }: Params) {
  const admin = await requireAdmin()
  const id = Number((await params).id)
  if (!Number.isFinite(id)) notFound()

  const pool = db()
  const [{ rows: [p] }, { rows: units }, { rows: media }, { rows: pins }, { rows: areas }] = await Promise.all([
    pool.query('SELECT * FROM site.properties WHERE id = $1', [id]),
    pool.query('SELECT * FROM site.units WHERE property_id = $1 ORDER BY sort_order, id', [id]),
    pool.query('SELECT * FROM site.media WHERE property_id = $1 ORDER BY kind, sort_order, id', [id]),
    pool.query('SELECT up.unit_id, up.media_id FROM site.unit_plans up JOIN site.units u ON u.id = up.unit_id WHERE u.property_id = $1', [id]),
    pool.query('SELECT id, name_el FROM site.areas ORDER BY name_el'),
  ])
  if (!p) notFound()

  const photos = media.filter((m) => m.kind === 'photo')
  const plans = media.filter((m) => m.kind === 'plan').sort((a, b) => a.plan_floor - b.plan_floor || String(a.plan_code).localeCompare(b.plan_code, 'el'))
  const pinned = new Map<number, Set<number>>()
  for (const r of pins) {
    const u = Number(r.unit_id)
    if (!pinned.has(u)) pinned.set(u, new Set())
    pinned.get(u)!.add(Number(r.media_id))
  }
  const usedBy = new Map<number, number>() // media → unit
  for (const r of pins) usedBy.set(Number(r.media_id), Number(r.unit_id))

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main">
        <p className="adm-crumbs"><Link href="/admin">Ακίνητα</Link> /</p>
        <div className="adm-head">
          <h1>{p.address_el}</h1>
          <div className="adm-head__side">
            {p.is_published
              ? <a className="adm-btn adm-btn--ghost" href={`/${p.slug}`} target="_blank" rel="noopener">Δες τη σελίδα ↗</a>
              : <span className="adm-tag">Κρυφό από το site</span>}
          </div>
        </div>
        <Flash searchParams={searchParams} />

        <nav className="adm-tabs">
          <a href="#info">Στοιχεία</a>
          <a href="#units">Διαμερίσματα ({units.length})</a>
          <a href="#media">Φωτογραφίες ({photos.length})</a>
          <a href="#plans">Κατόψεις ({plans.length})</a>
        </nav>

        {/* ── Στοιχεία ─────────────────────────────────────────── */}
        <section id="info" className="adm-card">
          <h2>Στοιχεία ακινήτου</h2>
          <form action={savePropertyAction} className="adm-form adm-grid2">
            <input type="hidden" name="id" value={p.id} />
            <Field label="Διεύθυνση"><input name="address_el" defaultValue={p.address_el} required /></Field>
            <Field label="Διεύθυνση στα αγγλικά" hint="Κενό = αυτόματη μεταγραφή.">
              <input name="address_en" defaultValue={p.address_en ?? ''} /></Field>
            <AreaPicker areas={areas.map((a) => ({ id: Number(a.id), name_el: a.name_el }))} value={Number(p.area_id)} />
            <Field label="Διεύθυνση σελίδας (URL)"
                   hint={p.slug_locked ? 'Κλειδωμένο: είναι URL του παλιού site και το Google το ξέρει. Δεν αλλάζει.' : 'Άλλαξέ το μόνο πριν δημοσιευτεί.'}>
              <input name="slug" defaultValue={p.slug} readOnly={p.slug_locked} pattern="[^\s/A-Z]{2,120}" />
            </Field>
            <Field label="Είδος">
              <select name="kind" defaultValue={p.kind}>
                <option value="new-build">Νεόδμητο</option>
                <option value="resale">Μεταπώληση</option>
              </select>
            </Field>
            <Field label="Ενεργειακή κλάση">
              <select name="energy_class" defaultValue={p.energy_class ?? ''}>
                <option value="">—</option>
                {ENERGY.map((e) => <option key={e} value={e}>{e}</option>)}
              </select>
            </Field>
            <Field label="Περιγραφή κτηρίου" hint="Μία κουκκίδα ανά γραμμή." wide>
              <textarea name="description_el" rows={5} defaultValue={p.description_el} /></Field>
            <Field label="Περιγραφή κτηρίου — αγγλικά" hint="Κενό = εμφανίζεται η ελληνική." wide>
              <textarea name="description_en" rows={5} defaultValue={p.description_en ?? ''} /></Field>
            <details className="adm-more adm-field--wide">
              <summary>Για το Google (προαιρετικά)</summary>
              <div className="adm-grid2">
                <Field label="Τίτλος σελίδας" hint="Κενό = «Διεύθυνση, Περιοχή»."><input name="seo_title_el" defaultValue={p.seo_title_el ?? ''} /></Field>
                <Field label="Τίτλος — αγγλικά"><input name="seo_title_en" defaultValue={p.seo_title_en ?? ''} /></Field>
                <Field label="Περιγραφή για το Google"><textarea name="seo_description_el" rows={2} defaultValue={p.seo_description_el ?? ''} /></Field>
                <Field label="Περιγραφή — αγγλικά"><textarea name="seo_description_en" rows={2} defaultValue={p.seo_description_en ?? ''} /></Field>
              </div>
            </details>
            <label className="adm-check adm-field--wide">
              <input type="checkbox" name="is_published" defaultChecked={p.is_published} />
              <span><b>Δημοσιευμένο</b> — εμφανίζεται στο site</span>
            </label>
            <div className="adm-field--wide"><Submit>Αποθήκευση στοιχείων</Submit></div>
          </form>
        </section>

        {/* ── Διαμερίσματα ─────────────────────────────────────── */}
        <section id="units" className="adm-card">
          <h2>Διαμερίσματα</h2>
          {units.length === 0 && <p className="adm-dim">Δεν υπάρχουν ακόμα. Πρόσθεσε το πρώτο παρακάτω.</p>}
          <div className="adm-units">
            {units.map((u, i) => {
              const floors: number[] = (u.floors ?? []).map(Number)
              const label = u.floor_label_el || floorLabel(floors).el || 'χωρίς όροφο'
              const mine = pinned.get(Number(u.id)) ?? new Set<number>()
              const floorPlans = plans.filter((m) => floors.includes(Number(m.plan_floor)))
              return (
                <details key={u.id} id={`u${u.id}`} className={`adm-unit is-${u.status}`}>
                  <summary>
                    <span className="adm-unit__main">
                      <b>{label}</b> · {TYPE_LABEL[u.unit_type]} · <b>{Number(u.sqm)} τ.μ.</b>
                      {u.price_eur ? ` · ${euro(u.price_eur)}` : ''}
                    </span>
                    <span className={`adm-pill is-${u.status}`}>{STATUS_LABEL[u.status]}</span>
                  </summary>

                  <div className="adm-unit__quick">
                    <span className="adm-dim">Γρήγορη αλλαγή:</span>
                    {STATUSES.filter(([k]) => k !== u.status).map(([k, l]) => (
                      <form key={k} action={setStatusAction}>
                        <input type="hidden" name="id" value={u.id} />
                        <input type="hidden" name="property_id" value={p.id} />
                        <input type="hidden" name="status" value={k} />
                        <Submit className={`adm-btn adm-btn--sm adm-btn--st is-${k}`}>{l}</Submit>
                      </form>
                    ))}
                    <span className="adm-spacer" />
                    <form action={moveUnitAction}>
                      <input type="hidden" name="id" value={u.id} /><input type="hidden" name="property_id" value={p.id} />
                      <input type="hidden" name="dir" value="up" />
                      <Submit className="adm-btn adm-btn--ghost adm-btn--sm">{i === 0 ? '·' : '↑'}</Submit>
                    </form>
                    <form action={moveUnitAction}>
                      <input type="hidden" name="id" value={u.id} /><input type="hidden" name="property_id" value={p.id} />
                      <input type="hidden" name="dir" value="down" />
                      <Submit className="adm-btn adm-btn--ghost adm-btn--sm">{i === units.length - 1 ? '·' : '↓'}</Submit>
                    </form>
                  </div>

                  <form action={saveUnitAction} className="adm-form adm-grid3">
                    <input type="hidden" name="id" value={u.id} />
                    <input type="hidden" name="property_id" value={p.id} />
                    <UnitFields u={u} />
                    <fieldset className="adm-field--wide adm-plans-pick">
                      <legend>Κάτοψη του διαμερίσματος</legend>
                      {plans.length === 0 && <p className="adm-dim">Δεν έχουν ανέβει κατόψεις για αυτό το ακίνητο.</p>}
                      {plans.length > 0 && (
                        <>
                          <p className="adm-dim">
                            Τσέκαρε την κάτοψη (ή τις δύο, για μεζονέτα) που αντιστοιχεί σε αυτό το διαμέρισμα.
                            Αν δεν τσεκάρεις καμία, το site δείχνει όλες τις κατόψεις του ορόφου
                            {floorPlans.length ? ` (${floorPlans.map((m) => m.plan_code).join(', ')})` : ''}.
                          </p>
                          <div className="adm-plan-checks">
                            {plans.map((m) => {
                              const other = usedBy.get(Number(m.id))
                              const takenByOther = other != null && other !== Number(u.id)
                              const wrongFloor = floors.length > 0 && !floors.includes(Number(m.plan_floor))
                              return (
                                <label key={m.id} className={`adm-plan-check ${takenByOther || wrongFloor ? 'is-off' : ''}`}
                                       title={takenByOther ? 'Ανήκει σε άλλο διαμέρισμα' : wrongFloor ? 'Άλλος όροφος' : ''}>
                                  <input type="checkbox" name="plan" value={m.id} defaultChecked={mine.has(Number(m.id))}
                                         disabled={(takenByOther || wrongFloor) && !mine.has(Number(m.id))} />
                                  <img src={m.url} alt="" loading="lazy" />
                                  <span>{m.plan_code} · {floorLabel([Number(m.plan_floor)]).el}</span>
                                </label>
                              )
                            })}
                          </div>
                        </>
                      )}
                    </fieldset>
                    <div className="adm-field--wide adm-actions">
                      <Submit>Αποθήκευση διαμερίσματος</Submit>
                    </div>
                  </form>
                  <form action={deleteUnitAction} className="adm-danger-inline">
                    <input type="hidden" name="id" value={u.id} />
                    <input type="hidden" name="property_id" value={p.id} />
                    <Submit className="adm-btn adm-btn--danger adm-btn--sm"
                            confirm={`Διαγραφή του διαμερίσματος ${Number(u.sqm)} τ.μ.; Δεν αναιρείται. (Αν πουλήθηκε, βάλε «Πουλήθηκε» αντί για διαγραφή.)`}>
                      Διαγραφή διαμερίσματος
                    </Submit>
                  </form>
                </details>
              )
            })}
          </div>

          <details className="adm-unit adm-unit--new">
            <summary><b>+ Νέο διαμέρισμα</b></summary>
            <form action={addUnitAction} className="adm-form adm-grid3">
              <input type="hidden" name="property_id" value={p.id} />
              <UnitFields />
              <div className="adm-field--wide"><Submit>Προσθήκη</Submit></div>
            </form>
          </details>
        </section>

        {/* ── Φωτογραφίες ──────────────────────────────────────── */}
        <section id="media" className="adm-card">
          <h2>Φωτογραφίες κτηρίου</h2>
          <p className="adm-dim">Η πρώτη είναι η κεντρική φωτογραφία της σελίδας και της κάρτας. Οι κατόψεις μπαίνουν στην επόμενη ενότητα, όχι εδώ.</p>
          <Uploader propertyId={Number(p.id)} kind="photo" action={uploadMediaAction} />
          <MediaGrid items={photos} propertyId={Number(p.id)} />
        </section>

        {/* ── Κατόψεις ─────────────────────────────────────────── */}
        <section id="plans" className="adm-card">
          <h2>Κατόψεις</h2>
          <p className="adm-dim">
            Κωδικός όπως γράφει πάνω στο σχέδιο: <b>Α1</b> = 1ος όροφος, διαμέρισμα 1 · <b>ΙΣ2</b> = ισόγειο 2 · <b>Ε3</b>, <b>ΣΤ3</b> για μεζονέτα.
            Μετά τσεκάρεις σε ποιο διαμέρισμα ανήκει, μέσα στο διαμέρισμα.
          </p>
          <Uploader propertyId={Number(p.id)} kind="plan" action={uploadMediaAction} />
          <MediaGrid items={plans} propertyId={Number(p.id)} plan usedBy={usedBy} units={units} />
        </section>

        {/* ── Διαγραφή ─────────────────────────────────────────── */}
        <section className="adm-card adm-card--danger">
          <h2>Διαγραφή ακινήτου</h2>
          {p.slug_locked ? (
            <p className="adm-dim">
              Αυτό το ακίνητο είναι σελίδα του παλιού site που την ξέρει το Google, γι' αυτό δεν διαγράφεται.
              Αν δεν θέλεις να φαίνεται, βγάλε το τσεκ «Δημοσιευμένο» στα στοιχεία.
            </p>
          ) : (
            <form action={deletePropertyAction} className="adm-form">
              <input type="hidden" name="id" value={p.id} />
              <Field label={`Για επιβεβαίωση γράψε: ${p.address_el}`}>
                <input name="confirm" autoComplete="off" />
              </Field>
              <Submit className="adm-btn adm-btn--danger">Οριστική διαγραφή με όλα τα διαμερίσματα και τις φωτογραφίες</Submit>
            </form>
          )}
        </section>
      </main>
    </>
  )
}

/* ── Πεδία διαμερίσματος (ίδια για νέο και για επεξεργασία) ───────── */
function UnitFields({ u }: { u?: Record<string, any> }) {
  return (
    <>
      <Field label="Όροφος" hint="π.χ. 3 · 4-5 για μεζονέτα · Ισόγειο">
        <input name="floors" defaultValue={floorsText(u?.floors?.map(Number))} required />
      </Field>
      <Field label="Τύπος">
        <select name="unit_type" defaultValue={u?.unit_type ?? 'apartment'}>
          {UNIT_TYPES.map(([k, l]) => <option key={k} value={k}>{l}</option>)}
        </select>
      </Field>
      <Field label="Τετραγωνικά (τ.μ.)">
        <input name="sqm" inputMode="decimal" defaultValue={u ? Number(u.sqm) : ''} required />
      </Field>
      <Field label="Υπνοδωμάτια">
        <input name="bedrooms" type="number" min={0} max={10} defaultValue={u?.bedrooms ?? ''} />
      </Field>
      <Field label="Κατάσταση">
        <select name="status" defaultValue={u?.status ?? 'available'}>
          {STATUSES.map(([k, l]) => <option key={k} value={k}>{l}</option>)}
        </select>
      </Field>
      <Field label="Τιμή (€)" hint="Κενό = «Κατόπιν επικοινωνίας». Στα πουλημένα δεν φαίνεται.">
        <input name="price" inputMode="numeric" defaultValue={u?.price_eur ?? ''} placeholder="295000" />
      </Field>
      <Field label="Περιγραφή" wide hint="Από εδώ το site βγάζει μόνο του πάρκινγκ, αποθήκη, θέρμανση κ.λπ. — γράψε τα όπως στα υπάρχοντα.">
        <textarea name="description_el" rows={4} defaultValue={u?.description_el ?? ''} />
      </Field>
      <Field label="Περιγραφή — αγγλικά" wide hint="Κενό = εμφανίζεται η ελληνική.">
        <textarea name="description_en" rows={3} defaultValue={u?.description_en ?? ''} />
      </Field>
      <details className="adm-more adm-field--wide">
        <summary>Ετικέτα ορόφου (σπάνια χρειάζεται)</summary>
        <div className="adm-grid2">
          <Field label="Ετικέτα" hint="Κενό = αυτόματα από τον όροφο (π.χ. «4ος-5ος όροφος»). Μόνο για ειδικές, π.χ. «Ισόγειο 3».">
            <input name="floor_label_el" defaultValue={u?.floor_label_el ?? ''} /></Field>
          <Field label="Ετικέτα — αγγλικά"><input name="floor_label_en" defaultValue={u?.floor_label_en ?? ''} /></Field>
        </div>
      </details>
    </>
  )
}

/* ── Πλέγμα φωτογραφιών / κατόψεων με σειρά και διαγραφή ─────────── */
function MediaGrid({ items, propertyId, plan, usedBy, units }: {
  items: Record<string, any>[]; propertyId: number; plan?: boolean
  usedBy?: Map<number, number>; units?: Record<string, any>[]
}) {
  if (!items.length) return <p className="adm-dim">Δεν υπάρχουν ακόμα.</p>
  const unitName = (uid?: number) => {
    const u = units?.find((x) => Number(x.id) === uid)
    return u ? `${Number(u.sqm)} τ.μ.` : null
  }
  return (
    <ul className="adm-media">
      {items.map((m, i) => (
        <li key={m.id}>
          <a href={m.url} target="_blank" rel="noopener"><img src={m.url} alt="" loading="lazy" /></a>
          <div className="adm-media__bar">
            {plan
              ? <span><b>{m.plan_code}</b> · {floorLabel([Number(m.plan_floor)]).el}{usedBy?.get(Number(m.id)) ? ` · ${unitName(usedBy.get(Number(m.id)))}` : ''}</span>
              : <span>{i === 0 ? <b>Κεντρική</b> : `#${i + 1}`}</span>}
            <span className="adm-spacer" />
            {(['up', 'down'] as const).map((dir) => (
              <form key={dir} action={moveMediaAction}>
                <input type="hidden" name="id" value={m.id} /><input type="hidden" name="property_id" value={propertyId} />
                <input type="hidden" name="dir" value={dir} />
                <Submit className="adm-btn adm-btn--ghost adm-btn--xs">{dir === 'up' ? '←' : '→'}</Submit>
              </form>
            ))}
            <form action={deleteMediaAction}>
              <input type="hidden" name="id" value={m.id} /><input type="hidden" name="property_id" value={propertyId} />
              <Submit className="adm-btn adm-btn--danger adm-btn--xs" confirm={plan ? `Διαγραφή της κάτοψης ${m.plan_code};` : 'Διαγραφή της φωτογραφίας;'}>✕</Submit>
            </form>
          </div>
        </li>
      ))}
    </ul>
  )
}
