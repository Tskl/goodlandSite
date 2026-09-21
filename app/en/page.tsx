import type { Metadata } from 'next'
import Page from '@/components/pages/Home'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('home', '/', 'en')

export default function Route() {
  return <Page lang="en" />
}
