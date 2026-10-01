import fs from 'fs'
let src = fs.readFileSync('content/properties.ts','utf8')
src = src.replace(/^import[^\n]*\n/m,'').replace('export const properties: Property[] =','globalThis.__P =')
const props = new Function(src + '\nreturn globalThis.__P')()
let issues = []
for (const p of props) {
  const byCode = new Map((p.plans||[]).map(x=>[x.code,x]))
  const used = new Set(), units = (p.units||[]).filter(Boolean)
  for (const u of units) {
    const pinned = u.plan || []
    if (pinned.length) for (const c of pinned) {
      const pl = byCode.get(c)
      if (!pl) { issues.push(`${p.slug}/${u.id}: κωδικός «${c}» δεν υπάρχει`); continue }
      used.add(c)
      if (u.floors?.length && !u.floors.includes(pl.floor))
        issues.push(`${p.slug}/${u.id}: «${c}» είναι ${pl.floor}ος, το διαμέρισμα ${JSON.stringify(u.floors)}`)
    } else {
      const m = (p.plans||[]).filter(x=>(u.floors||[]).includes(x.floor))
      if (!m.length) issues.push(`${p.slug}/${u.id}: καμία κάτοψη`)
      else m.forEach(x=>used.add(x.code))
    }
  }
  const c = {}; units.forEach(u=>(u.plan||[]).forEach(x=>c[x]=(c[x]||0)+1))
  Object.entries(c).forEach(([k,n])=>{ if(n>1) issues.push(`${p.slug}: «${k}» σε ${n} διαμερίσματα`) })
  const un = (p.plans||[]).map(x=>x.code).filter(x=>!used.has(x))
  if (un.length) issues.push(`${p.slug}: αχρησιμοποίητες: ${un.join(', ')}`)
}
console.log(issues.length ? issues.join('\n') : 'καθαρό')
// extra summary
for (const p of props){const us=(p.units||[]).filter(Boolean);const st={};us.forEach(u=>{st[u.status]=(st[u.status]||0)+1});console.log('#',p.slug,us.length,JSON.stringify(st))}
