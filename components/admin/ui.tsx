import Link from 'next/link'
import type { Admin } from '@/lib/admin/auth'
import { logoutAction } from '@/lib/admin/actions'
import { Submit } from './client'

export type SP = Promise<Record<string, string | string[] | undefined>>

/** Μήνυμα επιτυχίας / σφάλματος από το ?ok= / ?e= */
export async function Flash({ searchParams }: { searchParams: SP }) {
  const sp = await searchParams
  const ok = typeof sp.ok === 'string' ? sp.ok : null
  const e = typeof sp.e === 'string' ? sp.e : null
  if (!ok && !e) return null
  return (
    <p className={`adm-flash ${e ? 'adm-flash--err' : ''}`} role={e ? 'alert' : 'status'}>
      {e ?? ok}
    </p>
  )
}

export function AdminBar({ admin }: { admin: Admin }) {
  return (
    <header className="adm-bar">
      <nav>
        <Link href="/admin" className="adm-bar__home">Εύγειος · Διαχείριση</Link>
        <Link href="/admin">Ακίνητα</Link>
        <Link href="/admin/new">+ Νέο ακίνητο</Link>
        <Link href="/admin/users">Χρήστες</Link>
        <Link href="/admin/log">Ιστορικό</Link>
        <a href="/" target="_blank" rel="noopener">Το site ↗</a>
      </nav>
      <form action={logoutAction} className="adm-bar__me">
        <span>{admin.displayName}</span>
        <Submit className="adm-btn adm-btn--ghost adm-btn--sm">Αποσύνδεση</Submit>
      </form>
    </header>
  )
}

export function Field({ label, hint, children, wide }: { label: string; hint?: React.ReactNode; children: React.ReactNode; wide?: boolean }) {
  return (
    <label className={`adm-field ${wide ? 'adm-field--wide' : ''}`}>
      <span className="adm-field__label">{label}</span>
      {children}
      {hint && <span className="adm-field__hint">{hint}</span>}
    </label>
  )
}
