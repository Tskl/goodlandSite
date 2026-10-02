import type { MetadataRoute } from 'next'
import { getContent } from '@/lib/content'

const BASE = 'https://www.goodland.gr'

/** Κάθε σελίδα δύο φορές: ελληνικά (το indexed URL) και αγγλικά κάτω από /en. */
function entry(path: string, priority: number, changeFrequency: 'weekly' | 'monthly') {
  const el = path === '/' ? '' : encodeURI(path)
  const en = `/en${el}`
  const languages = { el: `${BASE}${el || '/'}`, en: `${BASE}${en}` }
  return [
    { url: `${BASE}${el || '/'}`, lastModified: new Date(), changeFrequency, priority, alternates: { languages } },
    { url: `${BASE}${en}`, lastModified: new Date(), changeFrequency, priority: Math.max(0.1, priority - 0.2), alternates: { languages } },
  ]
}

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const { properties, areas, interiors } = await getContent()
  return [
    ...entry('/', 1, 'monthly'),
    ...entry('/pros-polisi', 0.9, 'weekly'),
    ...entry('/olokliromena-erga', 0.6, 'monthly'),
    ...entry('/projects', 0.6, 'monthly'),
    ...entry('/katalogos', 0.6, 'monthly'),
    ...entry('/contact', 0.6, 'monthly'),
    ...entry('/politiki-aporritou', 0.3, 'monthly'),
    ...properties.flatMap((x) => entry(`/${x.slug}`, 0.8, 'weekly')),
    ...[...areas, ...interiors].flatMap((x) => entry(`/${x.slug}`, 0.5, 'monthly')),
  ]
}
