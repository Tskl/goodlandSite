'use client'

import { useState } from 'react'
import Image from 'next/image'
import type { Plan } from '@/content/types'
import type { Lang } from '@/lib/i18n'
import { tr } from '@/lib/i18n'

/** Κατόψεις σε πλήρες πλάτος, στη φυσική τους αναλογία, πάνω σε λευκό
    χαρτί. Κλικ για μεγέθυνση σε όλη την οθόνη. */
export default function Plans({ plans, label, lang = 'el' }: { plans: Plan[]; label: string; lang?: Lang }) {
  const [open, setOpen] = useState<number | null>(null)
  const T = tr(lang)
  if (!plans.length) return null

  return (
    <>
      <div className="plans">
        <div className="plans__label label">{label}</div>
        {plans.map((p, i) => (
          <button key={p.code} className="plan" onClick={() => setOpen(i)} aria-label={`${label} ${p.code}`}>
            <Image src={p.src} alt={`${label} ${p.code}`} width={1600} height={1100}
                   sizes="(max-width: 1000px) 94vw, 800px" className="plan__img" />
            <span className="plan__code">{p.code}</span>
          </button>
        ))}
      </div>

      {open !== null && (
        <div className="lightbox lightbox--plan" role="dialog" aria-modal="true" onClick={() => setOpen(null)}>
          <button className="lightbox__close" aria-label={T('close')}>✕</button>
          <Image src={plans[open].src} alt={`${label} ${plans[open].code}`} width={2400} height={1700}
                 style={{ maxWidth: '96vw', maxHeight: '90vh', width: 'auto', height: 'auto', background: '#fff' }} />
          <div className="lightbox__count num">{plans[open].code}</div>
        </div>
      )}
    </>
  )
}
