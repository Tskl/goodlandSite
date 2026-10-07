'use client'

import { useEffect, useId, useRef, useState } from 'react'

export type Option = { value: string; label: string }

/**
 * Μενού επιλογής στα χρώματα του site — αντί για το <select> του browser,
 * που όταν ανοίγει παίρνει τα χρώματα των Windows (λευκό πάνω σε λευκό στο
 * σκούρο θέμα). Πληκτρολόγιο: ↑ ↓ Home End, Enter/Space, Esc, Tab.
 */
export default function Select({ value, options, onChange, label }: {
  value: string
  options: Option[]
  onChange: (v: string) => void
  label: string
}) {
  const [open, setOpen] = useState(false)
  const [active, setActive] = useState(0)
  const [alignRight, setAlignRight] = useState(false)
  const root = useRef<HTMLDivElement>(null)
  const btn = useRef<HTMLButtonElement>(null)
  const list = useRef<HTMLUListElement>(null)
  const id = useId()
  const current = options.find((o) => o.value === value) ?? options[0]

  // Κλείνει με κλικ έξω.
  useEffect(() => {
    if (!open) return
    const onDown = (e: PointerEvent) => { if (!root.current?.contains(e.target as Node)) setOpen(false) }
    document.addEventListener('pointerdown', onDown)
    return () => document.removeEventListener('pointerdown', onDown)
  }, [open])

  // Όταν ανοίγει: εστίαση στη λίστα, στην τρέχουσα επιλογή.
  useEffect(() => {
    if (!open) return
    setActive(Math.max(0, options.findIndex((o) => o.value === value)))
    list.current?.focus()
    // Αν η λίστα βγαίνει έξω από τη δεξιά άκρη της οθόνης, ανοίγει προς τα αριστερά.
    const b = root.current?.getBoundingClientRect()
    const w = list.current?.offsetWidth ?? 0
    setAlignRight(!!b && b.left + w > document.documentElement.clientWidth - 8)
  }, [open])

  useEffect(() => {
    if (!open) return
    list.current?.querySelector<HTMLElement>(`[data-i="${active}"]`)?.scrollIntoView({ block: 'nearest' })
  }, [active, open])

  function pick(i: number) {
    onChange(options[i].value)
    setOpen(false)
    btn.current?.focus()
  }

  function onListKey(e: React.KeyboardEvent) {
    if (e.key === 'ArrowDown') { e.preventDefault(); setActive((a) => Math.min(options.length - 1, a + 1)) }
    else if (e.key === 'ArrowUp') { e.preventDefault(); setActive((a) => Math.max(0, a - 1)) }
    else if (e.key === 'Home') { e.preventDefault(); setActive(0) }
    else if (e.key === 'End') { e.preventDefault(); setActive(options.length - 1) }
    else if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); pick(active) }
    else if (e.key === 'Escape') { e.preventDefault(); setOpen(false); btn.current?.focus() }
    else if (e.key === 'Tab') setOpen(false)
  }

  return (
    <div className={`sel ${open ? 'is-open' : ''}`} ref={root}>
      <button
        ref={btn}
        type="button"
        className="sel__btn"
        aria-haspopup="listbox"
        aria-expanded={open}
        aria-controls={`${id}-list`}
        aria-label={`${label}: ${current?.label ?? ''}`}
        onClick={() => setOpen((o) => !o)}
        onKeyDown={(e) => { if (e.key === 'ArrowDown' || e.key === 'ArrowUp') { e.preventDefault(); setOpen(true) } }}
      >
        <span>{current?.label}</span>
        <svg className="sel__chev" viewBox="0 0 10 6" width="10" height="6" aria-hidden="true">
          <path d="M1 1l4 4 4-4" fill="none" stroke="currentColor" strokeWidth="1.4" />
        </svg>
      </button>
      {open && (
        <ul
          ref={list}
          id={`${id}-list`}
          className={`sel__list ${alignRight ? 'sel__list--right' : ''}`}
          role="listbox"
          tabIndex={-1}
          aria-label={label}
          aria-activedescendant={`${id}-o${active}`}
          onKeyDown={onListKey}
        >
          {options.map((o, i) => (
            <li
              key={o.value}
              id={`${id}-o${i}`}
              data-i={i}
              role="option"
              aria-selected={o.value === value}
              className={`${i === active ? 'is-active' : ''} ${o.value === value ? 'is-on' : ''}`}
              onPointerEnter={() => setActive(i)}
              onClick={() => pick(i)}
            >
              {o.label}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
