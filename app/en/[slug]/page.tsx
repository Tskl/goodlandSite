import type { Metadata } from 'next'
import { getContent } from '@/lib/content'
import Detail from '@/components/pages/Detail'
import { slugMeta } from '@/lib/meta'

type Params = { params: Promise<{ slug: string }> }

export async function generateStaticParams() {
  const { properties, areas, interiors } = await getContent()
  return [...properties, ...areas, ...interiors].map((x) => ({ slug: x.slug }))
}

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  return slugMeta((await params).slug, 'en')
}

export default async function Route({ params }: Params) {
  const slug = decodeURIComponent((await params).slug)
  return <Detail slug={slug} lang="en" />
}
