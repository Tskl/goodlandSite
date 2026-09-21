import type { Property, Unit, Plan } from '@/content/types'
import type { Lang } from './i18n'

/** Οι κατόψεις που ανήκουν σε ένα διαμέρισμα. */
export function plansOf(p: Property, u: Unit): Plan[] {
  const all = p?.plans ?? []
  if (u?.plan?.length) {
    const want = u.plan
    return all.filter((x) => want.includes(x.code))
  }
  const fls = u?.floors ?? []
  if (!fls.length) return []
  return all.filter((x) => fls.includes(x.floor))
}

/** Οι φωτογραφίες ενός έργου — χωρίς τις κατόψεις.
    Μια κάτοψη είναι σχέδιο, δεν έχει θέση στο άλμπουμ του κτηρίου
    ούτε στο καρουζέλ της κάρτας. */
export function photosOf(p: Property): string[] {
  const plans = new Set((p?.plans ?? []).map((x) => x.src))
  return (p?.images ?? []).filter((src) => !plans.has(src))
}

/** True όταν η κάτοψη είναι καρφωμένη στο συγκεκριμένο διαμέρισμα. */
export function isPinned(u: Unit): boolean {
  return !!u?.plan?.length
}

/** «Κάτοψη Α1» ή «Κατόψεις ορόφου» — λέμε ακριβώς τι βλέπει ο επισκέπτης. */
export function planLabel(u: Unit, n: number, lang: Lang): string {
  if (isPinned(u)) return lang === 'en' ? (n > 1 ? 'Floor plans' : 'Floor plan') : n > 1 ? 'Κατόψεις' : 'Κάτοψη'
  return lang === 'en' ? 'Plans for this floor' : 'Κατόψεις του ορόφου'
}
