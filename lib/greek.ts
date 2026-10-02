/* ═══════════════════════════════════════════════════════════════════
   Ελληνικά ονόματα: σωστά άρθρα και λατινική μεταγραφή.
   «στην Περιστέρι» είναι λάθος που το βλέπει αμέσως κάθε Έλληνας.
   Κανόνας που να το βγάζει μόνος του δεν υπάρχει (Παπάγου → στου,
   Βριλήσσια → στα, Μαρούσι → στο), οπότε κρατάμε πίνακα.
   ═══════════════════════════════════════════════════════════════════ */

import type { Lang } from './i18n'
import type { Area, L } from '@/content/types'

const IN_AREA: Record<string, string> = {
  'Περιστέρι': 'στο Περιστέρι',
  'Νέα Ιωνία': 'στη Νέα Ιωνία',
  'Μαρούσι': 'στο Μαρούσι',
  'Παπάγου': 'στου Παπάγου',
  'Μοσχάτο': 'στο Μοσχάτο',
  'Παγκράτι': 'στο Παγκράτι',
  'Βριλήσσια': 'στα Βριλήσσια',
  'Κουκάκι': 'στο Κουκάκι',
  'Άγιος Δημήτριος': 'στον Άγιο Δημήτριο',
  'Καλλιθέα': 'στην Καλλιθέα',
  'Νέος Κόσμος': 'στον Νέο Κόσμο',
  'Χολαργός': 'στον Χολαργό',
  'Ζωγράφου': 'στου Ζωγράφου',
  'Νίκαια': 'στη Νίκαια',
  'Κερατσίνι': 'στο Κερατσίνι',
  'Αγία Παρασκευή': 'στην Αγία Παρασκευή',
  'Πεύκη': 'στην Πεύκη',
  'Παλαιό Φάληρο': 'στο Παλαιό Φάληρο',
}

/** Καθιερωμένες αγγλικές γραφές — υπερισχύουν της αυτόματης μεταγραφής. */
const LATIN: Record<string, string> = {
  'Περιστέρι': 'Peristeri',
  'Νέα Ιωνία': 'Nea Ionia',
  'Μαρούσι': 'Maroussi',
  'Παπάγου': 'Papagou',
  'Μοσχάτο': 'Moschato',
  'Παγκράτι': 'Pangrati',
  'Βριλήσσια': 'Vrilissia',
  'Κουκάκι': 'Koukaki',
  'Άγιος Δημήτριος': 'Agios Dimitrios',
  'Καλλιθέα': 'Kallithea',
  'Νέος Κόσμος': 'Neos Kosmos',
  'Χολαργός': 'Cholargos',
  'Ζωγράφου': 'Zografou',
  'Νίκαια': 'Nikaia',
  'Κερατσίνι': 'Keratsini',
  'Αγία Παρασκευή': 'Agia Paraskevi',
  'Πεύκη': 'Pefki',
  'Παλαιό Φάληρο': 'Palaio Faliro',
  'Αθήνα': 'Athens',
  'Πειραιάς': 'Piraeus',
  /* διευθύνσεις έργων */
  'Αλκαμένους': 'Alkamenous',
  'Ανδρέα Δημητρίου': 'Andrea Dimitriou',
  'Ολύμπου': 'Olympou',
  'Βυζαντίου': 'Vyzantiou',
  'Κατσώνη': 'Katsoni',
  'Αχιλλέως': 'Achilleos',
  'Δικαιάρχου': 'Dikaiarchou',
  'Καλλιρρόης': 'Kallirrois',
  'Βεργίνας': 'Verginas',
  'Κέκροπος': 'Kekropos',
  'Ευκαλύπτων': 'Efkalypton',
  'Μαρκοπουλιώτη': 'Markopoulioti',
  'Ύδρας': 'Ydras',
}

const DIGRAPH: Array<[RegExp, string]> = [
  [/ΟΥ/g, 'OU'], [/Ου/g, 'Ou'], [/ου/g, 'ou'],
  [/ΑΥ/g, 'AV'], [/Αυ/g, 'Av'], [/αυ/g, 'av'],
  [/ΕΥ/g, 'EF'], [/Ευ/g, 'Ef'], [/ευ/g, 'ef'],
  [/ΜΠ/g, 'B'],  [/Μπ/g, 'B'],  [/μπ/g, 'b'],
  [/ΝΤ/g, 'NT'], [/Ντ/g, 'Nt'], [/ντ/g, 'nt'],
  [/ΓΓ/g, 'NG'], [/γγ/g, 'ng'],
  [/ΤΣ/g, 'TS'], [/Τσ/g, 'Ts'], [/τσ/g, 'ts'],
  [/ΧΡ/g, 'CHR'], [/Χρ/g, 'Chr'], [/χρ/g, 'chr'],
]

const CHAR: Record<string, string> = {
  Α: 'A', Β: 'V', Γ: 'G', Δ: 'D', Ε: 'E', Ζ: 'Z', Η: 'I', Θ: 'TH', Ι: 'I', Κ: 'K',
  Λ: 'L', Μ: 'M', Ν: 'N', Ξ: 'X', Ο: 'O', Π: 'P', Ρ: 'R', Σ: 'S', Τ: 'T', Υ: 'Y',
  Φ: 'F', Χ: 'CH', Ψ: 'PS', Ω: 'O',
  α: 'a', β: 'v', γ: 'g', δ: 'd', ε: 'e', ζ: 'z', η: 'i', θ: 'th', ι: 'i', κ: 'k',
  λ: 'l', μ: 'm', ν: 'n', ξ: 'x', ο: 'o', π: 'p', ρ: 'r', σ: 's', ς: 's', τ: 't',
  υ: 'y', φ: 'f', χ: 'ch', ψ: 'ps', ω: 'o',
}

/** Λατινική μεταγραφή κατά ΕΛΟΤ 743, χοντρικά — μόνο για την αγγλική έκδοση. */
export function translit(s: string): string {
  if (!s) return ''
  let x = s.normalize('NFD').replace(/[̀-ͅ]/g, '').normalize('NFC')
  for (const [re, to] of DIGRAPH) x = x.replace(re, to)
  return x.split('').map((c) => CHAR[c] ?? c).join('')
}

/** Όνομα περιοχής ή διεύθυνσης στη γλώσσα που ζητήθηκε. */
export function name(greek: string, lang: Lang): string {
  if (lang !== 'en' || !greek) return greek
  if (LATIN[greek]) return LATIN[greek]
  // διευθύνσεις: «Αλκαμένους 4», «Κατσώνη 5 & Αχιλλέως 19»
  return greek.replace(/[Ά-ώΑ-ωίϊΐόάέύϋΰήώ]+/g, (w) => LATIN[w] ?? translit(w))
}

/** Όνομα από δίγλωσσο πεδίο: αγγλικό κείμενο αν υπάρχει, αλλιώς μεταγραφή. */
export function label(v: L | undefined, lang: Lang): string {
  if (!v) return ''
  if (lang !== 'en') return v.el
  return (v.en ?? '').trim() || name(v.el, 'en')
}

/** «στο Περιστέρι» / «in Peristeri». Άγνωστη περιοχή → «στην περιοχή Χ». */
export function inArea(area: string | Area | undefined, lang: Lang = 'el'): string {
  if (!area) return ''
  const a: Area = typeof area === 'string' ? { el: area } : area
  if (lang === 'en') return `in ${a.en || name(a.el, 'en')}`
  return a.in || IN_AREA[a.el.trim()] || `στην περιοχή ${a.el}`
}

/** Ενεργειακή κλάση: Α→A, Β→B, Γ→C … για την αγγλική έκδοση. */
const ENERGY: Record<string, string> = { 'Α': 'A', 'Β': 'B', 'Γ': 'C', 'Δ': 'D', 'Ε': 'E', 'Ζ': 'F', 'Η': 'G' }

export function energy(c: string | undefined, lang: Lang): string {
  if (!c) return ''
  if (lang !== 'en') return c
  return c.split('').map((ch) => ENERGY[ch] ?? ch).join('')
}
