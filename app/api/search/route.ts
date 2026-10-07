import { NextResponse } from 'next/server'
import { getContent } from '@/lib/content'
import { buildIndex } from '@/lib/search'

/* Το ευρετήριο αναζήτησης. Τα δεδομένα έρχονται από την ίδια cache με τις
   σελίδες (lib/content), άρα ό,τι αλλάζει στο admin φαίνεται και εδώ αμέσως. */
export const dynamic = 'force-dynamic'

export async function GET(req: Request) {
  const lang = new URL(req.url).searchParams.get('lang') === 'en' ? 'en' : 'el'
  const index = buildIndex(await getContent(), lang)
  return NextResponse.json(index, {
    headers: { 'Cache-Control': 'public, max-age=60, stale-while-revalidate=600' },
  })
}
