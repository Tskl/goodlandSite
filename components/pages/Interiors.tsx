import Link from 'next/link'
import { getContent } from '@/lib/content'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import Shell from '@/components/Shell'
import MediaCard from '@/components/MediaCard'

export default async function Interiors({ lang }: { lang: Lang }) {
  const { interiors } = await getContent()
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  return (
    <Shell lang={lang}>
      <div className="container">
        <nav className="crumbs"><Link href={L('/')}>{T('home')}</Link><span>/</span>{T('interiors')}</nav>

        <section style={{ paddingBottom: 0 }}>
          <h1>{T('interiorsLine1')}<br />{T('interiorsLine2')}</h1>
          <p className="lead" style={{ marginTop: 28 }}>{T('interiorsLead')}</p>

          <div className="grid grid--wide">
            {interiors.map((i, k) => (
              <MediaCard
                key={i.slug}
                href={L(`/${i.slug}`)}
                title={t(i.title, lang)}
                meta={T('seeMore')}
                images={i.images}
                priority={k < 2}
                lang={lang}
              />
            ))}
          </div>
        </section>

        <section>
          <h2>{T('ownPlaceTitle')}</h2>
          <p className="lead">{T('ownPlaceLead')}</p>
          <p style={{ marginTop: 32 }}><a className="btn" href={site.phoneHref}>{site.phone}</a></p>
        </section>
      </div>
    </Shell>
  )
}
