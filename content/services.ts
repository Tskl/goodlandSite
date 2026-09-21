import type { Service } from './types'

/**
 * ΠΡΟΣΟΧΗ: το παλιό site είχε ΔΥΟ διαφορετικές λίστες υπηρεσιών —
 * μία στην αρχική και μία στο /katalogos, με μόνο μία κοινή («Ανακαινίσεις»).
 * Εδώ κρατήθηκε η λίστα της αρχικής. Χρειάζεται απόφαση.
 */
export const services: Service[] = [
  {
    title: { el: 'Μελέτη & κατασκευή κτηρίων', en: 'Analysis, design & construction' },
    description: { el: 'Νέες πολυκατοικίες ενεργειακής κλάσης Α, από το οικόπεδο ως την παράδοση.', en: 'New energy-class A apartment buildings, from the plot to the handover.' },
    href: '/pros-polisi',
  },
  {
    title: { el: 'Διαμόρφωση εσωτερικών χώρων', en: 'Interior design' },
    description: { el: 'Λύσεις εσωτερικών διαρρυθμίσεων προσαρμοσμένες στις ανάγκες σας.', en: 'Interior layouts shaped around the way you actually live.' },
    href: '/projects',
  },
  {
    title: { el: 'Ανακαινίσεις', en: 'Renovations' },
    description: { el: 'Ριζικές ανακαινίσεις κατοικιών και ενεργειακή αναβάθμιση.', en: 'Full home renovations and energy upgrades.' },
    href: '/katalogos',
  },
  {
    title: { el: 'Ξυλουργικές κατασκευές', en: 'Wooden constructions' },
    description: { el: 'Κουζίνες, ντουλάπες και κατασκευές κατά παραγγελία.', en: 'Kitchens, wardrobes and bespoke joinery.' },
    href: '/kouzines',
  },
]
