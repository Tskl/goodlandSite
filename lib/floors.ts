import type { L } from '@/content/types'

/**
 * Ετικέτα ορόφου από τους αριθμούς — ίδιος κανόνας με το db/site/build-seed.mjs.
 *   [1]   → «1ος όροφος» / «1st floor»
 *   [4,5] → «4ος-5ος όροφος» / «4th-5th floor»
 *   [0]   → «Ισόγειο» / «Ground floor»
 */
const ordEl = (n: number) => (n === 0 ? 'Ισόγειο' : `${n}ος`)
function ordEn(n: number): string {
  if (n === 0) return 'Ground'
  const t = n % 100
  if (t >= 11 && t <= 13) return `${n}th`
  return n + (n % 10 === 1 ? 'st' : n % 10 === 2 ? 'nd' : n % 10 === 3 ? 'rd' : 'th')
}

export function floorLabel(floors: number[]): L {
  if (!floors.length) return { el: '', en: '' }
  if (floors.length === 1 && floors[0] === 0) return { el: 'Ισόγειο', en: 'Ground floor' }
  return {
    el: floors.map(ordEl).join('-') + ' όροφος',
    en: floors.map(ordEn).join('-') + ' floor',
  }
}

export const UNIT_TYPE: Record<string, L> = {
  apartment: { el: 'Διαμέρισμα', en: 'Apartment' },
  maisonette: { el: 'Μεζονέτα', en: 'Maisonette' },
  'loft-apartment': { el: 'Διαμέρισμα με σοφίτα', en: 'Apartment with loft' },
}
