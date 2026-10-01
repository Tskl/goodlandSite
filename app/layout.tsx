import type { Metadata, Viewport } from 'next'
import { Manrope } from 'next/font/google'
import './globals.css'

/* Μία οικογένεια, γεωμετρική και λιτή — όπως η Outfit, αλλά με
   πλήρη ελληνικά (η Outfit δεν έχει ελληνικό subset).
   Η αντίθεση βγαίνει από το βάρος, όχι από δεύτερη γραμματοσειρά. */
const sans = Manrope({
  subsets: ['greek', 'latin'],
  weight: ['400', '500', '600', '700', '800'],
  variable: '--font-sans',
  display: 'swap',
})

export const metadata: Metadata = {
  metadataBase: new URL('https://www.goodland.gr'),
  title: { default: 'Εύγειος Goodland — Κατασκευαστική εταιρεία, Αθήνα', template: '%s — Εύγειος Goodland' },
  description:
    'Νεόδμητα διαμερίσματα ενεργειακής κλάσης Α σε Αθήνα και προάστια, απευθείας από τον κατασκευαστή. Μελέτη, κατασκευή, ανακαινίσεις, διαμόρφωση εσωτερικών χώρων.',
  openGraph: { type: 'website', locale: 'el_GR', siteName: 'Εύγειος Goodland Μ. ΕΠΕ' },
}

export const viewport: Viewport = { colorScheme: 'dark light' }

/* Τρέχει πριν το πρώτο pixel: θέμα και γλώσσα χωρίς αναλαμπή. */
const BOOT = `(function(){try{
var d=document.documentElement;
var t=localStorage.getItem('gl-theme');
if(t!=='light'&&t!=='dark'){t=window.matchMedia&&window.matchMedia('(prefers-color-scheme: light)').matches?'light':'dark';}
d.setAttribute('data-theme',t);
d.style.colorScheme=t;
var en=/^\\/en(\\/|$)/.test(location.pathname);
d.setAttribute('data-lang',en?'en':'el');
d.lang=en?'en':'el';
}catch(e){}})();`

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="el" data-theme="dark" className={sans.variable} suppressHydrationWarning>
      <body>
        <script dangerouslySetInnerHTML={{ __html: BOOT }} />
        {children}
        {/* Vercel Web Analytics: ενεργοποιείται από το dashboard του Vercel (Analytics → Enable). Χωρίς cookies. */}
        <script defer src="/_vercel/insights/script.js" />
      </body>
    </html>
  )
}
