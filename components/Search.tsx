'use client'

import { useCallback, useEffect, useMemo, useRef, useState } from 'react'
import { useRouter } from 'next/navigation'
import type { Lang } from '@/lib/i18n'
import { search, type Hit, type Kind } from '@/lib/search-match'

const TXT = {
  el: {
    open: 'Αναζήτηση', ph: 'Περιοχή, διεύθυνση, τ.μ., υπνοδωμάτια…', close: 'Κλείσιμο',
    none: 'Δεν βρέθηκε κάτι. Δοκίμασε περιοχή («Μαρούσι»), διεύθυνση ή «2 υπνοδωμάτια».',
    tips: ['Μαρούσι', '2 υπνοδωμάτια', 'μεζονέτα', '80 τμ', 'Παπάγου', 'κουζίνες'],
    kind: { page: 'Σελίδα', property: 'Έργο', unit: 'Διαμέρισμα', area: 'Ολοκληρωμένο έργο', interior: 'Διαμόρφωση' } as Record<Kind, string>,
    loading: 'Φόρτωση…', fail: 'Η αναζήτηση δεν φόρτωσε. Δοκίμασε ξανά.',
  },
  en: {
    open: 'Search', ph: 'Area, address, sqm, bedrooms…', close: 'Close',
    none: 'Nothing found. Try an area ("Maroussi"), an address or "2 bedrooms".',
    tips: ['Maroussi', '2 bedrooms', 'maisonette', '80 sqm', 'Papagou', 'kitchens'],
    kind: { page: 'Page', property: 'Project', unit: 'Apartment', area: 'Completed project', interior: 'Interior' } as Record<Kind, string>,
    loading: 'Loading…', fail: 'Search did not load. Please try again.',
  },
}

export default function Search({ lang }: { lang: Lang }) {
  const C = TXT[lang]
  const router = useRouter()
  const [open, setOpen] = useState(false)
  const [q, setQ] = useState('')
  const [index, setIndex] = useState<Hit[] | null>(null)
  const [error, setError] = useState(false)
  const [active, setActive] = useState(0)
  const input = useRef<HTMLInputElement>(null)
  const listRef = useRef<HTMLUListElement>(null)
  const opener = useRef<HTMLButtonElement>(null)

  const load = useCallback(async () => {
    if (index) return
    try {
      setError(false)
      const r = await fetch(`/api/search?lang=${lang}`)
      if (!r.ok) throw new Error()
      setIndex(await r.json())
    } catch {
      setError(true)
    }
  }, [index, lang])

  // Ctrl/⌘+K ή «/» ανοίγουν την αναζήτηση από οπουδήποτε.
  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      const typing = /^(INPUT|TEXTAREA|SELECT)$/.test((e.target as HTMLElement)?.tagName ?? '')
      if ((e.key === 'k' && (e.ctrlKey || e.metaKey)) || (e.key === '/' && !typing)) {
        e.preventDefault()
        setOpen(true)
      }
    }
    window.addEventListener('keydown', onKey)
    return () => window.removeEventListener('keydown', onKey)
  }, [])

  useEffect(() => {
    if (!open) return
    load()
    const prev = document.body.style.overflow
    document.body.style.overflow = 'hidden'
    window.setTimeout(() => input.current?.focus(), 30)
    return () => { document.body.style.overflow = prev }
  }, [open, load])

  const results = useMemo(() => (index ? search(index, q) : []), [index, q])

  useEffect(() => { setActive(0) }, [q])
  useEffect(() => {
    listRef.current?.querySelector<HTMLElement>(`[data-i="${active}"]`)?.scrollIntoView({ block: 'nearest' })
  }, [active])

  function close() {
    setOpen(false)
    setQ('')
    opener.current?.focus()
  }

  function go(h: Hit) {
    setOpen(false)
    setQ('')
    router.push(h.href)
  }

  function onKey(e: React.KeyboardEvent) {
    if (e.key === 'Escape') { e.preventDefault(); close() }
    else if (e.key === 'ArrowDown') { e.preventDefault(); setActive((a) => Math.min(results.length - 1, a + 1)) }
    else if (e.key === 'ArrowUp') { e.preventDefault(); setActive((a) => Math.max(0, a - 1)) }
    else if (e.key === 'Enter' && results[active]) { e.preventDefault(); go(results[active]) }
  }

  return (
    <>
      <button ref={opener} type="button" className="ctl__theme ctl__search" onClick={() => setOpen(true)}
              aria-label={C.open} title={`${C.open} (Ctrl+K)`}>
        <svg viewBox="0 0 24 24" width="15" height="15" aria-hidden="true" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round">
          <circle cx="10.5" cy="10.5" r="6.5" /><path d="M15.5 15.5 21 21" />
        </svg>
      </button>

      {open && (
        <div className="srch" role="dialog" aria-modal="true" aria-label={C.open}
             onMouseDown={(e) => { if (e.target === e.currentTarget) close() }} onKeyDown={onKey}>
          <div className="srch__panel">
            <div className="srch__bar">
              <svg viewBox="0 0 24 24" width="18" height="18" aria-hidden="true" fill="none" stroke="currentColor" strokeWidth="1.9" strokeLinecap="round">
                <circle cx="10.5" cy="10.5" r="6.5" /><path d="M15.5 15.5 21 21" />
              </svg>
              <input
                ref={input}
                value={q}
                onChange={(e) => setQ(e.target.value)}
                placeholder={C.ph}
                aria-label={C.open}
                aria-controls="srch-list"
                aria-activedescendant={results[active] ? `srch-${active}` : undefined}
                autoComplete="off"
                spellCheck={false}
                enterKeyHint="search"
              />
              <button type="button" className="srch__close" onClick={close} aria-label={C.close}>Esc</button>
            </div>

            <div className="srch__body">
              {error && <p className="srch__msg">{C.fail}</p>}
              {!error && !index && q && <p className="srch__msg">{C.loading}</p>}
              {!q && (
                <div className="srch__tips">
                  {C.tips.map((tip) => (
                    <button key={tip} type="button" className="chip" onClick={() => { setQ(tip); input.current?.focus() }}>{tip}</button>
                  ))}
                </div>
              )}
              {index && q && results.length === 0 && <p className="srch__msg">{C.none}</p>}
              {results.length > 0 && (
                <ul className="srch__list" id="srch-list" role="listbox" ref={listRef}>
                  {results.map((h, i) => (
                    <li key={`${h.href}-${i}`} id={`srch-${i}`} data-i={i} role="option" aria-selected={i === active}
                        className={i === active ? 'is-active' : ''}
                        onMouseEnter={() => setActive(i)} onClick={() => go(h)}>
                      <span className={`srch__kind is-${h.k}`}>{C.kind[h.k]}</span>
                      <span className="srch__text">
                        <b>{h.title}</b>
                        {h.sub && <span>{h.sub}</span>}
                      </span>
                    </li>
                  ))}
                </ul>
              )}
            </div>
          </div>
        </div>
      )}
    </>
  )
}
