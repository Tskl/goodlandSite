import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import { createPropertyAction } from '@/lib/admin/actions'
import { ENERGY } from '@/lib/admin/util'
import { AdminBar, Field, Flash, type SP } from '@/components/admin/ui'
import { AreaPicker, Submit } from '@/components/admin/client'

export default async function NewProperty({ searchParams }: { searchParams: SP }) {
  const admin = await requireAdmin()
  const { rows: areas } = await db().query('SELECT id, name_el FROM site.areas ORDER BY name_el')

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main adm-narrow">
        <h1>Νέο ακίνητο</h1>
        <p className="adm-dim">
          Ξεκινάς με τα βασικά. Αμέσως μετά ανοίγει η σελίδα του, όπου προσθέτεις περιγραφή, διαμερίσματα, φωτογραφίες και κατόψεις.
          Μένει <b>κρυφό</b> από το site μέχρι να τσεκάρεις «Δημοσιευμένο».
        </p>
        <Flash searchParams={searchParams} />
        <form action={createPropertyAction} className="adm-form">
          <Field label="Διεύθυνση" hint="Όπως θα φαίνεται ως τίτλος, π.χ. «Γλυφάδας 10».">
            <input name="address_el" required autoFocus />
          </Field>
          <AreaPicker areas={areas.map((a) => ({ id: Number(a.id), name_el: a.name_el }))} />
          <Field label="Διεύθυνση σελίδας (URL) — προαιρετικό"
                 hint="Αν το αφήσεις κενό, φτιάχνεται μόνο του από διεύθυνση και περιοχή (π.χ. glyfadas-10-glyfada). Μόνο λατινικά πεζά και παύλες.">
            <input name="slug" pattern="[a-z0-9-]{3,80}" autoCapitalize="none" />
          </Field>
          <div className="adm-row">
            <Field label="Είδος">
              <select name="kind" defaultValue="new-build">
                <option value="new-build">Νεόδμητο</option>
                <option value="resale">Μεταπώληση</option>
              </select>
            </Field>
            <Field label="Ενεργειακή κλάση">
              <select name="energy_class" defaultValue="Α">
                <option value="">—</option>
                {ENERGY.map((e) => <option key={e} value={e}>{e}</option>)}
              </select>
            </Field>
          </div>
          <Submit>Δημιουργία</Submit>
        </form>
      </main>
    </>
  )
}
