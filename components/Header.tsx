import Link from 'next/link'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, tr } from '@/lib/i18n'
import Controls from './Controls'
import Logo from './Logo'
import MobileNav from './MobileNav'

export default function Header({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)

  return (
    <header className="header">
      <div className="container header__inner">
        <nav className="header__nav label">
          <Link href={L('/pros-polisi')}>{T('forSale')}</Link>
          <Link href={L('/olokliromena-erga')}>{T('completed')}</Link>
          <Link href={L('/projects')}>{T('interiors')}</Link>
        </nav>

        <Link href={L('/')} className="header__brand" aria-label={T('home')}>
          <Logo className="logo" layout="row" />
        </Link>

        <div className="header__actions label">
          <Link href={L('/katalogos')} className="header__hide-sm">{T('services')}</Link>
          <Link href={L('/contact')} className="header__hide-sm">{T('contact')}</Link>
          <a className="header__tel num" href={site.phoneHref}>{site.phone}</a>
          <Controls lang={lang} />
          <MobileNav lang={lang} />
        </div>
      </div>

    </header>
  )
}
