import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import { changePasswordAction, createAdminAction, toggleAdminAction } from '@/lib/admin/actions'
import { AdminBar, Field, Flash, type SP } from '@/components/admin/ui'
import { Submit } from '@/components/admin/client'

export default async function Users({ searchParams }: { searchParams: SP }) {
  const admin = await requireAdmin()
  const { rows } = await db().query(`
    SELECT id, username, display_name, is_active,
           to_char(last_login_at AT TIME ZONE 'Europe/Athens', 'DD/MM/YYYY HH24:MI') AS last_login
    FROM site.admins ORDER BY id`)

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main adm-narrow">
        <h1>Χρήστες</h1>
        <Flash searchParams={searchParams} />

        <section className="adm-card">
          <h2>Ποιοι μπαίνουν</h2>
          <ul className="adm-users">
            {rows.map((u) => (
              <li key={u.id} className={u.is_active ? '' : 'is-off'}>
                <div>
                  <b>{u.display_name}</b> <span className="adm-dim">({u.username})</span>
                  {!u.is_active && <span className="adm-tag">Απενεργοποιημένος</span>}
                  <div className="adm-dim">Τελευταία είσοδος: {u.last_login ?? '—'}</div>
                </div>
                <details>
                  <summary className="adm-btn adm-btn--ghost adm-btn--sm">Νέος κωδικός</summary>
                  <form action={changePasswordAction} className="adm-form adm-inline">
                    <input type="hidden" name="id" value={u.id} />
                    <input name="password" type="password" autoComplete="new-password" minLength={10} required placeholder="νέος κωδικός" />
                    <Submit className="adm-btn adm-btn--sm">Αλλαγή</Submit>
                  </form>
                </details>
                {Number(u.id) !== admin.id && (
                  <form action={toggleAdminAction}>
                    <input type="hidden" name="id" value={u.id} />
                    <Submit className="adm-btn adm-btn--ghost adm-btn--sm">{u.is_active ? 'Απενεργοποίηση' : 'Ενεργοποίηση'}</Submit>
                  </form>
                )}
              </li>
            ))}
          </ul>
        </section>

        <section className="adm-card">
          <h2>Νέος χρήστης</h2>
          <form action={createAdminAction} className="adm-form adm-grid2">
            <Field label="Όνομα χρήστη" hint="Λατινικά πεζά, π.χ. maya"><input name="username" autoCapitalize="none" required /></Field>
            <Field label="Όνομα που φαίνεται"><input name="display_name" placeholder="Μάγια" required /></Field>
            <Field label="Αρχικός κωδικός" hint="Τουλάχιστον 10 χαρακτήρες, γράμματα και αριθμοί. Δώσ' τον στον χρήστη και ας τον αλλάξει." wide>
              <input name="password" type="text" autoComplete="off" minLength={10} required /></Field>
            <div className="adm-field--wide"><Submit>Δημιουργία</Submit></div>
          </form>
        </section>
      </main>
    </>
  )
}
