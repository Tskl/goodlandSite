import type { Unit, Property, L } from '@/content/types'
import type { Lang } from './i18n'
import { locale } from './i18n'

export type Feature = { label: L; icon: string }

/** Βγάζει χαρακτηριστικά από την ελληνική περιγραφή — δεν εφευρίσκει τίποτα. */
export function featuresOf(desc: string): Feature[] {
  const d = (desc ?? '').toLowerCase()
  const f: Feature[] = []
  const has = (...xs: string[]) => xs.some((x) => d.includes(x))

  if (has('δύο θέσεις πάρκινγκ', '2 θέσεις πάρκινγκ')) f.push({ label: { el: 'Δύο θέσεις πάρκινγκ', en: 'Two parking spaces' }, icon: '⬛' })
  else if (has('πάρκινγκ στο υπόγειο')) f.push({ label: { el: 'Πάρκινγκ στο υπόγειο', en: 'Basement parking' }, icon: '⬛' })
  else if (has('πάρκινγκ στο ισόγειο')) f.push({ label: { el: 'Πάρκινγκ στο ισόγειο', en: 'Ground-floor parking' }, icon: '⬛' })
  else if (has('πάρκινγκ')) f.push({ label: { el: 'Θέση πάρκινγκ', en: 'Parking space' }, icon: '⬛' })

  if (has('αποθήκη')) f.push({ label: { el: 'Αποθήκη', en: 'Storage room' }, icon: '▣' })
  if (has('ξύλινα πατώματα', 'ξυλινα πατώματα')) f.push({ label: { el: 'Ξύλινα πατώματα', en: 'Wooden floors' }, icon: '▤' })
  if (has('laminate')) f.push({ label: { el: 'Πατώματα laminate', en: 'Laminate floors' }, icon: '▤' })
  if (has('θερμομονωτικά κουφώματα')) f.push({ label: { el: 'Θερμομονωτικά κουφώματα', en: 'Thermally broken frames' }, icon: '▢' })
  if (has('σίτες')) f.push({ label: { el: 'Σίτες', en: 'Insect screens' }, icon: '▦' })
  if (has('ενεργειακούς υαλοπίνακες')) f.push({ label: { el: 'Ενεργειακοί υαλοπίνακες', en: 'Energy-efficient glazing' }, icon: '▢' })
  if (has('εξωτερικής θερμομόνωσης')) f.push({ label: { el: 'Εξωτερική θερμομόνωση', en: 'External wall insulation' }, icon: '▩' })
  if (has('φορτιστή ηλεκτρικού')) f.push({ label: { el: 'Παροχή για φορτιστή EV', en: 'EV charger provision' }, icon: '⚡' })
  if (has('ηλιακό θερμοσίφωνα', 'ηλιακού θερμοσίφωνα')) f.push({ label: { el: 'Ηλιακός θερμοσίφωνας', en: 'Solar water heater' }, icon: '☀' })
  if (has('ενδοδαπέδι')) f.push({ label: { el: 'Ενδοδαπέδια θέρμανση', en: 'Underfloor heating' }, icon: '≋' })
  if (has('fan coil')) f.push({ label: { el: 'Ψύξη με fan coil', en: 'Fan-coil cooling' }, icon: '❄' })
  if (has('play room')) f.push({ label: { el: 'Play room στο υπόγειο', en: 'Basement play room' }, icon: '◫' })
  if (has('γραφείο')) f.push({ label: { el: 'Χώρος για γραφείο', en: 'Space for a study' }, icon: '▭' })

  return f
}

/** Σύστημα θέρμανσης, όπως το λέει η ίδια η περιγραφή. */
export function heatingOf(desc: string): L | null {
  const d = (desc ?? '').toLowerCase()
  if (d.includes('ενδοδαπέδι') && d.includes('αντλία θερμότητας'))
    return { el: 'Ενδοδαπέδια με αντλία θερμότητας', en: 'Underfloor, heat pump' }
  if (d.includes('αντλίας θερμότητας') || d.includes('αντλία θερμότητας'))
    return { el: 'Αντλία θερμότητας', en: 'Heat pump' }
  if (d.includes('λέβητα φυσικού αερίου')) return { el: 'Λέβητας φυσικού αερίου', en: 'Gas boiler' }
  if (d.includes('λέβητα')) return { el: 'Λέβητας και σώματα', en: 'Boiler and radiators' }
  return null
}

export function bathroomsOf(desc: string): number | null {
  const d = (desc ?? '').toLowerCase()
  if (/\b3 μπάνια|τρία μπάνια|3 μπανια/.test(d)) return 3
  if (/\b2 μπάνια|δύο μπάνια|δυο μπάνια/.test(d)) return 2
  if (/μπάνι[οo]|μπανι[οo]/.test(d)) return 1
  return null
}

export function hasWc(desc: string): boolean {
  return /\bwc\b|w\.c\./i.test(desc ?? '')
}

export function priceNumber(price?: string): number | null {
  if (!price) return null
  const n = Number(String(price).replace(/[^\d]/g, ''))
  return n > 0 ? n : null
}

export function pricePerSqm(u: Unit, lang: Lang = 'el'): string | null {
  const p = priceNumber(u?.price)
  if (!p || !u?.sqm) return null
  const n = Math.round(p / u.sqm).toLocaleString(locale(lang))
  return lang === 'en' ? `€${n}/sqm` : `${n}€/τ.μ.`
}

export function formatPrice(price?: string, lang: Lang = 'el'): string | null {
  const n = priceNumber(price)
  return n ? '€' + n.toLocaleString(locale(lang)) : null
}

/** Επίπεδη λίστα όλων των μονάδων όλων των έργων, για προβολή «ανά διαμέρισμα». */
export type FlatUnit = { unit: Unit; property: Property }

export function flatUnits(properties: Property[]): FlatUnit[] {
  return properties.flatMap((property) =>
    (property?.units ?? []).filter(Boolean).map((unit) => ({ unit, property })),
  )
}

/** Οι μονάδες ενός έργου, χωρίς κενά — να μη σκάει ποτέ σε ελλιπή δεδομένα. */
export function unitsOf(property: Property) {
  return (property?.units ?? []).filter(Boolean)
}
