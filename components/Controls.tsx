'use client'

import { useEffect, useState } from 'react'
import { usePathname } from 'next/navigation'
import type { Lang } from '@/lib/i18n'
import { otherHref, tr } from '@/lib/i18n'

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

      <button className="ctl__theme" onClick={flip} type="button"
              aria-label={theme === 'dark' ? T('themeLight') : T('themeDark')}
              title={theme === 'dark' ? T('themeLight') : T('themeDark')}>
        <span className="ctl__sun" aria-hidden="true">
          {theme === 'dark' ? '☀' : '☾'}
        </span>
      </button>
    </div>
  )
}
