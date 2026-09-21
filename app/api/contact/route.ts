import { NextResponse } from 'next/server'
import { site } from '@/content/site'

/** Πολύ απλό rate limiting στη μνήμη: 3 μηνύματα ανά IP ανά 10 λεπτά. */
const hits = new Map<string, number[]>()
const WINDOW = 10 * 60 * 1000
const MAX = 3

function limited(ip: string) {
  const now = Date.now()
  const list = (hits.get(ip) ?? []).filter((t) => now - t < WINDOW)
  list.push(now)
  hits.set(ip, list)
  return list.length > MAX
}

/** Μηνύματα λάθους στη γλώσσα του επισκέπτη. */
const MSG = {
  tooMany: { el: 'Πολλά μηνύματα σε λίγη ώρα. Δοκιμάστε ξανά αργότερα.', en: 'Too many messages in a short time. Please try again later.' },
  badRequest: { el: 'Λάθος αίτημα.', en: 'Bad request.' },
  missing: { el: 'Συμπληρώστε όνομα, επώνυμο και τηλέφωνο.', en: 'Please fill in first name, last name and phone.' },
  consent: { el: 'Χρειάζεται η αποδοχή της πολιτικής απορρήτου.', en: 'You need to accept the privacy policy.' },
  notConfigured: { el: 'Η αποστολή δεν είναι ρυθμισμένη ακόμα. Παρακαλούμε καλέστε μας.', en: 'Sending is not configured yet. Please call us.' },
  failed: { el: 'Η αποστολή απέτυχε. Παρακαλούμε καλέστε μας.', en: 'Sending failed. Please call us.' },
} as const

const say = (k: keyof typeof MSG, lang: string) => (lang === 'en' ? MSG[k].en : MSG[k].el)

export async function POST(req: Request) {
  const body = await req.json().catch(() => null)
  const lang = body?.lang === 'en' ? 'en' : 'el'

  const ip = req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() || 'unknown'
  if (limited(ip)) {
    return NextResponse.json({ error: say('tooMany', lang) }, { status: 429 })
  }

  if (!body) return NextResponse.json({ error: say('badRequest', lang) }, { status: 400 })

  const { firstName, lastName, phone, email, message, consent, website, about } = body

  // honeypot: τα bots το συμπληρώνουν, οι άνθρωποι δεν το βλέπουν καν
  if (website) return NextResponse.json({ ok: true })

  if (!firstName || !lastName || !phone) {
    return NextResponse.json({ error: say('missing', lang) }, { status: 400 })
  }
  if (consent !== 'yes') {
    return NextResponse.json({ error: say('consent', lang) }, { status: 400 })
  }

  const subject = about ? `Ενδιαφέρον: ${about}` : 'Μήνυμα από το goodland.gr'
  const text = [
    `Όνομα:     ${firstName} ${lastName}`,
    `Τηλέφωνο:  ${phone}`,
    `Email:     ${email || '—'}`,
    about ? `Ακίνητο:   ${about}` : null,
    lang === 'en' ? 'Γλώσσα:    αγγλικά (ο πελάτης έγραψε από το /en)' : null,
    '',
    message || '(χωρίς μήνυμα)',
    '',
    `— στάλθηκε από το goodland.gr, ${new Date().toLocaleString('el-GR')}`,
  ].filter(Boolean).join('\n')

  const key = process.env.RESEND_API_KEY
  if (!key) {
    console.warn('[contact] Λείπει το RESEND_API_KEY — το μήνυμα ΔΕΝ στάλθηκε:\n' + text)
    return NextResponse.json(
      { error: say('notConfigured', lang) },
      { status: 500 },
    )
  }

  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: { Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({
      from: process.env.CONTACT_FROM || 'Goodland <onboarding@resend.dev>',
      to: [site.email],
      reply_to: email || undefined,
      subject,
      text,
    }),
  })

  if (!res.ok) {
    console.error('[contact] Resend error', res.status, await res.text())
    return NextResponse.json({ error: say('failed', lang) }, { status: 502 })
  }

  return NextResponse.json({ ok: true })
}
