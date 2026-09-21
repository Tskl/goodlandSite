'use client'

import { useState } from 'react'
import type { Property } from '@/content/types'
import PropertyCard from './PropertyCard'

export default function AreaFilter({ properties }: { properties: Property[] }) {
  const areas = [...new Set(properties.map((p) => p.area.el))].sort((a, b) => a.localeCompare(b, 'el'))
  const [area, setArea] = useState<string | null>(null)
  const [onlyAvailable, setOnlyAvailable] = useState(false)

  const shown = properties.filter((p) => {
    if (area && p.area.el !== area) return false
    if (onlyAvailable && !p.units.some((u) => u.status === 'available')) return false
    return true
  })

  return (
    <>
      <div className="filters">
        <button className={`chip ${!area ? 'chip--on' : ''}`} onClick={() => setArea(null)}>
          Όλες οι περιοχές
        </button>
        {areas.map((a) => (
          <button key={a} className={`chip ${area === a ? 'chip--on' : ''}`} onClick={() => setArea(a)}>
            {a}
          </button>
        ))}
        <button className={`chip ${onlyAvailable ? 'chip--on' : ''}`}
                onClick={() => setOnlyAvailable((v) => !v)}>
          Μόνο διαθέσιμα
        </button>
      </div>

      <p className="muted mono" style={{ marginTop: 16 }}>
        {shown.length} από {properties.length}
      </p>

      <div className="grid">
        {shown.map((p) => <PropertyCard key={p.slug} p={p} />)}
      </div>

      {shown.length === 0 && (
        <p className="muted">Δεν υπάρχει διαθέσιμο ακίνητο με αυτά τα κριτήρια. Καλέστε μας — ίσως έχουμε κάτι που δεν έχει ανέβει ακόμα.</p>
      )}
    </>
  )
}
