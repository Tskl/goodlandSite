'use client'

import { useEffect, useState } from 'react'
import type { Lang } from '@/lib/i18n'
import { onConsentChange, readConsent, writeConsent } from '@/lib/consent'

const TXT = {
  el: {
    title: 'Χάρτης: Ύδρας 14, Μοσχάτο',
    off: 'Ο χάρτης φορτώνεται από τη Google, που χρησιμοποιεί cookies.',
    show: 'Εμφάνιση χάρτη',
    open: 'Άνοιγμα στο Google Maps',
  },
  en: {
    title: 'Map: 14 Ydras St, Moschato',
    off: 'The map is loaded from Google, which uses cookies.',
    show: 'Show map',
    open: 'Open in Google Maps',
  },
}

/**
 * Χάρτης Google ενσωματωμένος. Φορτώνει μόνο με συγκατάθεση (GDPR) —
 * χωρίς αυτήν δείχνει θέση + κουμπί, και πάντα σύνδεσμο προς το Google Maps.
 */
export default function MapEmbed({ lang, query }: { lang: Lang; query: string }) {
  const [ok, setOk] = useState<boolean | null>(null)
  const C = TXT[lang]
  const q = encodeURIComponent(query)
  const embed = `https://www.google.com/maps?q=${q}&hl=${lang}&z=16&output=embed`
  const link = `https://www.google.com/maps/search/?api=1&query=${q}`

  useEffect(() => {
    const sync = () => setOk(readConsent() === 'yes')
    sync()
    return onConsentChange(sync)
  }, [])

  return (
    <div className="map">
      {ok ? (
        <iframe
          className="map__frame"
          src={embed}
          title={C.title}
          loading="lazy"
          referrerPolicy="no-referrer-when-downgrade"
          allowFullScreen
        />
      ) : (
        <div className="map__off">
          <p className="dim">{C.off}</p>
          {ok === false && (
            <button type="button" className="btn" onClick={() => writeConsent('yes')}>{C.show}</button>
          )}
        </div>
      )}
      <a className="map__link label" href={link} target="_blank" rel="noopener">{C.open} ↗</a>
    </div>
  )
}
