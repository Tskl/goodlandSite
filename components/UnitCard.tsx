import Link from 'next/link'
import type { Unit, Property } from '@/content/types'
import { formatPrice, pricePerSqm, bathroomsOf, featuresOf } from '@/lib/features'
import { energy, inArea, label } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'
import { href, t, tr, STATUS_KEY } from '@/lib/i18n'
import { photosOf } from '@/lib/plans'
import CardMedia from './CardMedia'

export default function UnitCard({
  unit: u, property: p, priority = false, lang = 'el',
}: { unit: Unit; property: Property; priority?: boolean; lang?: Lang }) {
  const T = tr(lang)
  const price = formatPrice(u.price, lang)
  const perSqm = pricePerSqm(u, lang)
  const baths = bathroomsOf(u.description.el)
  const feats = featuresOf(u.description.el).slice(0, 3)
  const off = u.status !== 'available'
  const to = href(`/${p.slug}#${u.id}`, lang)

  const area = label(p.area, lang)
  const address = label(p.address, lang)
  const type = t(u.type, lang)

  const badges = [
    T('fromDeveloper'),
    p.energyClass ? T('energyBadge', { c: energy(p.energyClass, lang) }) : null,
  ].filter(Boolean) as string[]

  const facts = [
    u.bedrooms != null ? `${u.bedrooms} ${T('bdShort')}` : null,
    baths != null ? `${baths} ${T('baShort')}` : null,
    u.sqm != null ? `${u.sqm} ${T('sqmShort')}` : null,
    t(u.floor, lang),
  ].filter(Boolean) as string[]

  return (
    <article className={`jc ${off ? 'jc--off' : ''}`}>
      <Link href={to} className="jc__link" aria-label={`${type} ${u.sqm ?? ''} ${T('sqmShort')} ${inArea(p.area, lang)} — ${address}`}>
        <CardMedia images={photosOf(p).slice(0, 8)} priority={priority} badges={badges} lang={lang}
                   alt={`${type} ${u.sqm ?? ''} ${T('sqmShort')}, ${address}, ${area}`} />
      </Link>

      <div className="jc__body">
        <div className="jc__top">
          <Link href={to} className="jc__price">
            {price ?? <span className="dim">{T('onRequest')}</span>}
          </Link>
          <span className={`jc__state ${off ? 'is-off' : 'is-on'}`}>{T(STATUS_KEY[u.status])}</span>
        </div>

        <div className="jc__facts">{facts.join(' · ')}</div>

        <Link href={to} className="jc__where">
          {type} {inArea(p.area, lang)} — {address}
        </Link>

        <div className="jc__foot">
          <span className="jc__chips">{feats.map((f) => <span key={f.label.el}>{t(f.label, lang)}</span>)}</span>
          {perSqm && <span className="jc__psqm num">{perSqm}</span>}
        </div>
      </div>
    </article>
  )
}
