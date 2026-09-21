'use client'

import { useState } from 'react'
import Image from 'next/image'
import type { Lang } from '@/lib/i18n'
import { tr } from '@/lib/i18n'

export default function CardMedia({
  images, alt, badges = [], priority = false, lang = 'el',
}: { images: string[]; alt: string; badges?: string[]; priority?: boolean; lang?: Lang }) {
  const [i, setI] = useState(0)
  const T = tr(lang)
  const n = images.length
  if (!n) return <div className="cm cm--empty" />

  const go = (d: number) => (e: React.MouseEvent) => {
    e.preventDefault(); e.stopPropagation()
    setI((v) => (v + d + n) % n)
  }

  return (
    <div className="cm">
      {images.map((src, k) => (
        <Image
          key={src}
          src={src}
          alt={k === 0 ? alt : ''}
          width={900}
          height={562}
          priority={priority && k === 0}
          loading={priority && k === 0 ? undefined : 'lazy'}
          sizes="(max-width: 620px) 100vw, (max-width: 1100px) 50vw, 33vw"
          className={k === i ? 'cm__img cm__img--on' : 'cm__img'}
        />
      ))}

      {badges.length > 0 && (
        <div className="cm__badges">
          {badges.map((b) => <span key={b} className="cm__badge">{b}</span>)}
        </div>
      )}

      {n > 1 && (
        <>
          <button className="cm__nav cm__nav--prev" onClick={go(-1)} aria-label={T('prevPhoto')}>‹</button>
          <button className="cm__nav cm__nav--next" onClick={go(1)} aria-label={T('nextPhoto')}>›</button>
          <span className="cm__count">{i + 1} / {n}</span>
          <span className="cm__hint">{T('seeNPhotos', { n })}</span>
        </>
      )}
    </div>
  )
}
