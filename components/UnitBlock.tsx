import type { Unit, Property } from '@/content/types'
import { site } from '@/content/site'
import { featuresOf, heatingOf, bathroomsOf, hasWc, pricePerSqm, formatPrice } from '@/lib/features'
import { energy } from '@/lib/greek'
import { plansOf, planLabel } from '@/lib/plans'
import type { Lang } from '@/lib/i18n'
import { t, tr, STATUS_KEY } from '@/lib/i18n'
import Plans from './Plans'

/** Ένα διαμέρισμα, μία ενότητα — με την κάτοψή του σε πλήρες πλάτος,
    όπως την έδειχνε και το παλιό site: αρκετά μεγάλη για να διαβάζεις
    τα δωμάτια και τις διαστάσεις χωρίς να κάνεις κλικ. */
export default function UnitBlock({
  unit: u, property: p, lang, n,
}: { unit: Unit; property: Property; lang: Lang; n: number }) {
  const T = tr(lang)
  const feats = featuresOf(u.description.el)
  const heat = heatingOf(u.description.el)
  const baths = bathroomsOf(u.description.el)
  const price = formatPrice(u.price, lang)
  const perSqm = pricePerSqm(u, lang)
  const plans = plansOf(p, u)
  const off = u.status !== 'available'

  const facts = [
    t(u.floor, lang),
    u.bedrooms != null ? `${u.bedrooms} ${T('bdShort')}` : null,
    baths != null ? `${baths}${hasWc(u.description.el) ? '+wc' : ''} ${T('baShort')}` : null,
  ].filter(Boolean) as string[]

  return (
    <article id={u.id} className={`ub ${off ? 'ub--off' : ''}`}>
      <header className="ub__head">
        <span className="ub__no num">{String(n).padStart(2, '0')}</span>
        <h3 className="ub__title">
          {t(u.type, lang)}{u.sqm ? ` ${u.sqm} ${T('sqmShort')}` : ''}
        </h3>
        <span className={`ub__state ${off ? 'is-off' : 'is-on'}`}>{T(STATUS_KEY[u.status])}</span>
      </header>

      <div className="ub__meta">
        <span className="ub__facts">{facts.join(' · ')}</span>
        <span className="ub__price">
          {price ?? <span className="dim">{T('onRequest')}</span>}
          {perSqm && <span className="ub__psqm num">{perSqm}</span>}
        </span>
      </div>

      {plans.length > 0 && (
        <Plans plans={plans} label={planLabel(u, plans.length, lang)} lang={lang} />
      )}

      <div className="ub__cols">
        <dl className="specs ub__specs">
          {u.sqm != null && (<><dt>{T('size')}</dt><dd>{u.sqm} {T('sqmShort')}</dd></>)}
          <><dt>{T('floor')}</dt><dd>{t(u.floor, lang)}</dd></>
          {u.bedrooms != null && (<><dt>{T('bedrooms')}</dt><dd>{u.bedrooms}</dd></>)}
          {baths != null && (<><dt>{T('baths')}</dt><dd>{baths}{hasWc(u.description.el) ? ' + wc' : ''}</dd></>)}
          {heat && (<><dt>{T('heating')}</dt><dd>{t(heat, lang)}</dd></>)}
          {p.energyClass && (<><dt>{T('energyClass')}</dt><dd>{energy(p.energyClass, lang)}</dd></>)}
        </dl>

        <div className="ub__side">
          {feats.length > 0 && (
            <ul className="feats ub__feats">
              {feats.map((f) => <li key={f.label.el}>{t(f.label, lang)}</li>)}
            </ul>
          )}
          <p className="ub__desc dim">{t(u.description, lang)}</p>
          {!off && (
            <p className="ub__cta">
              <a className="btn btn--text" href={site.phoneHref}>{T('askAbout')}</a>
            </p>
          )}
          {process.env.NODE_ENV !== 'production' && u.needsReview?.length ? (
            <p className="warn" lang="el">{T('toReview')} {u.needsReview.join(' · ')}</p>
          ) : null}
        </div>
      </div>
    </article>
  )
}
