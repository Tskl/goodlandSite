export type L = { el: string; en?: string }

/** Περιοχή: όνομα + (από τη βάση) έτοιμο «στη Γλυφάδα». */
export type Area = L & { in?: string }

export type Status = 'available' | 'reserved' | 'sold' | 'unknown'

export type Unit = {
  id: string
  floor: L
  type: L
  sqm?: number
  bedrooms?: number
  status: Status
  price?: string
  description: L
  /** Επίπεδα του διαμερίσματος: [1] = 1ος όροφος, [4,5] = μεζονέτα. */
  floors?: number[]
  /** Καρφωμένοι κωδικοί κατόψεων (από το gen/unit-plans.json). */
  plan?: string[]
  /** Σημεία που βρέθηκαν αντιφατικά στο παλιό site και θέλουν επιβεβαίωση. */
  needsReview?: string[]
}

/** Κάτοψη, όπως την κωδικοποιούσε το παλιό site: Α1 = 1ος όροφος, διαμέρισμα 1. */
export type Plan = { code: string; floor: number; src: string }

export type Property = {
  slug: string
  address: L
  area: Area
  kind: 'new-build' | 'resale'
  energyClass?: string
  buildingDescription: L
  units: Unit[]
  images: string[]
  plans: Plan[]
  seo: { title: L; description?: L }
  needsReview?: string[]
}

export type ProjectArea = {
  slug: string
  area: Area
  buildings: { address: L; specs: L; description?: L }[]
  images: string[]
}

export type Interior = {
  slug: string
  title: L
  intro?: L
  images: string[]
}

export type Service = { title: L; description: L; href: string }
