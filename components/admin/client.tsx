'use client'

import { useState } from 'react'
import { useFormStatus } from 'react-dom'
import { useRouter } from 'next/navigation'

/** Κουμπί υποβολής που γράφει «…» όσο σώζει, ώστε να μην πατηθεί δύο φορές. */
export function Submit({ children, className = 'adm-btn', confirm: ask, name, value }: {
  children: React.ReactNode; className?: string; confirm?: string; name?: string; value?: string
}) {
  const { pending } = useFormStatus()
  return (
    <button
      type="submit"
      className={className}
      disabled={pending}
      name={name}
      value={value}
      onClick={(e) => { if (ask && !window.confirm(ask)) e.preventDefault() }}
    >
      {pending ? '…' : children}
    </button>
  )
}

/** Επιλογή περιοχής, με «+ Νέα περιοχή» που ανοίγει τρία πεδία. */
export function AreaPicker({ areas, value }: { areas: { id: number; name_el: string }[]; value?: number }) {
  const [sel, setSel] = useState<string>(value ? String(value) : areas[0] ? String(areas[0].id) : 'new')
  return (
    <>
      <label className="adm-field">
        <span className="adm-field__label">Περιοχή</span>
        <select name="area_id" value={sel} onChange={(e) => setSel(e.target.value)}>
          {areas.map((a) => <option key={a.id} value={a.id}>{a.name_el}</option>)}
          <option value="new">+ Νέα περιοχή…</option>
        </select>
      </label>
      {sel === 'new' && (
        <div className="adm-sub">
          <label className="adm-field"><span className="adm-field__label">Όνομα περιοχής</span>
            <input name="new_area_el" placeholder="Γλυφάδα" required /></label>
          <label className="adm-field"><span className="adm-field__label">Στα αγγλικά</span>
            <input name="new_area_en" placeholder="Glyfada" required /></label>
          <label className="adm-field"><span className="adm-field__label">Με άρθρο</span>
            <input name="new_area_in" placeholder="στη Γλυφάδα" required />
            <span className="adm-field__hint">Όπως στη φράση «Διαμέρισμα <b>στη Γλυφάδα</b>». Το site το γράφει έτσι παντού.</span></label>
        </div>
      )}
    </>
  )
}

/* ── Ανέβασμα εικόνων ──────────────────────────────────────────────
   Ο browser μικραίνει κάθε εικόνα (μεγάλη πλευρά ≤ 2000px, JPEG < ~1MB)
   ΠΡΙΝ το ανέβασμα: γρήγορο από κινητό, και ποτέ πάνω από τα όρια του server. */
const MAX_SIDE = 2000
const MAX_BYTES = 950 * 1024

async function shrink(file: File): Promise<{ blob: Blob; w: number; h: number }> {
  const bmp = await createImageBitmap(file)
  let scale = Math.min(1, MAX_SIDE / Math.max(bmp.width, bmp.height))
  let q = 0.86
  for (let i = 0; i < 8; i++) {
    const w = Math.round(bmp.width * scale), h = Math.round(bmp.height * scale)
    const c = document.createElement('canvas')
    c.width = w; c.height = h
    const ctx = c.getContext('2d')!
    ctx.fillStyle = '#fff'; ctx.fillRect(0, 0, w, h) // διάφανα PNG κατόψεων → λευκό φόντο
    ctx.drawImage(bmp, 0, 0, w, h)
    const blob = await new Promise<Blob>((res, rej) => c.toBlob((b) => (b ? res(b) : rej(new Error('Η εικόνα δεν διαβάστηκε.'))), 'image/jpeg', q))
    if (blob.size <= MAX_BYTES) return { blob, w, h }
    if (q > 0.7) q -= 0.08
    else scale *= 0.85
  }
  throw new Error('Η εικόνα δεν μίκρυνε αρκετά.')
}

type Item = { name: string; state: 'wait' | 'up' | 'ok' | 'err'; msg?: string }

export function Uploader({ propertyId, kind, action }: {
  propertyId: number
  kind: 'photo' | 'plan'
  action: (fd: FormData) => Promise<{ ok: boolean; error?: string }>
}) {
  const router = useRouter()
  const [items, setItems] = useState<Item[]>([])
  const [busy, setBusy] = useState(false)
  const [code, setCode] = useState('')
  const [floor, setFloor] = useState('')

  async function onFiles(files: FileList | null) {
    if (!files?.length) return
    if (kind === 'plan' && (!code.trim() || !floor.trim())) {
      setItems([{ name: '—', state: 'err', msg: 'Συμπλήρωσε πρώτα κωδικό και όροφο της κάτοψης.' }])
      return
    }
    const list = Array.from(files)
    setBusy(true)
    setItems(list.map((f) => ({ name: f.name, state: 'wait' })))
    for (let i = 0; i < list.length; i++) {
      const set = (p: Partial<Item>) => setItems((xs) => xs.map((x, j) => (j === i ? { ...x, ...p } : x)))
      set({ state: 'up' })
      try {
        const { blob, w, h } = await shrink(list[i])
        const fd = new FormData()
        fd.set('property_id', String(propertyId))
        fd.set('kind', kind)
        fd.set('file', blob, 'image.jpg')
        fd.set('width', String(w))
        fd.set('height', String(h))
        if (kind === 'plan') { fd.set('plan_code', code.trim()); fd.set('plan_floor', floor.trim()) }
        const r = await action(fd)
        set(r.ok ? { state: 'ok' } : { state: 'err', msg: r.error })
      } catch (e) {
        set({ state: 'err', msg: e instanceof Error ? e.message : 'Σφάλμα' })
      }
    }
    setBusy(false)
    if (kind === 'plan') setCode('')
    router.refresh()
  }

  return (
    <div className="adm-upload">
      {kind === 'plan' && (
        <div className="adm-row">
          <label className="adm-field"><span className="adm-field__label">Κωδικός κάτοψης</span>
            <input value={code} onChange={(e) => setCode(e.target.value)} placeholder="Α1" /></label>
          <label className="adm-field"><span className="adm-field__label">Όροφος</span>
            <input value={floor} onChange={(e) => setFloor(e.target.value)} placeholder="1 ή Ισόγειο" /></label>
        </div>
      )}
      <label className={`adm-drop ${busy ? 'is-busy' : ''}`}>
        <input
          type="file"
          accept="image/*"
          multiple={kind === 'photo'}
          disabled={busy}
          onChange={(e) => { onFiles(e.target.files); e.target.value = '' }}
        />
        <span>{busy ? 'Ανεβαίνει…' : kind === 'photo' ? '+ Πρόσθεσε φωτογραφίες (μπορείς πολλές μαζί)' : '+ Ανέβασε την κάτοψη'}</span>
      </label>
      {items.length > 0 && (
        <ul className="adm-uplist">
          {items.map((x, i) => (
            <li key={i} className={`is-${x.state}`}>
              {x.state === 'ok' ? '✓' : x.state === 'err' ? '✕' : x.state === 'up' ? '↑' : '·'} {x.name}
              {x.msg && <span> — {x.msg}</span>}
            </li>
          ))}
        </ul>
      )}
    </div>
  )
}
