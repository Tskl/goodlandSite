'use client'

import Link from 'next/link'
import { useEffect, useRef, useState } from 'react'
import { usePathname } from 'next/navigation'
import { site } from '@/content/site'
import type { Lang } from '@/lib/i18n'
import { href, otherHref, tr } from '@/lib/i18n'

/** Μενού κινητού: κουμπί burger και συρτάρι με όλους τους συνδέσμους. */
export default function MobileNav({ lang }: { lang: Lang }) {
  const T = tr(lang)
  const L = (p: string) => href(p, lang)
  const pathname = usePathname() || '/'
  const [open, setOpen] = useState(false)
  const panel = useRef<HTMLDivElement>(null)
  const btn = useRef<HTMLButtonElement>(null)

  // Κλείνει σε αλλαγή σελίδας.
  useEffect(() => { setOpen(false) }, [pathname])

  // Κλείδωμα κύλισης, Escape, παγίδα εστίασης.
  useEffect(() => {
    if (!open) return
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'

    function onKey(e: KeyboardEvent) {
      if (e.key === 'Escape') { setOpen(false); btn.current?.focus(); return }
      if (e.key !== 'Tab' || !panel.current) return
      const items = panel.current.querySelectorAll<HTMLElement>(
        'a[href], button:not([disabled])'
      )
      if (items.length === 0) return
      const first = items[0]
      const last = items[items.length - 1]
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus() }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus() }
    }
    document.addEventListener('keydown', onKey)
    // Πρώτη εστίαση μέσα στο συρτάρι.
    const t = window.setTimeout(() => {
      panel.current?.querySelector<HTMLElement>('a[href]')?.focus()
    }, 40)

    return () => {
      document.removeEventListener('keydown', onKey)
      document.body.style.overflow = prev
      window.clearTimeout(t)
    }
  }, [open])

  const links: [string, string][] = [
    [L('/'), T('home')],
    [L('/pros-polisi'), T('forSale')],
    [L('/olokliromena-erga'), T('completedFull')],
    [L('/projects'), T('interiors')],
    [L('/katalogos'), T('services')],
    [L('/contact'), T('contact')],
  ]

  return (
    <>
      <button
        ref={btn}
        type="button"
        className={`burger ${open ? 'is-open' : ''}`}
        aria-label={open ? T('menuClose') : T('menuOpen')}
        aria-expanded={open}
        aria-controls="mobile-menu"
        onClick={() => setOpen((v) => !v)}
      >
        <span className="burger__box" aria-hidden="true">
          <span className="burger__bar" />
          <span className="burger__bar" />
          <span className="burger__bar" />
        </span>
      </button>

      <div
        className={`mnav ${open ? 'is-open' : ''}`}
        hidden={!open}
        onClick={(e) => { if (e.target === e.currentTarget) setOpen(false) }}
      >
        <div className="mnav__panel" id="mobile-menu" ref={panel} role="dialog" aria-modal="true"
             aria-label={T('menu')}>
          <nav className="mnav__links">
            {links.map(([h, label]) => (
              <Link key={h} href={h} className="mnav__link" onClick={() => setOpen(false)}>
                {label}
              </Link>
            ))}
          </nav>

          <div className="mnav__foot">
            <a className="mnav__tel num" href={site.phoneHref}>{site.phone}</a>
            <div className="mnav__lang label">
              <a className={lang === 'el' ? 'on' : ''} href={otherHref(pathname, 'el')} hrefLang="el">ΕΛ</a>
              <span className="ctl__sep" aria-hidden="true" />
              <a className={lang === 'en' ? 'on' : ''} href={otherHref(pathname, 'en')} hrefLang="en">EN</a>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
