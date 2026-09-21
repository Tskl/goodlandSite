import Link from 'next/link'
import type { Property } from '@/content/types'
import { unitsOf, priceNumber } from '@/lib/features'
import { energy, label, name } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'
import { href, num, tr } from '@/lib/i18n'
import { photosOf } from '@/lib/plans'
import CardMedia from './CardMedia'

export default function PropertyCard({
  p, priority = false, lang = 'el',
}: { p: Property; priority?: boolean; lang?: Lang }) {
  const T = tr(lang)
  const units = unitsOf(p)
  const available = units.filter((u) => u.status === 'available')
  const prices = available.map((u) => priceNumber(u.price)).filter(Boolean) as number[]
  const sqms = available.map((u) => u.sqm).filter(Boolean) as number[]
  const off = available.length === 0
  const to = href(`/${p.slug}`, lang)

  const area = name(p.area.el, lang)
  const address = label(p.address, lang)

  const badges = [
    off ? T('finished') : T('nAvailable', { n: available.length }),
    p.energyClass ? T('energyBadge', { c: energy(p.energyClass, lang) }) : null,
  ].filter(Boolean) as string[]

  const facts = [
    T('nProperties', { n: units.length }),
    sqms.length ? `${Math.min(...sqms)}–${Math.max(...sqms)} ${T('sqmShort')}` : null,
  ].filter(Boolean) as string[]

  return (
    <article className={`jc ${off ? 'jc--off' : ''}`}>
      <Link href={to} className="jc__link" aria-label={`${address}, ${area}`}>
        <CardMedia images={photosOf(p).slice(0, 8)} priority={priority} badges={badges} lang={lang}
                   alt={`${address}, ${area}`} />
      </Link>

      <div className="jc__body">
        <div className="jc__top">
          <Link href={to} className="jc__price">
            {prices.length
              ? `${T('from')} €${num(Math.min(...prices), lang)}`
              : <span className="dim">{T('onRequest')}</span>}
          </Link>
          <span className={`jc__state ${off ? 'is-off' : 'is-on'}`}>
            {off ? T('delivered') : T('forSale')}
          </span>
        </div>

        <div className="jc__facts">{facts.join(' · ')}</div>

        <Link href={to} className="jc__where">{address} — {area}</Link>
      </div>
    </article>
  )
}
