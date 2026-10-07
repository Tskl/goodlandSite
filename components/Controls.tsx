'use client'

import { useEffect, useState } from 'react'
import { usePathname } from 'next/navigation'
import type { Lang } from '@/lib/i18n'
import { otherHref, tr } from '@/lib/i18n'
import Search from './Search'

/** Διακόπτης θέματος (σκούρο/φωτεινό) και γλώσσας (ΕΛ/EN). */
export default function Controls({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const pathname = usePathname() || '/'
  const [theme, setTheme] = useState<'dark' | 'light'>('dark')

  useEffect(() => {
    const now = (document.documentElement.getAttribute('data-theme') as 'dark' | 'light') || 'dark'
    setTheme(now)
  }, [])

  function flip() {
    const next = theme === 'dark' ? 'light' : 'dark'
    setTheme(next)
    const d = document.documentElement
    d.setAttribute('data-theme', next)
    d.style.colorScheme = next
    try { localStorage.setItem('gl-theme', next) } catch {}
  }

  return (
    <div className="ctl">
      <a className={`ctl__lang ${lang === 'el' ? 'on' : ''}`} href={otherHref(pathname, 'el')}
         hrefLang="el" aria-current={lang === 'el' ? 'true' : undefined}>ΕΛ</a>
      <span className="ctl__sep" aria-hidden="true" />
      <a className={`ctl__lang ${lang === 'en' ? 'on' : ''}`} href={otherHref(pathname, 'en')}
         hrefLang="en" aria-current={lang === 'en' ? 'true' : undefined}>EN</a>

      <Search lang={lang} />
      <button className="ctl__theme" onClick={flip} type="button"
              aria-label={theme === 'dark' ? T('themeLight') : T('themeDark')}
              title={theme === 'dark' ? T('themeLight') : T('themeDark')}>
        {/* SVG αντί για χαρακτήρες ☀/☾: τα κινητά τους ζωγραφίζουν ως emoji. */}
        {theme === 'dark' ? (
          <svg className="ctl__icon" viewBox="0 0 24 24" width="15" height="15" aria-hidden="true"
               fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinecap="round">
            <circle cx="12" cy="12" r="4.2" />
            <path d="M12 2.5v2.2M12 19.3v2.2M2.5 12h2.2M19.3 12h2.2M5.3 5.3l1.6 1.6M17.1 17.1l1.6 1.6M5.3 18.7l1.6-1.6M17.1 6.9l1.6-1.6" />
          </svg>
        ) : (
          <svg className="ctl__icon" viewBox="0 0 24 24" width="14" height="14" aria-hidden="true"
               fill="none" stroke="currentColor" strokeWidth="1.8" strokeLinejoin="round">
            <path d="M20.2 14.6A8.3 8.3 0 0 1 9.4 3.8a8.3 8.3 0 1 0 10.8 10.8Z" />
          </svg>
        )}
      </button>
    </div>
  )
}
