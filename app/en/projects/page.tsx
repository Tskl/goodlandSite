import type { Metadata } from 'next'
import Page from '@/components/pages/Interiors'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('interiors', '/projects', 'en')

export default function Route() {
  return <Page lang="en" />
}
