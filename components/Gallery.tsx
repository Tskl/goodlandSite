'use client'

import { useState } from 'react'
import Image from 'next/image'
import type { Lang } from '@/lib/i18n'
import { tr } from '@/lib/i18n'

export default function Gallery({ images, alt, lang = 'el' }: { images: string[]; alt: string; lang?: Lang }) {
  const [open, setOpen] = useState<number | null>(null)
  const T = tr(lang)
  if (!images.length) return null

  return (
    <>
      <div className="gallery">
        {images.map((src, i) => (
          <button key={src} className="gallery__item" onClick={() => setOpen(i)}
                  aria-label={`${alt} — ${T('openPhoto')} ${i + 1}`}>
            <Image src={src} alt={`${alt} — ${T('photo')} ${i + 1}`} width={600} height={450}
                   sizes="(max-width: 640px) 50vw, 300px" />
          </button>
        ))}
      </div>

      {open !== null && (
        <div className="lightbox" role="dialog" aria-modal="true" onClick={() => setOpen(null)}>
          <button className="lightbox__close" aria-label={T('close')}>✕</button>
          <Image src={images[open]} alt={`${alt} — ${T('photo')} ${open + 1}`} width={1600} height={1200}
                 style={{ maxWidth: '92vw', maxHeight: '86vh', width: 'auto', height: 'auto' }} />
          <div className="lightbox__count mono">{open + 1} / {images.length}</div>
        </div>
      )}
    </>
  )
}
