'use client'

/**
 * Συγκατάθεση για cookies τρίτων (σήμερα μόνο ο χάρτης Google).
 * Αποθηκεύεται στο localStorage['gl-consent'] = 'yes' | 'no'.
 * Τα analytics του Vercel ΔΕΝ χρειάζονται συγκατάθεση — δεν βάζουν cookies.
 */
export type Consent = 'yes' | 'no' | null

const KEY = 'gl-consent'
const EVT = 'gl-consent-change'

export function readConsent(): Consent {
  try {
    const v = localStorage.getItem(KEY)
    return v === 'yes' || v === 'no' ? v : null
  } catch { return null }
}

export function writeConsent(v: Consent) {
  try {
    if (v) localStorage.setItem(KEY, v)
    else localStorage.removeItem(KEY)
  } catch {}
  window.dispatchEvent(new Event(EVT))
}

export function onConsentChange(fn: () => void) {
  window.addEventListener(EVT, fn)
  return () => window.removeEventListener(EVT, fn)
}
