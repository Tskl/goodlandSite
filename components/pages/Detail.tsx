import Link from 'next/link'
import { bulletsOf, getContent } from '@/lib/content'
import Image from 'next/image'
import { notFound } from 'next/navigation'
import { site } from '@/content/site'
import Gallery from '@/components/Gallery'
import ContactForm from '@/components/ContactForm'
import Shell from '@/components/Shell'
import UnitBlock from '@/components/UnitBlock'
import ScrollToHash from '@/components/ScrollToHash'
import { unitsOf, bathroomsOf, pricePerSqm, formatPrice, priceNumber } from '@/lib/features'
import { photosOf } from '@/lib/plans'
import { energy, label } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'
import { href, isFallback, num, t, tr, STATUS_KEY } from '@/lib/i18n'

/** Ελληνικό κείμενο που δεν έχει αγγλική εκδοχή — το σημαδεύουμε σωστά για screen readers. */
function Text({ v, lang }: { v: { el: string; en?: string }; lang: Lang }) {
  const s = t(v, lang)
  return isFallback(v, lang) ? <span lang="el">{s}</span> : <>{s}</>
}

export default async function Detail({ slug, lang }: { slug: string; lang: Lang }) {
  const { properties, areas, interiors } = await getContent()
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  /* ── Ακίνητο ─────────────────────────────────────────────────── */
  const p = properties.find((x) => x.slug === slug)
  if (p) {
    const units = unitsOf(p)
    const avail = units.filter((u) => u.status === 'available')
    const nums = avail.map((u) => priceNumber(u.price)).filter(Boolean) as number[]
    const from = nums.length ? `${T('from')} €${num(Math.min(...nums), lang)}` : T('onRequest')
    const area = label(p.area, lang)
    const photos = photosOf(p)
    const address = label(p.address, lang)

    const jsonLd = {
      '@context': 'https://schema.org',
      '@type': 'ApartmentComplex',
      name: `${p.address.el}, ${p.area.el}`,
      address: { '@type': 'PostalAddress', streetAddress: p.address.el, addressLocality: p.area.el, addressCountry: 'GR' },
      numberOfAccommodationUnits: units.length,
      numberOfAvailableAccommodationUnits: avail.length,
      image: photos.slice(0, 5).map((i) => (i.startsWith('http') ? i : `https://www.goodland.gr${i}`)),
      provider: {
        '@type': 'Organization', name: site.name, telephone: `+30${site.phone}`, email: site.email,
        address: { '@type': 'PostalAddress', streetAddress: 'Ύδρας 14', addressLocality: 'Μοσχάτο', addressCountry: 'GR' },
      },
    }

    return (
      <Shell lang={lang}>
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
        <ScrollToHash />

        <div className="container">
          <nav className="crumbs">
            <Link href={L('/')}>{T('home')}</Link><span>/</span>
            <Link href={L('/pros-polisi')}>{T('forSale')}</Link><span>/</span>{address}
          </nav>

          <div className="ph">
            <div>
              <div className="eyebrow">{area}</div>
              <h1 style={{ marginTop: 18 }}>{address}</h1>
            </div>
            <div className="ph__side">
              <div className="label">
                {avail.length} {T('ofWord')} {units.length} {T('availableOf').toLowerCase()}
                {p.energyClass ? ` · ${T('energyClass').toLowerCase()} ${energy(p.energyClass, lang)}` : ''} · {photos.length} {T('photos')}
              </div>
            </div>
          </div>
        </div>

        {photos[0] && (
          <div className="bleed" style={{ aspectRatio: '21 / 9', position: 'relative', background: 'var(--bg-raised)' }}>
            <Image src={photos[0]} alt={`${address}, ${area}`} fill priority sizes="100vw" style={{ objectFit: 'cover' }} />
          </div>
        )}

        <div className="container detail">
          <div>
            <section style={{ paddingTop: 'var(--space-5)' }}>
              <div className="label">{T('theProject')}</div>
              <ul className="lead bullets" style={{ marginTop: 18, maxWidth: '58ch' }}
                  lang={isFallback(p.buildingDescription, lang) ? 'el' : undefined}>
                {bulletsOf(t(p.buildingDescription, lang)).map((b, k) => <li key={k}>{b}</li>)}
              </ul>
            </section>

            <section>
              <div className="label">{T('theProperties')}</div>
              <h2 style={{ marginTop: 14 }}>
                {units.length === 1 ? T('nProperty', { n: 1 }) : T('nProperties', { n: units.length })}
              </h2>

              <details className="overview">
                <summary className="label">{lang === 'en' ? 'All of them at a glance' : 'Όλα με μια ματιά'}</summary>
                <div className="table-wrap">
                <table className="table">
                  <thead>
                    <tr>
                      <th>{T('floor')}</th><th>{T('type')}</th><th className="r">{T('sqmCol')}</th>
                      <th className="r">{T('bdCol')}</th><th className="r">{T('baCol')}</th>
                      <th className="r">{T('price')}</th><th className="r">{T('perSqm')}</th><th className="r">{T('status')}</th>
                    </tr>
                  </thead>
                  <tbody>
                    {units.map((u) => (
                      <tr key={u.id} className={u.status === 'sold' ? 'off' : ''}>
                        <td>{t(u.floor, lang)}</td>
                        <td>{t(u.type, lang)}</td>
                        <td className="r num">{u.sqm ?? '—'}</td>
                        <td className="r num">{u.bedrooms ?? '—'}</td>
                        <td className="r num">{bathroomsOf(u.description.el) ?? '—'}</td>
                        <td className="r num">{formatPrice(u.price, lang) ?? '—'}</td>
                        <td className="r num" style={{ color: 'var(--ink-faint)' }}>{pricePerSqm(u, lang) ?? '—'}</td>
                        <td className="r label" style={{ color: u.status === 'available' ? 'var(--accent)' : undefined }}>
                          {T(STATUS_KEY[u.status])}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
                </div>
              </details>

              <div className="units">
                {units.map((u, i) => (
                  <UnitBlock key={u.id} unit={u} property={p} lang={lang} n={i + 1} />
                ))}
              </div>
            </section>

            {photos.length > 1 && (
              <section>
                <div className="label">{T('photos')}</div>
                <h2 style={{ marginTop: 14, marginBottom: 32 }}>{T('theBuilding')}</h2>
                <Gallery images={photos.slice(1)} alt={`${address}, ${area}`} lang={lang} />
              </section>
            )}

            <section id="form">
              <div className="label">{T('contact')}</div>
              <h2 style={{ marginTop: 14 }}>{T('interested')}</h2>
              <p className="lead">
                {T('callUsOn')}{' '}
                <a href={site.phoneHref} className="num" style={{ borderBottom: '1px solid var(--line)' }}>{site.phone}</a>{' '}
                {T('orSend')}
              </p>
              <div style={{ marginTop: 32 }}>
                <ContactForm about={`${address}, ${area}`} lang={lang} />
              </div>
            </section>
          </div>

          <aside className="rail">
            <div className="eyebrow">{T('price')}</div>
            <div className="rail__price" style={{ marginTop: 8 }}>{from}</div>
            <hr />
            <dl className="specs" style={{ marginTop: 0 }}>
              <><dt>{T('availableOf')}</dt><dd>{avail.length} {T('ofWord')} {units.length}</dd></>
              {p.energyClass && (<><dt>{T('energyClass')}</dt><dd>{energy(p.energyClass, lang)}</dd></>)}
              <><dt>{T('area')}</dt><dd>{area}</dd></>
              <><dt>{T('type')}</dt><dd>{p.kind === 'resale' ? T('resale') : T('newBuild')}</dd></>
            </dl>
            <p className="dim" style={{ fontSize: 'var(--step--1)', marginTop: 18 }}>{T('directPitch')}</p>
            <a className="btn" style={{ width: '100%', justifyContent: 'center' }} href={site.phoneHref}>{site.phone}</a>
            <a className="btn btn--ghost" style={{ width: '100%', justifyContent: 'center', marginTop: 8 }} href="#form">
              {T('sendMessage')}
            </a>
          </aside>
        </div>
      </Shell>
    )
  }

  /* ── Περιοχή ─────────────────────────────────────────────────── */
  const a = areas.find((x) => x.slug === slug)
  if (a) {
    const idx = areas.findIndex((x) => x.slug === slug)
    const next = areas[(idx + 1) % areas.length]
    const areaName = label(a.area, lang)
    return (
      <Shell lang={lang}>
        <div className="container">
          <nav className="crumbs">
            <Link href={L('/')}>{T('home')}</Link><span>/</span>
            <Link href={L('/olokliromena-erga')}>{T('completedFull')}</Link><span>/</span>{areaName}
          </nav>

          <div className="ph">
            <div>
              <div className="label">{T('completedProject')}</div>
              <h1 style={{ marginTop: 12 }}>{areaName}</h1>
            </div>
            <div className="ph__side">
              <div className="label">
                {a.buildings.length === 1 ? T('nBuilding', { n: 1 }) : T('nBuildings', { n: a.buildings.length })}
                {' · '}{a.images.length} {T('photos')}
              </div>
            </div>
          </div>

          <section>
            {a.buildings.map((b) => (
              <div key={b.address.el} style={{ marginBottom: 48, paddingBottom: 48, borderBottom: '1px solid var(--line-soft)' }}>
                <h2>{label(b.address, lang)}</h2>
                <div className="label"><Text v={b.specs} lang={lang} /></div>
                {b.description && (
                  <p className="lead" style={{ marginTop: 20, maxWidth: '58ch' }}>
                    <Text v={b.description} lang={lang} />
                  </p>
                )}
              </div>
            ))}
            <Gallery images={a.images} alt={`${areaName} — ${T('completedProject')}`} lang={lang} />
          </section>

          <section>
            <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap' }}>
              <a className="btn" href={site.phoneHref}>{site.phone}</a>
              <Link className="btn btn--ghost" href={L(`/${next.slug}`)}>
                {T('nextProject')} · {label(next.area, lang)} →
              </Link>
            </div>
          </section>
        </div>
      </Shell>
    )
  }

  /* ── Εσωτερικός χώρος ────────────────────────────────────────── */
  const i = interiors.find((x) => x.slug === slug)
  if (i) {
    const idx = interiors.findIndex((x) => x.slug === slug)
    const next = interiors[(idx + 1) % interiors.length]
    return (
      <Shell lang={lang}>
        <div className="container">
          <nav className="crumbs">
            <Link href={L('/')}>{T('home')}</Link><span>/</span>
            <Link href={L('/projects')}>{T('interiors')}</Link><span>/</span>{t(i.title, lang)}
          </nav>

          <div className="ph">
            <div>
              <div className="label">{T('interiorsLine1')} {T('interiorsLine2')}</div>
              <h1 style={{ marginTop: 12 }}>{t(i.title, lang)}</h1>
            </div>
            <div className="ph__side"><div className="label">{i.images.length} {T('photos')}</div></div>
          </div>

          <section>
            {i.intro && <p className="lead" style={{ marginBottom: 40 }}><Text v={i.intro} lang={lang} /></p>}
            <Gallery images={i.images} alt={t(i.title, lang)} lang={lang} />
          </section>

          <section>
            <div style={{ display: 'flex', gap: 14, flexWrap: 'wrap' }}>
              <a className="btn" href={site.phoneHref}>{site.phone}</a>
              <Link className="btn btn--ghost" href={L(`/${next.slug}`)}>{t(next.title, lang)} →</Link>
            </div>
          </section>
        </div>
      </Shell>
    )
  }

  notFound()
}
