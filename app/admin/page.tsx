import Link from 'next/link'
import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import { AdminBar, Flash, type SP } from '@/components/admin/ui'

export default async function AdminHome({ searchParams }: { searchParams: SP }) {
  const admin = await requireAdmin()
  const { rows } = await db().query(`
    SELECT p.id, p.slug, p.address_el, p.is_published, p.slug_locked, a.name_el AS area,
           count(u.*)::int AS units,
           count(u.*) FILTER (WHERE u.status = 'available')::int AS available,
           count(u.*) FILTER (WHERE u.status = 'reserved')::int AS reserved,
           (SELECT count(*)::int FROM site.media m WHERE m.property_id = p.id AND m.kind = 'photo') AS photos,
           to_char(p.updated_at AT TIME ZONE 'Europe/Athens', 'DD/MM/YYYY') AS updated
    FROM site.properties p
    JOIN site.areas a ON a.id = p.area_id
    LEFT JOIN site.units u ON u.property_id = p.id
    GROUP BY p.id, a.name_el
    ORDER BY p.sort_order, p.id`)

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main">
        <div className="adm-head">
          <h1>Ακίνητα προς πώληση</h1>
          <Link href="/admin/new" className="adm-btn">+ Νέο ακίνητο</Link>
        </div>
        <Flash searchParams={searchParams} />
        <div className="adm-table-wrap">
          <table className="adm-table">
            <thead>
              <tr><th>Ακίνητο</th><th>Περιοχή</th><th className="r">Διαμερίσματα</th><th className="r">Διαθέσιμα</th><th className="r">Φωτογρ.</th><th>Στο site</th><th>Αλλαγή</th></tr>
            </thead>
            <tbody>
              {rows.map((p) => (
                <tr key={p.id}>
                  <td><Link href={`/admin/p/${p.id}`} className="adm-strong">{p.address_el}</Link></td>
                  <td>{p.area}</td>
                  <td className="r">{p.units}</td>
                  <td className="r">{p.available}{p.reserved ? <span className="adm-dim"> +{p.reserved} κρατ.</span> : null}</td>
                  <td className="r">{p.photos}</td>
                  <td>{p.is_published ? <a href={`/${p.slug}`} target="_blank" rel="noopener">Ναι ↗</a> : <span className="adm-tag">Κρυφό</span>}</td>
                  <td className="adm-dim">{p.updated}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <p className="adm-dim" style={{ marginTop: 24 }}>
          Ό,τι αλλάζεις εδώ φαίνεται στο site αμέσως. Τα ολοκληρωμένα έργα, οι διαμορφώσεις και οι υπηρεσίες έρχονται σε επόμενη έκδοση.
        </p>
      </main>
    </>
  )
}
