import Link from 'next/link'
import Shell from '@/components/Shell'
import { tr } from '@/lib/i18n'

export default function NotFound() {
  const T = tr('el')
  return (
    <Shell lang="el">
      <div className="container">
        <section>
          <h1>{T('nf404')}</h1>
          <p className="dim">{T('nf404Lead')}</p>
          <p style={{ marginTop: 28, display: 'flex', gap: 14, flexWrap: 'wrap' }}>
            <Link className="btn" href="/pros-polisi">{T('seeProperties')}</Link>
            <Link className="btn btn--ghost" href="/">{T('home')}</Link>
          </p>
        </section>
      </div>
    </Shell>
  )
}
