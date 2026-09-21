import type { Metadata } from 'next'
import Page from '@/components/pages/Catalogue'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('forSale', '/pros-polisi', 'el')

export default function Route() {
  return <Page lang="el" />
}
