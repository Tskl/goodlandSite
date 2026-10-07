import { redirect } from 'next/navigation'
import { db } from '@/lib/db'
import { getAdmin } from '@/lib/admin/auth'
import { loginAction } from '@/lib/admin/actions'
import { Field, Flash, type SP } from '@/components/admin/ui'
import { Submit } from '@/components/admin/client'

export default async function Login({ searchParams }: { searchParams: SP }) {
  if (await getAdmin()) redirect('/admin')
  const { rows } = await db().query('SELECT count(*)::int AS n FROM site.admins')
  if (rows[0].n === 0) redirect('/admin/setup')

  return (
    <main className="adm-auth">
      <h1>Διαχείριση</h1>
      <p className="adm-dim">Εύγειος Goodland — goodland.gr</p>
      <Flash searchParams={searchParams} />
      <form action={loginAction} className="adm-form">
        <Field label="Όνομα χρήστη">
          <input name="username" autoComplete="username" autoCapitalize="none" required autoFocus />
        </Field>
        <Field label="Κωδικός">
          <input name="password" type="password" autoComplete="current-password" required />
        </Field>
        <Submit>Είσοδος</Submit>
      </form>
    </main>
  )
}
