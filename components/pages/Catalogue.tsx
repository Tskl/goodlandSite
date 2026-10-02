import Link from 'next/link'
import { getContent } from '@/lib/content'
import { site } from '@/content/site'
import { priceNumber, unitsOf } from '@/lib/features'
import type { Lang } from '@/lib/i18n'
import { href, num, tr } from '@/lib/i18n'
import Listing from '@/components/Listing'
import Shell from '@/components/Shell'

export default async function Catalogue({ lang }: { lang: Lang }) {
  const { properties } = await getContent()
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  const all = properties.flatMap((p) => unitsOf(p))
  const avail = all.filter((u) => u.status === 'available')
  const prices = avail.map((u) => priceNumber(u.price)).filter(Boolean) as number[]
  const areas = new Set(properties.map((p) => p.area.el))

  return (
    <Shell lang={lang}>
      <div className="container">
        <nav className="crumbs"><Link href={L('/')}>{T('home')}</Link><span>/</span>{T('forSale')}</nav>

        <section style={{ paddingBottom: 0 }}>
          <h1>{T('forSaleLine1')}<br />{T('forSaleLine2')}</h1>
          <p className="lead" style={{ marginTop: 28 }}>{T('catalogueLead')}</p>
          <div className="stats" style={{ marginBottom: 56 }}>
            <div><b>{avail.length}</b><span className="label">{T('availableOf')}</span></div>
            <div><b>{properties.length}</b><span className="label">{T('statProjects')}</span></div>
            <div><b>{areas.size}</b><span className="label">{T('statAreas')}</span></div>
            {prices.length > 0 && (
              <div><b>€{num(Math.min(...prices), lang)}</b><span className="label">{T('statFrom')}</span></div>
            )}
          </div>

          <Listing properties={properties} lang={lang} />
        </section>

        <section>
          <h2>{T('notFoundTitle')}</h2>
          <p className="lead">{T('notFoundLead')}</p>
          <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap', marginTop: 32 }}>
            <a className="btn" href={site.phoneHref}>{site.phone}</a>
            <Link className="btn btn--ghost" href={L('/contact')}>{T('sendMessage')}</Link>
          </div>
        </section>
      </div>
    </Shell>
  )
}
