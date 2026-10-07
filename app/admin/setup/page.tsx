import { redirect } from 'next/navigation'
import { db } from '@/lib/db'
import { setupAction } from '@/lib/admin/actions'
import { Field, Flash, type SP } from '@/components/admin/ui'
import { Submit } from '@/components/admin/client'

/** Πρώτο στήσιμο — υπάρχει μόνο όσο δεν έχει φτιαχτεί κανένας χρήστης. */
export default async function Setup({ searchParams }: { searchParams: SP }) {
  const { rows } = await db().query('SELECT count(*)::int AS n FROM site.admins')
  if (rows[0].n > 0) redirect('/admin/login')

  return (
    <main className="adm-auth">
      <h1>Πρώτο στήσιμο</h1>
      <p className="adm-dim">
        Φτιάχνεις τον πρώτο λογαριασμό. Για να αποδείξεις ότι είσαι εσύ, γράψε τον κωδικό της βάσης
        (αυτόν που μπήκε στο <code>DATABASE_URL</code> του Vercel). Η σελίδα κλείνει μόλις φτιαχτεί ο λογαριασμός.
      </p>
      <Flash searchParams={searchParams} />
      <form action={setupAction} className="adm-form">
        <Field label="Κωδικός της βάσης (Supabase)">
          <input name="dbpassword" type="password" autoComplete="off" required />
        </Field>
        <Field label="Όνομα χρήστη" hint="Λατινικά πεζά, χωρίς κενά.">
          <input name="username" defaultValue="angelos" autoCapitalize="none" required />
        </Field>
        <Field label="Όνομα που φαίνεται">
          <input name="display_name" defaultValue="Άγγελος" required />
        </Field>
        <Field label="Νέος κωδικός για το admin" hint="Τουλάχιστον 10 χαρακτήρες, γράμματα και αριθμοί. Όχι ο κωδικός της βάσης.">
          <input name="password" type="password" autoComplete="new-password" required minLength={10} />
        </Field>
        <Field label="Ξανά ο νέος κωδικός">
          <input name="password2" type="password" autoComplete="new-password" required minLength={10} />
        </Field>
        <Submit>Δημιουργία λογαριασμού</Submit>
      </form>
    </main>
  )
}
