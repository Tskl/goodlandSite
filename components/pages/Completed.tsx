import Link from 'next/link'
import { areas } from '@/content/areas'
import { label, name } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'
import { href, tr } from '@/lib/i18n'
import Shell from '@/components/Shell'
import MediaCard from '@/components/MediaCard'

export default function Completed({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)
  const buildings = areas.reduce((n, a) => n + a.buildings.length, 0)

  return (
    <Shell lang={lang}>
      <div className="container">
        <nav className="crumbs">
          <Link href={L('/')}>{T('home')}</Link><span>/</span>{T('completedFull')}
        </nav>

        <section style={{ paddingBottom: 0 }}>
          <h1>{T('completedFull')}</h1>
          <p className="lead" style={{ marginTop: 28 }}>
            {T('completedLead', { b: buildings, a: areas.length })}
          </p>

          <div className="grid grid--wide">
            {areas.map((a, i) => (
              <MediaCard
                key={a.slug}
                href={L(`/${a.slug}`)}
                title={name(a.area.el, lang)}
                meta={a.buildings.length === 1 ? T('nBuilding', { n: 1 }) : T('nBuildings', { n: a.buildings.length })}
                sub={a.buildings.map((b) => label(b.address, lang).split(',')[0]).join(' · ')}
                images={a.images}
                priority={i < 2}
                lang={lang}
              />
            ))}
          </div>
        </section>
      </div>
    </Shell>
  )
}
