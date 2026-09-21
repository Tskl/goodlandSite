import Link from 'next/link'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, t, tr } from '@/lib/i18n'
import Shell from '@/components/Shell'

const EL = {
  who: 'Ποιοι είμαστε', whoP: (n: string, a: string) => `Υπεύθυνος επεξεργασίας είναι η ${n}, ${a}.`,
  what: 'Τι στοιχεία συλλέγουμε',
  whatP: 'Μόνο όσα συμπληρώνετε μόνοι σας στη φόρμα επικοινωνίας: όνομα, επώνυμο, τηλέφωνο, προαιρετικά email, και το μήνυμά σας. Αν γράφετε για συγκεκριμένο ακίνητο, καταγράφεται και ποιο είναι.',
  why: 'Γιατί τα χρειαζόμαστε',
  whyP: 'Αποκλειστικά για να απαντήσουμε στο αίτημά σας. Νομική βάση είναι η συγκατάθεσή σας, την οποία δίνετε τσεκάροντας το σχετικό πεδίο πριν στείλετε τη φόρμα.',
  where: 'Πού πηγαίνουν',
  whereP: (e: string) => `Το μήνυμα φτάνει ως email στο ${e}. Δεν το μοιραζόμαστε με τρίτους, δεν το πουλάμε, και δεν το χρησιμοποιούμε για διαφημιστικά μηνύματα.`,
  keep: 'Πόσο καιρό τα κρατάμε',
  keepP: 'Έως δύο χρόνια από την τελευταία επικοινωνία μαζί σας, εκτός αν ζητήσετε νωρίτερα τη διαγραφή τους.',
  rights: 'Τα δικαιώματά σας',
  rightsP: 'Έχετε δικαίωμα πρόσβασης, διόρθωσης, διαγραφής, περιορισμού και φορητότητας των δεδομένων σας, καθώς και ανάκλησης της συγκατάθεσής σας ανά πάσα στιγμή. Στείλτε μας email στο',
  rightsP2: 'και απαντάμε εντός ενός μήνα. Μπορείτε επίσης να υποβάλετε καταγγελία στην Αρχή Προστασίας Δεδομένων Προσωπικού Χαρακτήρα',
  cookies: 'Cookies',
  cookiesP: 'Ο ιστότοπος δεν χρησιμοποιεί cookies παρακολούθησης ούτε εργαλεία αναλυτικών στοιχείων τρίτων. Δεν εμφανίζεται μπάνερ συγκατάθεσης γιατί δεν υπάρχει τίποτα να συγκατατεθείτε.',
  updated: 'Τελευταία ενημέρωση: Σεπτέμβριος 2026.',
  contactLine: 'Επικοινωνία:',
}

const EN = {
  who: 'Who we are', whoP: (n: string, a: string) => `The data controller is ${n}, ${a}.`,
  what: 'What we collect',
  whatP: 'Only what you type into the contact form yourself: first name, last name, phone, optionally an email address, and your message. If you write about a specific property, which one is recorded too.',
  why: 'Why we need it',
  whyP: 'Solely to answer your enquiry. The legal basis is your consent, which you give by ticking the box before you send the form.',
  where: 'Where it goes',
  whereP: (e: string) => `The message arrives as an email at ${e}. We do not share it with third parties, do not sell it, and do not use it for marketing.`,
  keep: 'How long we keep it',
  keepP: 'Up to two years from our last contact with you, unless you ask us to delete it sooner.',
  rights: 'Your rights',
  rightsP: 'You have the right of access, rectification, erasure, restriction and portability, and you may withdraw your consent at any time. Email us at',
  rightsP2: 'and we answer within one month. You may also lodge a complaint with the Hellenic Data Protection Authority',
  cookies: 'Cookies',
  cookiesP: 'This site uses no tracking cookies and no third-party analytics. There is no consent banner because there is nothing to consent to.',
  updated: 'Last updated: September 2026.',
  contactLine: 'Contact:',
}

export default function Privacy({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)
  const C = lang === 'en' ? EN : EL

  return (
    <Shell lang={lang}>
      <div className="container">
        <nav className="crumbs"><Link href={L('/')}>{T('home')}</Link><span>/</span>{T('privacy')}</nav>
        <section className="prose">
          <h1>{T('privacy')}</h1>

          <h2>{C.who}</h2>
          <p>
            {C.whoP(site.name, t(site.address, lang))} {C.contactLine}{' '}
            <a href={site.phoneHref}>{site.phone}</a> · <a href={`mailto:${site.email}`}>{site.email}</a>.
          </p>

          <h2>{C.what}</h2>
          <p>{C.whatP}</p>

          <h2>{C.why}</h2>
          <p>{C.whyP}</p>

          <h2>{C.where}</h2>
          <p>{C.whereP(site.email)}</p>

          <h2>{C.keep}</h2>
          <p>{C.keepP}</p>

          <h2>{C.rights}</h2>
          <p>
            {C.rightsP} <a href={`mailto:${site.email}`}>{site.email}</a> {C.rightsP2}{' '}
            (<a href="https://www.dpa.gr" rel="noopener">dpa.gr</a>).
          </p>

          <h2>{C.cookies}</h2>
          <p>{C.cookiesP}</p>

          <p className="dim">{C.updated}</p>
        </section>
      </div>
    </Shell>
  )
}
