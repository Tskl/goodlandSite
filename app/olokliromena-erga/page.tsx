import type { Metadata } from 'next'
import Page from '@/components/pages/Completed'
import { pageMeta } from '@/lib/meta'

export const metadata: Metadata = pageMeta('completed', '/olokliromena-erga', 'el')

export default function Route() {
  return <Page lang="el" />
}
