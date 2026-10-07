import type { Metadata } from 'next'

/* Το admin διαβάζει πάντα φρέσκα από τη βάση — καμία cache — και δεν εμφανίζεται στο Google. */
export const dynamic = 'force-dynamic'
export const revalidate = 0

export const metadata: Metadata = {
  title: { absolute: 'Διαχείριση — Εύγειος' },
  robots: { index: false, follow: false },
}

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return <div className="adm">{children}</div>
}
