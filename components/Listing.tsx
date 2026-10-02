'use client'

import { useMemo, useState } from 'react'
import type { Property } from '@/content/types'
import PropertyCard from './PropertyCard'
import UnitCard from './UnitCard'
import { flatUnits, priceNumber, unitsOf, type FlatUnit } from '@/lib/features'
import { name } from '@/lib/greek'
import type { Lang } from '@/lib/i18n'
import { locale, tr } from '@/lib/i18n'
import { site } from '@/content/site'

type View = 'units' | 'projects'
type Sort = 'price-asc' | 'price-desc' | 'sqm-desc' | 'area'

export default function Listing({ properties, lang = 'el' }: { properties: Property[]; lang?: Lang }) {
  const T = tr(lang)
  const [view, setView] = useState<View>('units')
  const [area, setArea] = useState<string | null>(null)
  const [beds, setBeds] = useState<number | null>(null)
  const [onlyAvailable, setOnlyAvailable] = useState(true)
  const [sort, setSort] = useState<Sort>('price-asc')

  const areaEn = useMemo(() => new Map(properties.map((p) => [p.area.el, p.area.en])), [properties])
  const areas = useMemo(
    () => [...new Set(properties.map((p) => p.area.el))].sort((a, b) => a.localeCompare(b, 'el')),
    [properties],
  )

  const units = useMemo(() => {
    let list = flatUnits(properties)
    if (area) list = list.filter((x) => x?.property?.area?.el === area)
    if (beds != null) list = list.filter((x) => (beds === 3 ? (x?.unit?.bedrooms ?? 0) >= 3 : x?.unit?.bedrooms === beds))
    if (onlyAvailable) list = list.filter((x) => x?.unit?.status === 'available')
    const price = (x: FlatUnit) => priceNumber(x?.unit?.price) ?? Number.POSITIVE_INFINITY
    list = [...list].sort((a, b) => {
      if (sort === 'price-asc') return price(a) - price(b)
      if (sort === 'price-desc') return (price(b) === Infinity ? -1 : price(b)) - (price(a) === Infinity ? -1 : price(a))
      if (sort === 'sqm-desc') return (b?.unit?.sqm ?? 0) - (a?.unit?.sqm ?? 0)
      return (a?.property?.area?.el ?? '').localeCompare(b?.property?.area?.el ?? '', locale(lang))
    })
    return list
  }, [properties, area, beds, onlyAvailable, sort, lang])

  const projects = useMemo(() => {
    let list = properties
    if (area) list = list.filter((p) => p.area.el === area)
    if (onlyAvailable) list = list.filter((p) => unitsOf(p).some((u) => u.status === 'available'))
    return list
  }, [properties, area, onlyAvailable])

  return (
    <>
      <div className="filterbar">
        <div className="toolbar">
          <div className="switch">
            <button className={view === 'units' ? 'on' : ''} onClick={() => setView('units')}>{T('perUnit')}</button>
            <button className={view === 'projects' ? 'on' : ''} onClick={() => setView('projects')}>{T('perProject')}</button>
          </div>

          <div className="toolbar__group">
            <span className="label">{T('area')}</span>
            <select value={area ?? ''} onChange={(e) => setArea(e.target.value || null)} aria-label={T('area')}>
              <option value="">{T('allF')}</option>
              {areas.map((a) => <option key={a} value={a}>{(lang === 'en' && areaEn.get(a)) || name(a, lang)}</option>)}
            </select>
          </div>

          {view === 'units' && (
            <div className="toolbar__group">
              <span className="label">{T('bedrooms')}</span>
              <select value={beds ?? ''} onChange={(e) => setBeds(e.target.value ? Number(e.target.value) : null)} aria-label={T('bedrooms')}>
                <option value="">{T('allN')}</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">{T('threePlus')}</option>
              </select>
            </div>
          )}

          {view === 'units' && (
            <div className="toolbar__group">
              <span className="label">{T('sort')}</span>
              <select value={sort} onChange={(e) => setSort(e.target.value as Sort)} aria-label={T('sort')}>
                <option value="price-asc">{T('priceAsc')}</option>
                <option value="price-desc">{T('priceDesc')}</option>
                <option value="sqm-desc">{T('sqmDesc')}</option>
                <option value="area">{T('byArea')}</option>
              </select>
            </div>
          )}

          <label className="toolbar__group" style={{ cursor: 'pointer' }}>
            <input type="checkbox" checked={onlyAvailable} onChange={(e) => setOnlyAvailable(e.target.checked)}
                   style={{ accentColor: 'var(--accent)', width: 15, height: 15 }} />
            <span className="label">{T('onlyAvailable')}</span>
          </label>

          <span className="label toolbar__count num">
            {view === 'units' ? T('nApartments', { n: units.length }) : T('nProjects', { n: projects.length })}
          </span>
        </div>
      </div>

      {view === 'units' ? (
        units.length ? (
          <div className="grid">
            {units.map(({ unit, property }, i) => (
              <UnitCard key={`${property.slug}-${unit.id}`} unit={unit} property={property} priority={i < 3} lang={lang} />
            ))}
          </div>
        ) : (
          <Empty lang={lang} />
        )
      ) : projects.length ? (
        <div className="grid">{projects.map((p, i) => <PropertyCard key={p.slug} p={p} priority={i < 3} lang={lang} />)}</div>
      ) : (
        <Empty lang={lang} />
      )}
    </>
  )
}

function Empty({ lang }: { lang: Lang }) {
  const T = tr(lang)
  return (
    <p className="dim" style={{ padding: '56px 0' }}>
      {T('emptyLead')}{' '}
      <a className="num" style={{ borderBottom: '1px solid var(--line)' }} href={site.phoneHref}>{site.phone}</a>{' '}
      {T('emptyTail')}
    </p>
  )
}
