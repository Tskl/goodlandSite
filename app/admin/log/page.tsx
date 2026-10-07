import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import { AdminBar } from '@/components/admin/ui'

/** Ποιος άλλαξε τι — οι τελευταίες 200 αλλαγές. */
export default async function Log() {
  const admin = await requireAdmin()
  const { rows } = await db().query(`
    SELECT l.id, l.action, l.summary, a.display_name AS who,
           to_char(l.at AT TIME ZONE 'Europe/Athens', 'DD/MM/YYYY HH24:MI') AS at
    FROM site.audit_log l LEFT JOIN site.admins a ON a.id = l.admin_id
    ORDER BY l.at DESC LIMIT 200`)
  const verb: Record<string, string> = { insert: 'Προσθήκη', update: 'Αλλαγή', delete: 'Διαγραφή' }

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main">
        <h1>Ιστορικό αλλαγών</h1>
        {rows.length === 0 ? <p className="adm-dim">Καμία αλλαγή ακόμα.</p> : (
          <div className="adm-table-wrap">
            <table className="adm-table">
              <thead><tr><th>Πότε</th><th>Ποιος</th><th>Τι</th><th>Λεπτομέρεια</th></tr></thead>
              <tbody>
                {rows.map((r) => (
                  <tr key={r.id}>
                    <td className="adm-dim">{r.at}</td>
                    <td>{r.who ?? '—'}</td>
                    <td>{verb[r.action] ?? r.action}</td>
                    <td>{r.summary}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </main>
    </>
  )
}
