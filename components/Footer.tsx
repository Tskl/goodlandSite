import Link from 'next/link'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import Logo from './Logo'

export default function Footer({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  return (
    <footer className="footer">
      <div className="container">
        <div className="footer__grid">
          <div>
            <Logo className="logo logo--stack" layout="stack" />
            <p className="dim" style={{ marginTop: 14, maxWidth: '30ch' }}>
              {T('footerAbout', { y: site.foundedYearsExperience })}
            </p>
          </div>

          <div>
            <div className="label" style={{ marginBottom: 14 }}>{T('pages')}</div>
            <p style={{ display: 'grid', gap: 7, margin: 0 }}>
              <Link href={L('/pros-polisi')}>{T('forSale')}</Link>
              <Link href={L('/olokliromena-erga')}>{T('completedFull')}</Link>
              <Link href={L('/projects')}>{T('interiors')}</Link>
              <Link href={L('/katalogos')}>{T('services')}</Link>
              <Link href={L('/contact')}>{T('contact')}</Link>
            </p>
          </div>

          <div>
            <div className="label" style={{ marginBottom: 14 }}>{T('contact')}</div>
            <p style={{ display: 'grid', gap: 7, margin: 0 }}>
              <a href={site.phoneHref} className="num">{site.phone}</a>
              <a href={`mailto:${site.email}`}>{site.email}</a>
              <span className="dim">{t(site.address, lang)}</span>
              <span style={{ marginTop: 8 }}>
                <a href={site.social.instagram} rel="noopener">Instagram</a>
                <span className="dim"> · </span>
                <a href={site.social.facebook} rel="noopener">Facebook</a>
              </span>
            </p>
          </div>
        </div>

        <div className="footer__bottom">
          © {new Date().getFullYear()} {site.name} ·{' '}
          <Link href={L('/politiki-aporritou')}>{T('privacy')}</Link>
        </div>
      </div>
    </footer>
  )
}
