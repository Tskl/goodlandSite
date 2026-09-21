import type { Metadata } from 'next'
import Page from '@/components/pages/Privacy'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('privacy', '/politiki-aporritou', 'en')

export default function Route() {
  return <Page lang="en" />
}
