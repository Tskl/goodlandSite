import Link from 'next/link'
import CardMedia from './CardMedia'
import type { Lang } from '@/lib/i18n'

/** Κάρτα με καρουζέλ — για ολοκληρωμένα έργα και διαμορφώσεις.
    Ίδια γλώσσα σχεδιασμού με τον κατάλογο, ίδια συμπεριφορά σε κάθε πλάτος. */
export default function MediaCard({
  href, title, meta, sub, images, badges = [], priority = false, lang = 'el',
}: {
  href: string; title: string; meta?: string; sub?: string
  images: string[]; badges?: string[]; priority?: boolean; lang?: Lang
}) {
  return (
    <article className="jc">
      <Link href={href} className="jc__link" aria-label={title}>
        <CardMedia images={images.slice(0, 8)} alt={title} badges={badges} priority={priority} lang={lang} />
      </Link>
      <div className="jc__body">
        <div className="jc__top">
          <Link href={href} className="jc__price jc__price--plain">{title}</Link>
          {meta && <span className="jc__state is-off">{meta}</span>}
        </div>
        {sub && <div className="jc__where">{sub}</div>}
      </div>
    </article>
  )
}
