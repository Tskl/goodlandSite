/* ═══════════════════════════════════════════════════════════════════
   Δίγλωσσο σύστημα — ελληνικά (κανονική έκδοση) και αγγλικά (/en/…).
   Τα ελληνικά URL μένουν ΑΚΡΙΒΩΣ όπως ήταν· τα αγγλικά ζουν κάτω από
   /en, οπότε δεν πειράζεται ούτε ένα από τα 31 indexed URL.
   ═══════════════════════════════════════════════════════════════════ */

import type { L } from '@/content/types'

export type Lang = 'el' | 'en'

/** Παίρνει το σωστό κείμενο· αν λείπει το αγγλικό, γυρνά το ελληνικό (ποτέ κενό). */
export function t(v: L | undefined | null, lang: Lang): string {
  if (!v) return ''
  if (lang === 'en') return (v.en ?? '').trim() || v.el
  return v.el
}

/** True όταν δείχνουμε ελληνικό κείμενο σε αγγλική σελίδα (για lang="el" στο markup). */
export function isFallback(v: L | undefined | null, lang: Lang): boolean {
  return lang === 'en' && !((v?.en ?? '').trim())
}

export const locale = (lang: Lang) => (lang === 'en' ? 'en-GB' : 'el-GR')
export const htmlLang = (lang: Lang) => (lang === 'en' ? 'en' : 'el')

/** /pros-polisi → /en/pros-polisi. Το '/' γίνεται '/en'. */
export function href(path: string, lang: Lang): string {
  if (lang !== 'en') return path
  if (path === '/') return '/en'
  if (path.startsWith('#') || path.startsWith('tel:') || path.startsWith('mailto:') || path.startsWith('http')) return path
  return `/en${path}`
}

/** Το αντίστοιχο URL στην άλλη γλώσσα — για τον διακόπτη γλώσσας. */
export function otherHref(pathname: string, to: Lang): string {
  const bare = pathname.replace(/^\/en(?=\/|$)/, '') || '/'
  return to === 'en' ? (bare === '/' ? '/en' : `/en${bare}`) : bare
}

export function num(n: number, lang: Lang): string {
  return n.toLocaleString(locale(lang))
}

/* ── Λεξικό διεπαφής ───────────────────────────────────────────────
   Ό,τι δεν έρχεται από τα δεδομένα του site. Ένα σημείο αλλαγής.     */

const D = {
  /* πλοήγηση */
  home:        { el: 'Αρχική',              en: 'Home' },
  forSale:     { el: 'Προς πώληση',         en: 'For sale' },
  completed:   { el: 'Έργα',                en: 'Projects' },
  completedFull: { el: 'Ολοκληρωμένα έργα', en: 'Completed projects' },
  interiors:   { el: 'Διαμορφώσεις',        en: 'Interiors' },
  services:    { el: 'Υπηρεσίες',           en: 'Services' },
  contact:     { el: 'Επικοινωνία',         en: 'Contact' },
  privacy:     { el: 'Πολιτική απορρήτου',  en: 'Privacy policy' },
  pages:       { el: 'Σελίδες',             en: 'Pages' },
  menu:        { el: 'Μενού',               en: 'Menu' },
  menuOpen:    { el: 'Άνοιγμα μενού',        en: 'Open menu' },
  menuClose:   { el: 'Κλείσιμο μενού',      en: 'Close menu' },

  /* διακόπτες */
  theme:       { el: 'Θέμα',                en: 'Theme' },
  themeLight:  { el: 'Φωτεινό θέμα',        en: 'Light theme' },
  themeDark:   { el: 'Σκούρο θέμα',         en: 'Dark theme' },
  language:    { el: 'Γλώσσα',              en: 'Language' },

  /* αρχική */
  heroEyebrow: { el: 'Κατασκευαστική εταιρεία · Αθήνα · από το 2000', en: 'Construction company · Athens · since 2000' },
  heroLine1:   { el: 'Χτίζουμε σπίτια',     en: 'We build homes' },
  heroLine2:   { el: 'που αντέχουν στον χρόνο', en: 'that outlast us' },
  heroLead:    { el: 'Νεόδμητα διαμερίσματα ενεργειακής κλάσης Α, απευθείας από τον κατασκευαστή — χωρίς μεσάζοντες και χωρίς μεσιτική αμοιβή.',
                 en: 'Newly built, energy-class A apartments straight from the developer — no middlemen, no agency fee.' },
  seeAvailable:{ el: 'Δείτε τα διαθέσιμα',  en: 'See what is available' },
  statAvailable:{ el: 'Διαθέσιμα τώρα',     en: 'Available now' },
  statProjects:{ el: 'Έργα',                en: 'Projects' },
  statAreas:   { el: 'Περιοχές',            en: 'Areas' },
  statFrom:    { el: 'Τιμή από',            en: 'Priced from' },
  availableNow:{ el: 'Διαθέσιμα αυτή τη στιγμή', en: 'Available right now' },
  allNAvailable:{ el: 'Και τα {n} διαθέσιμα →', en: 'All {n} available →' },
  whatWeDo:    { el: 'Τι κάνουμε',          en: 'What we do' },
  fromPlotLine1:{ el: 'Από το οικόπεδο',    en: 'From the plot' },
  fromPlotLine2:{ el: 'ως το κλειδί στο χέρι', en: 'to the key in your hand' },
  theCompany:  { el: 'Η εταιρεία',          en: 'The company' },
  yearsTitle:  { el: 'Πάνω από 25 χρόνια στις κατασκευές', en: 'More than 25 years of building' },
  yearsLead:   { el: 'Βρίσκουμε το οικόπεδο, κάνουμε τη μελέτη, χτίζουμε και παραδίδουμε. Ο αγοραστής επιλέγει υλικά και διαρρυθμίσεις όσο το κτήριο είναι ακόμα στα χέρια μας — κάτι που κανένας μεσίτης δεν μπορεί να προσφέρει.',
                 en: 'We find the plot, do the design, build it and hand it over. The buyer picks materials and layouts while the building is still in our hands — something no estate agent can offer.' },
  seeCompleted:{ el: 'Δείτε τα ολοκληρωμένα έργα →', en: 'See the completed projects →' },
  letsTalk:    { el: 'Ας μιλήσουμε',        en: 'Let us talk' },
  tellUsLead:  { el: 'Πείτε μας τι ψάχνετε — περιοχή, τετραγωνικά, προϋπολογισμό — και σας ενημερώνουμε μόλις βγει κάτι που ταιριάζει.',
                 en: 'Tell us what you are after — area, square metres, budget — and we will let you know the moment something fits.' },
  sendMessage: { el: 'Στείλτε μήνυμα',      en: 'Send a message' },

  /* κατάλογος */
  forSaleLine1:{ el: 'Διαμερίσματα',        en: 'Apartments' },
  forSaleLine2:{ el: 'προς πώληση',         en: 'for sale' },
  catalogueLead:{ el: 'Απευθείας από τον κατασκευαστή. Ό,τι βλέπετε εδώ το χτίζουμε εμείς.',
                 en: 'Straight from the developer. Everything here is built by us.' },
  notFoundTitle:{ el: 'Δεν βρήκατε αυτό που ψάχνετε;', en: 'Not finding what you want?' },
  notFoundLead:{ el: 'Χτίζουμε συνέχεια. Πείτε μας περιοχή, τετραγωνικά και προϋπολογισμό, και σας ενημερώνουμε πρώτους.',
                 en: 'We are always building. Tell us the area, the size and the budget, and you will hear first.' },

  /* φίλτρα */
  perUnit:     { el: 'Ανά διαμέρισμα',      en: 'By apartment' },
  perProject:  { el: 'Ανά έργο',            en: 'By project' },
  area:        { el: 'Περιοχή',             en: 'Area' },
  allF:        { el: 'Όλες',                en: 'All' },
  bedrooms:    { el: 'Υπνοδωμάτια',         en: 'Bedrooms' },
  allN:        { el: 'Όλα',                 en: 'Any' },
  threePlus:   { el: '3 και πάνω',          en: '3 or more' },
  sort:        { el: 'Σειρά',               en: 'Sort' },
  priceAsc:    { el: 'Τιμή, χαμηλή πρώτα',  en: 'Price, low first' },
  priceDesc:   { el: 'Τιμή, υψηλή πρώτα',   en: 'Price, high first' },
  sqmDesc:     { el: 'Μεγαλύτερα πρώτα',    en: 'Largest first' },
  byArea:      { el: 'Περιοχή',             en: 'Area' },
  onlyAvailable:{ el: 'Μόνο διαθέσιμα',     en: 'Available only' },
  nApartments: { el: '{n} διαμερίσματα',    en: '{n} apartments' },
  nProjects:   { el: '{n} έργα',            en: '{n} projects' },
  emptyLead:   { el: 'Δεν υπάρχει ακίνητο με αυτά τα κριτήρια. Καλέστε μας στο',
                 en: 'Nothing matches those filters. Give us a call on' },
  emptyTail:   { el: '— συχνά έχουμε κάτι που δεν έχει ανέβει ακόμα.',
                 en: '— we often have something that is not listed yet.' },

  /* κάρτες */
  fromDeveloper:{ el: 'Από τον κατασκευαστή', en: 'From the developer' },
  energyBadge: { el: 'Ενεργειακή {c}',      en: 'Energy class {c}' },
  nAvailable:  { el: '{n} διαθέσιμα',       en: '{n} available' },
  finished:    { el: 'Ολοκληρωμένο',        en: 'Completed' },
  delivered:   { el: 'Παραδόθηκε',          en: 'Delivered' },
  onRequest:   { el: 'Κατόπιν επικοινωνίας', en: 'Price on request' },
  from:        { el: 'από',                 en: 'from' },
  nProperties: { el: '{n} ακίνητα',         en: '{n} properties' },
  seeNPhotos:  { el: 'Δείτε {n} φωτογραφίες', en: 'View {n} photos' },
  prevPhoto:   { el: 'Προηγούμενη φωτογραφία', en: 'Previous photo' },
  nextPhoto:   { el: 'Επόμενη φωτογραφία',  en: 'Next photo' },
  photo:       { el: 'φωτογραφία',          en: 'photo' },
  photos:      { el: 'φωτογραφίες',         en: 'photos' },
  openPhoto:   { el: 'άνοιγμα φωτογραφίας', en: 'open photo' },
  close:       { el: 'Κλείσιμο',            en: 'Close' },

  /* συντομογραφίες καρτών */
  bdShort:     { el: 'υ/δ',                 en: 'bd' },
  baShort:     { el: 'μπ',                  en: 'ba' },
  sqmShort:    { el: 'τ.μ.',                en: 'sqm' },
  perSqm:      { el: '€/τ.μ.',              en: '€/sqm' },

  /* σελίδα ακινήτου */
  theProject:  { el: 'Το έργο',             en: 'The project' },
  theProperties:{ el: 'Τα ακίνητα',         en: 'The properties' },
  nProperty:   { el: '{n} ακίνητο',         en: '{n} property' },
  floor:       { el: 'Όροφος',              en: 'Floor' },
  type:        { el: 'Τύπος',               en: 'Type' },
  sqmCol:      { el: 'Τ.μ.',                en: 'Sqm' },
  bdCol:       { el: 'Υ/Δ',                 en: 'Bd' },
  baCol:       { el: 'Μπ.',                 en: 'Ba' },
  price:       { el: 'Τιμή',                en: 'Price' },
  status:      { el: 'Κατάσταση',           en: 'Status' },
  size:        { el: 'Εμβαδόν',             en: 'Size' },
  baths:       { el: 'Μπάνια',              en: 'Bathrooms' },
  heating:     { el: 'Θέρμανση',            en: 'Heating' },
  energyClass: { el: 'Ενεργειακή κλάση',    en: 'Energy class' },
  pricePerSqmL:{ el: 'Τιμή ανά τ.μ.',       en: 'Price per sqm' },
  availability:{ el: 'Διαθεσιμότητα',       en: 'Availability' },
  amenities:   { el: 'Παροχές',             en: 'Amenities' },
  askAbout:    { el: 'Ρωτήστε για αυτό →',  en: 'Ask about this one →' },
  toReview:    { el: 'Προς έλεγχο:',        en: 'To verify:' },
  theBuilding: { el: 'Το κτήριο',           en: 'The building' },
  interested:  { el: 'Ενδιαφέρεστε;',       en: 'Interested?' },
  callUsOn:    { el: 'Καλέστε μας στο',     en: 'Call us on' },
  orSend:      { el: 'ή στείλτε μήνυμα — απαντάμε την ίδια μέρα.',
                 en: 'or send a message — we answer the same day.' },
  availableOf: { el: 'Διαθέσιμα',           en: 'Available' },
  ofWord:      { el: 'από',                 en: 'of' },
  newBuild:    { el: 'Νεόδμητο',            en: 'New build' },
  resale:      { el: 'Μεταπώληση',          en: 'Resale' },
  directPitch: { el: 'Απευθείας από τον κατασκευαστή. Χωρίς μεσιτική αμοιβή.',
                 en: 'Straight from the developer. No agency fee.' },

  /* καταστάσεις */
  stAvailable: { el: 'Διαθέσιμο',           en: 'Available' },
  stSold:      { el: 'Πουλήθηκε',           en: 'Sold' },
  stReserved:  { el: 'Κρατημένο',           en: 'Reserved' },
  stUnknown:   { el: 'Ρωτήστε μας',         en: 'Ask us' },

  /* ολοκληρωμένα έργα */
  completedProject:{ el: 'Ολοκληρωμένο έργο', en: 'Completed project' },
  nBuilding:   { el: '{n} κτήριο',          en: '{n} building' },
  nBuildings:  { el: '{n} κτήρια',          en: '{n} buildings' },
  completedLead:{ el: '{b} κτήρια σε {a} περιοχές. Παραδομένα, κατοικημένα, στη θέση τους.',
                 en: '{b} buildings across {a} areas. Delivered, lived in, standing.' },
  nextProject: { el: 'Επόμενο έργο',        en: 'Next project' },

  /* διαμορφώσεις */
  interiorsLine1:{ el: 'Διαμόρφωση',        en: 'Interior' },
  interiorsLine2:{ el: 'εσωτερικών χώρων',  en: 'design' },
  interiorsLead:{ el: 'Προτείνουμε και σχεδιάζουμε λύσεις εσωτερικών διαρρυθμίσεων, σύμφωνα με τις δικές σας ανάγκες.',
                 en: 'We propose and draw interior layouts built around the way you actually live.' },
  seeMore:     { el: 'Δείτε →',             en: 'See →' },
  ownPlaceTitle:{ el: 'Θέλετε κάτι δικό σας;', en: 'Want something of your own?' },
  ownPlaceLead:{ el: 'Μιλήστε μας όσο το κτήριο είναι ακόμα στα χέρια μας.',
                 en: 'Talk to us while the building is still in our hands.' },

  /* υπηρεσίες */
  servicesLead:{ el: 'Από την εύρεση του οικοπέδου ως το κλειδί στο χέρι.',
                 en: 'From finding the plot to the key in your hand.' },
  plotTitle:   { el: 'Έχετε οικόπεδο;',     en: 'Own a plot?' },
  plotLead:    { el: 'Συνεργαζόμαστε με ιδιοκτήτες οικοπέδων και ακινήτων. Ας το συζητήσουμε.',
                 en: 'We work with owners of land and property. Let us talk it through.' },

  /* επικοινωνία */
  phone:       { el: 'Τηλέφωνο',            en: 'Phone' },
  email:       { el: 'Email',               en: 'Email' },
  office:      { el: 'Γραφείο',             en: 'Office' },
  social:      { el: 'Social',              en: 'Social' },

  /* φόρμα */
  interestedIn:{ el: 'Ενδιαφέρομαι για:',   en: 'Interested in:' },
  firstName:   { el: 'Όνομα',               en: 'First name' },
  lastName:    { el: 'Επώνυμο',             en: 'Last name' },
  message:     { el: 'Μήνυμα',              en: 'Message' },
  consentPre:  { el: 'Αποδέχομαι την',      en: 'I accept the' },
  consentPost: { el: 'και τη διατήρηση των στοιχείων μου για να μου απαντήσετε.',
                 en: 'and that my details are kept so you can reply.' },
  submit:      { el: 'Στείλτε το μήνυμα',   en: 'Send the message' },
  sending:     { el: 'Αποστολή…',           en: 'Sending…' },
  sentTitle:   { el: 'Το μήνυμα στάλθηκε',  en: 'Message sent' },
  sentBody:    { el: 'Θα επικοινωνήσουμε μαζί σας το συντομότερο. Αν βιάζεστε, πάρτε μας τηλέφωνο.',
                 en: 'We will be in touch shortly. If you are in a hurry, give us a ring.' },
  tenDigits:   { el: 'Δέκα ψηφία τουλάχιστον', en: 'At least ten digits' },
  hpLabel:     { el: 'Μην συμπληρώσετε αυτό το πεδίο', en: 'Do not fill in this field' },
  somethingWrong:{ el: 'Κάτι πήγε στραβά.', en: 'Something went wrong.' },

  /* 404 */
  nf404:       { el: 'Η σελίδα δεν βρέθηκε', en: 'Page not found' },
  nf404Lead:   { el: 'Ίσως το ακίνητο πουλήθηκε και η σελίδα του άλλαξε, ή ο σύνδεσμος ήταν λάθος.',
                 en: 'The property may have sold and its page moved, or the link was wrong.' },
  seeProperties:{ el: 'Δείτε τα ακίνητα',   en: 'See the properties' },

  /* footer */
  footerAbout: { el: 'Κατασκευαστική εταιρεία στην Αθήνα, με {y} χρόνια στο χτίσιμο κατοικιών υψηλών προδιαγραφών.',
                 en: 'An Athens construction company, {y} years of building homes to a high standard.' },

  /* σημείωση γλώσσας */
  greekOnly:   { el: '', en: 'Greek original' },
} as const

export type UIKey = keyof typeof D

/** tr('el')('forSale') → 'Προς πώληση'. Με {n} placeholders: tr(lang)('nAvailable', {n: 4}). */
export function tr(lang: Lang) {
  return (key: UIKey, vars?: Record<string, string | number>): string => {
    let s = t(D[key] as L, lang)
    if (vars) for (const [k, v] of Object.entries(vars)) s = s.replaceAll(`{${k}}`, String(v))
    return s
  }
}

export const STATUS_KEY = {
  available: 'stAvailable', sold: 'stSold', reserved: 'stReserved', unknown: 'stUnknown',
} as const satisfies Record<string, UIKey>
