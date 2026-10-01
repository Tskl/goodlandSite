'use client'

import Link from 'next/link'
import { useEffect, useState } from 'react'
import type { Lang } from '@/lib/i18n'
import { href } from '@/lib/i18n'
import { onConsentChange, readConsent, writeConsent } from '@/lib/consent'

const TXT = {
  el: {
    text: 'Ο χάρτης στη σελίδα επικοινωνίας φορτώνεται από τη Google, που χρησιμοποιεί cookies. Τίποτε άλλο στο site δεν βάζει cookies.',
    more: 'Πολιτική απορρήτου',
    yes: 'Αποδοχή',
    no: 'Όχι, ευχαριστώ',
  },
  en: {
    text: 'The map on the contact page is loaded from Google, which uses cookies. Nothing else on this site sets cookies.',
    more: 'Privacy policy',
    yes: 'Accept',
    no: 'No, thanks',
  },
}

/** Μπάρα συγκατάθεσης· εμφανίζεται μόνο όσο δεν έχει δοθεί απάντηση. */
export default function CookieConsent({ lang }: { lang: Lang }) {
  const [show, setShow] = useState(false)
  const C = TXT[lang]

  useEffect(() => {
    const sync = () => setShow(readConsent() === null)
    sync()
    return onConsentChange(sync)
  }, [])

  if (!show) return null
  return (
    <div className="consent" role="region" aria-label="Cookies">
      <p className="consent__text">
        {C.text} <Link href={href('/politiki-aporritou', lang)}>{C.more}</Link>
      </p>
      <div className="consent__btns">
        <button type="button" className="btn btn--ghost" onClick={() => writeConsent('no')}>{C.no}</button>
        <button type="button" className="btn" onClick={() => writeConsent('yes')}>{C.yes}</button>
      </div>
    </div>
  )
}

/** Κουμπί για αλλαγή της επιλογής — μπαίνει στην πολιτική απορρήτου. */
export function ConsentReset({ lang }: { lang: Lang }) {
  return (
    <button type="button" className="btn btn--ghost" onClick={() => writeConsent(null)}>
      {lang === 'en' ? 'Change cookie settings' : 'Αλλαγή ρυθμίσεων cookies'}
    </button>
  )
}
