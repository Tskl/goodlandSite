'use client'

import { useEffect } from 'react'
import { usePathname } from 'next/navigation'

/**
 * Όταν ανοίγει μια σελίδα έργου με #διαμέρισμα (π.χ. από την κάρτα στο
 * «Προς πώληση»), πηγαίνει ΣΤΟ διαμέρισμα και το τονίζει για λίγο.
 * Το ξαναδοκιμάζει όσο φορτώνουν οι φωτογραφίες από πάνω (μετακινούν τη
 * σελίδα), εκτός αν ο επισκέπτης έχει ήδη αρχίσει να κυλάει μόνος του.
 */
export default function ScrollToHash() {
  const pathname = usePathname()

  useEffect(() => {
    let userMoved = false
    const stop = () => { userMoved = true }
    const timers: number[] = []

    function go(highlight: boolean) {
      const id = decodeURIComponent(window.location.hash.slice(1))
      if (!id) return
      const el = document.getElementById(id)
      if (!el) return
      el.scrollIntoView({ block: 'start', behavior: 'instant' as ScrollBehavior })
      if (highlight) {
        el.classList.add('is-target')
        timers.push(window.setTimeout(() => el.classList.remove('is-target'), 2600))
      }
    }

    function run() {
      userMoved = false
      go(true)
      for (const ms of [150, 500, 1200, 2500]) {
        timers.push(window.setTimeout(() => { if (!userMoved) go(false) }, ms))
      }
    }

    run()
    window.addEventListener('hashchange', run)
    window.addEventListener('wheel', stop, { passive: true })
    window.addEventListener('touchstart', stop, { passive: true })
    window.addEventListener('keydown', stop)
    return () => {
      timers.forEach((t) => window.clearTimeout(t))
      window.removeEventListener('hashchange', run)
      window.removeEventListener('wheel', stop)
      window.removeEventListener('touchstart', stop)
      window.removeEventListener('keydown', stop)
    }
  }, [pathname])

  return null
}
