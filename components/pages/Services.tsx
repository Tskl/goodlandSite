import Link from 'next/link'
import { services } from '@/content/services'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import Shell from '@/components/Shell'

export default function Services({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  return (
    <Shell lang={lang}>
      <div className="container">
        <nav className="crumbs"><Link href={L('/')}>{T('home')}</Link><span>/</span>{T('services')}</nav>

        <section style={{ paddingBottom: 0 }}>
          <h1>{T('services')}</h1>
          <p className="lead" style={{ marginTop: 28 }}>{T('servicesLead')}</p>
          <div className="svc">
            {services.map((s, i) => (
              <Link key={s.href} href={L(s.href)}>
                <span className="svc__n">{String(i + 1).padStart(2, '0')}</span>
                <span className="svc__t">{t(s.title, lang)}</span>
                <span className="svc__arrow">→</span>
                <span className="svc__d">{t(s.description, lang)}</span>
              </Link>
            ))}
          </div>
        </section>

        <section>
          <h2>{T('plotTitle')}</h2>
          <p className="lead">{T('plotLead')}</p>
          <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap', marginTop: 32 }}>
            <a className="btn" href={site.phoneHref}>{site.phone}</a>
            <Link className="btn btn--ghost" href={L('/contact')}>{T('sendMessage')}</Link>
          </div>
        </section>
      </div>
    </Shell>
  )
}
