import Link from 'next/link'
import Image from 'next/image'
import { properties } from '@/content/properties'
import { services } from '@/content/services'
import { site } from '@/content/site'
import { unitsOf, priceNumber } from '@/lib/features'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import UnitCard from '@/components/UnitCard'
import Shell from '@/components/Shell'

export default function Home({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  const all = properties.flatMap((p) => unitsOf(p).map((u) => ({ u, p })))
  const avail = all.filter((x) => x.u.status === 'available')
  const prices = avail.map((x) => priceNumber(x.u.price)).filter(Boolean) as number[]
  const areas = new Set(properties.map((p) => p.area.el))
  const featured = [...avail]
    .sort((a, b) => (priceNumber(a.u.price) ?? 9e9) - (priceNumber(b.u.price) ?? 9e9))
    .slice(0, 3)
  const hero = properties.find((p) => p.images.length)?.images[0]

  return (
    <Shell lang={lang}>
      <div className="hero">
        {hero && (
          <div className="hero__bg">
            <Image src={hero} alt={lang === 'en' ? 'A new Goodland apartment building in Athens' : 'Νεόδμητη πολυκατοικία της Εύγειος Goodland στην Αθήνα'}
                   fill priority sizes="100vw" style={{ objectFit: 'cover' }} />
          </div>
        )}
        <div className="hero__scrim" />
        <div className="container hero__inner rise">
          <div className="eyebrow" style={{ marginBottom: 24 }}>{T('heroEyebrow')}</div>
          <h1>{T('heroLine1')}<br />{T('heroLine2')}</h1>
          <p className="lead">{T('heroLead')}</p>
          <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap', marginTop: 32 }}>
            <Link className="btn" href={L('/pros-polisi')}>{T('seeAvailable')}</Link>
            <a className="btn btn--ghost" href={site.phoneHref}>{site.phone}</a>
          </div>

          <div className="stats">
            <div><b>{avail.length}</b><span className="label">{T('statAvailable')}</span></div>
            <div><b>{properties.length}</b><span className="label">{T('statProjects')}</span></div>
            <div><b>{areas.size}</b><span className="label">{T('statAreas')}</span></div>
            {prices.length > 0 && (
              <div>
                <b>€{(Math.min(...prices) / 1000).toFixed(0)}{lang === 'en' ? 'k' : 'κ'}</b>
                <span className="label">{T('statFrom')}</span>
              </div>
            )}
          </div>
        </div>
      </div>

      <section className="container">
        <div className="label">01 — {T('forSale')}</div>
        <h2 style={{ marginTop: 14 }}>{T('availableNow')}</h2>
        <div className="grid">
          {featured.map(({ u, p }, i) => (
            <UnitCard key={`${p.slug}-${u.id}`} unit={u} property={p} priority={i === 0} lang={lang} />
          ))}
        </div>
        <p style={{ marginTop: 40 }}>
          <Link className="btn btn--text" href={L('/pros-polisi')}>{T('allNAvailable', { n: avail.length })}</Link>
        </p>
      </section>

      <section className="container">
        <div className="label">02 — {T('whatWeDo')}</div>
        <h2 style={{ marginTop: 14 }}>{T('fromPlotLine1')}<br />{T('fromPlotLine2')}</h2>
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

      <section className="container">
        <div className="label">03 — {T('theCompany')}</div>
        <h2 style={{ marginTop: 14, maxWidth: '18ch' }}>{T('yearsTitle')}</h2>
        <p className="lead" style={{ maxWidth: '58ch' }}>{T('yearsLead')}</p>
        <p style={{ marginTop: 32 }}>
          <Link className="btn btn--text" href={L('/olokliromena-erga')}>{T('seeCompleted')}</Link>
        </p>
      </section>

      <section className="container">
        <div className="label">04 — {T('contact')}</div>
        <h2 style={{ marginTop: 14 }}>{T('letsTalk')}</h2>
        <p className="lead">{T('tellUsLead')}</p>
        <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap', marginTop: 32 }}>
          <a className="btn" href={site.phoneHref}>{site.phone}</a>
          <Link className="btn btn--ghost" href={L('/contact')}>{T('sendMessage')}</Link>
        </div>
      </section>
    </Shell>
  )
}
