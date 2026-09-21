import type { Metadata } from 'next'
import Page from '@/components/pages/ContactPage'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('contact', '/contact', 'el')

export default function Route() {
  return <Page lang="el" />
}
