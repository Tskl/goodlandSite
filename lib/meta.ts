import type { Metadata } from 'next'
import { getContent } from './content'
import { unitsOf } from '@/lib/features'
import { photosOf } from '@/lib/plans'
import { energy, inArea, label } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'

/** canonical + hreflang για κάθε σελίδα. Τα ελληνικά URL μένουν όπως ήταν. */
export function alternates(path: string, lang: Lang) {
  const el = path === '/' ? '/' : encodeURI(path)
  const en = path === '/' ? '/en' : `/en${encodeURI(path)}`
  return {
    canonical: lang === 'en' ? en : el,
    languages: { el, en, 'x-default': el },
  }
}

const PAGES = {
  home: {
    el: { title: 'Εύγειος Goodland — Κατασκευαστική εταιρεία, Αθήνα', description: 'Νεόδμητα διαμερίσματα ενεργειακής κλάσης Α σε Αθήνα και προάστια, απευθείας από τον κατασκευαστή. Μελέτη, κατασκευή, ανακαινίσεις, διαμόρφωση εσωτερικών χώρων.' },
    en: { title: 'Goodland — Construction company in Athens', description: 'Newly built, energy-class A apartments in Athens and its suburbs, straight from the developer. Design, construction, renovation and interiors.' },
  },
  forSale: {
    el: { title: 'Διαμερίσματα προς πώληση', description: 'Νεόδμητα διαμερίσματα και μεζονέτες απευθείας από τον κατασκευαστή, σε Αθήνα και προάστια. Ενεργειακή κλάση Α, πάρκινγκ και αποθήκη, χωρίς μεσιτική αμοιβή.' },
    en: { title: 'Apartments for sale', description: 'New-build apartments and maisonettes straight from the developer, in Athens and its suburbs. Energy class A, parking and storage, no agency fee.' },
  },
  completed: {
    el: { title: 'Ολοκληρωμένα έργα', description: 'Πολυκατοικίες που έχει παραδώσει η Εύγειος Goodland σε οκτώ περιοχές της Αθήνας και του Πειραιά.' },
    en: { title: 'Completed projects', description: 'Apartment buildings delivered by Goodland across eight areas of Athens and Piraeus.' },
  },
  interiors: {
    el: { title: 'Διαμόρφωση εσωτερικών χώρων', description: 'Σαλόνια, κουζίνες, μπάνια και υπνοδωμάτια από έργα της Εύγειος Goodland.' },
    en: { title: 'Interior design', description: 'Living rooms, kitchens, bathrooms and bedrooms from Goodland projects.' },
  },
  services: {
    el: { title: 'Υπηρεσίες', description: 'Μελέτη και κατασκευή κτηρίων, ανακαινίσεις, ενεργειακή αναβάθμιση και διαμόρφωση εσωτερικών χώρων.' },
    en: { title: 'Services', description: 'Building design and construction, renovation, energy upgrades and interior design.' },
  },
  contact: {
    el: { title: 'Επικοινωνία', description: 'Τηλέφωνο, email και διεύθυνση γραφείου της Εύγειος Goodland Μ. ΕΠΕ στο Μοσχάτο.' },
    en: { title: 'Contact', description: 'Phone, email and office address of Goodland in Moschato, Athens.' },
  },
  privacy: {
    el: { title: 'Πολιτική απορρήτου', description: 'Πώς συλλέγει, χρησιμοποιεί και διατηρεί τα προσωπικά σας δεδομένα η Εύγειος Goodland Μ. ΕΠΕ.' },
    en: { title: 'Privacy policy', description: 'How Goodland collects, uses and keeps your personal data.' },
  },
} as const

export type PageKey = keyof typeof PAGES

/** Στα αγγλικά το suffix του template είναι ελληνικό — το παρακάμπτουμε. */
const title2 = (s: string, lang: Lang) => (lang === 'en' ? { absolute: `${s} — Goodland` } : s)

export function pageMeta(key: PageKey, path: string, lang: Lang): Metadata {
  const m = PAGES[key][lang]
  return {
    title: key === 'home' ? { absolute: m.title } : title2(m.title, lang),
    description: m.description,
    alternates: alternates(path, lang),
    openGraph: { locale: lang === 'en' ? 'en_GB' : 'el_GR', title: m.title, description: m.description },
  }
}


/** Metadata για τη δυναμική σελίδα /[slug]. */
export async function slugMeta(slugRaw: string, lang: Lang): Promise<Metadata> {
  const { properties, areas, interiors } = await getContent()
  const s = decodeURIComponent(slugRaw)
  const en = lang === 'en'

  const p = properties.find((x) => x.slug === s)
  if (p) {
    const avail = unitsOf(p).filter((u) => u.status === 'available')
    const address = label(p.address, lang)
    const area = label(p.area, lang)
    const t0 = `${address}, ${area}`
    const description = avail.length
      ? en
        ? `${avail.length} apartments available — ${address}, ${area}. Energy class ${energy(p.energyClass, 'en')}, parking and storage, straight from the developer.`
        : `${avail.length} διαθέσιμα διαμερίσματα — ${address}, ${area}. Ενεργειακή κλάση ${p.energyClass}, πάρκινγκ και αποθήκη, απευθείας από τον κατασκευαστή.`
      : en
        ? `Our project ${inArea(p.area, 'en')} — ${address}. Energy class ${energy(p.energyClass, 'en')}.`
        : `Το έργο μας ${inArea(p.area, 'el')} — ${address}. Ενεργειακή κλάση ${p.energyClass}.`
    return { title: title2(t0, lang), description, alternates: alternates(`/${p.slug}`, lang),
             openGraph: { locale: en ? 'en_GB' : 'el_GR', title: t0, description, images: photosOf(p)[0] ? [photosOf(p)[0]] : undefined } }
  }

  const a = areas.find((x) => x.slug === s)
  if (a) {
    const areaName = label(a.area, lang)
    const t0 = en ? `${areaName} — completed projects` : `${areaName} — ολοκληρωμένα έργα`
    const description = en
      ? `Apartment buildings we have delivered in ${areaName}.`
      : `Πολυκατοικίες που έχουμε παραδώσει ${inArea(a.area, 'el')}.`
    return { title: title2(t0, lang), description, alternates: alternates(`/${a.slug}`, lang),
             openGraph: { locale: en ? 'en_GB' : 'el_GR', title: t0, description } }
  }

  const i = interiors.find((x) => x.slug === s)
  if (i) {
    const t0 = lang === 'en' ? (i.title.en || i.title.el) : i.title.el
    const description = en
      ? `${t0} from Goodland projects — ${i.images.length} photos.`
      : `${t0} από έργα της Εύγειος Goodland — ${i.images.length} φωτογραφίες.`
    return { title: title2(t0, lang), description, alternates: alternates(`/${i.slug}`, lang),
             openGraph: { locale: en ? 'en_GB' : 'el_GR', title: t0, description } }
  }

  return {}
}
