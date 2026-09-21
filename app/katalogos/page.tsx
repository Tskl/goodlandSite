import type { Metadata } from 'next'
import Page from '@/components/pages/Services'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('services', '/katalogos', 'el')

export default function Route() {
  return <Page lang="el" />
}
