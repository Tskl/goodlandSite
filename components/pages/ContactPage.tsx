import Link from 'next/link'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import ContactForm from '@/components/ContactForm'
import Shell from '@/components/Shell'
import MapEmbed from '@/components/MapEmbed'

const jsonLd = {
  '@context': 'https://schema.org',
  '@type': 'Organization',
  name: site.name,
  url: 'https://www.goodland.gr',
  telephone: `+30${site.phone}`,
  email: site.email,
  address: { '@type': 'PostalAddress', streetAddress: 'Ύδρας 14', addressLocality: 'Μοσχάτο', addressCountry: 'GR' },
  sameAs: [site.social.facebook, site.social.instagram],
}

export default function ContactPage({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  return (
    <Shell lang={lang}>
      <div className="container">
        <script type="application/ld+json" dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }} />
        <nav className="crumbs"><Link href={L('/')}>{T('home')}</Link><span>/</span>{T('contact')}</nav>

        <section>
          <h1>{T('letsTalk')}</h1>
          <div className="contact-grid" style={{ marginTop: 56 }}>
            <div>
              <div className="label">{T('phone')}</div>
              <p style={{ marginTop: 8 }}>
                <a className="num serif" style={{ fontSize: 'var(--step-1)' }} href={site.phoneHref}>{site.phone}</a>
              </p>
              <div className="label" style={{ marginTop: 32 }}>{T('email')}</div>
              <p style={{ marginTop: 8 }}><a href={`mailto:${site.email}`}>{site.email}</a></p>
              <div className="label" style={{ marginTop: 32 }}>{T('office')}</div>
              <p style={{ marginTop: 8 }} className="dim">{t(site.address, lang)}</p>
              <div className="label" style={{ marginTop: 32 }}>{T('social')}</div>
              <p style={{ marginTop: 8 }}>
                <a href={site.social.instagram} rel="noopener">Instagram</a>
                <span className="dim"> · </span>
                <a href={site.social.facebook} rel="noopener">Facebook</a>
              </p>
            </div>
            <div>
              <ContactForm lang={lang} />
            </div>
          </div>
          <div style={{ marginTop: 'var(--space-5)' }}>
            <MapEmbed lang={lang} query="Ύδρας 14, Μοσχάτο" />
          </div>
        </section>
      </div>
    </Shell>
  )
}
