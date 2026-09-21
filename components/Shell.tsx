import type { Lang } from '@/lib/i18n'
import { site } from '@/content/site'
import Header from './Header'
import Footer from './Footer'

/** Το κέλυφος κάθε σελίδας — κεφαλίδα, περιεχόμενο, υποσέλιδο, μπάρα κλήσης. */
export default function Shell({ lang, children }: { lang: Lang; children: React.ReactNode }) {
  return (
    <>
      <Header lang={lang} />
      <main>{children}</main>
      <Footer lang={lang} />
      <a className="callbar" href={site.phoneHref}>
        {lang === 'en' ? 'Call us' : 'Καλέστε μας'} · {site.phone}
      </a>
    </>
  )
}
