import { NextResponse } from 'next/server'
import { site } from '@/content/site'
import { db, hasDb } from '@/lib/db'
import { customerMail, mailConfigured, officeMail, sendMail, type Inquiry } from '@/lib/mail'

/**
 * Φόρμα επικοινωνίας:
 *   1. αποθήκευση στη βάση (site.inquiries) — ποτέ δεν χάνεται μήνυμα
 *   2. email στο γραφείο (απάντηση → πηγαίνει στον πελάτη)
 *   3. email επιβεβαίωσης στον πελάτη, αν έδωσε email, στη γλώσσα του
 * Ο πελάτης βλέπει «στάλθηκε» αν πέτυχε έστω το 1 ή το 2.
 */

/** Απλό rate limiting στη μνήμη: 3 μηνύματα ανά IP ανά 10 λεπτά. */
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

const MSG = {
  tooMany: { el: 'Πολλά μηνύματα σε λίγη ώρα. Δοκιμάστε ξανά αργότερα.', en: 'Too many messages in a short time. Please try again later.' },
  badRequest: { el: 'Λάθος αίτημα.', en: 'Bad request.' },
  missing: { el: 'Συμπληρώστε όνομα, επώνυμο και τηλέφωνο.', en: 'Please fill in first name, last name and phone.' },
  badEmail: { el: 'Το email δεν φαίνεται σωστό.', en: 'That email address does not look right.' },
  consent: { el: 'Χρειάζεται η αποδοχή της πολιτικής απορρήτου.', en: 'You need to accept the privacy policy.' },
  failed: { el: `Η αποστολή απέτυχε. Παρακαλούμε καλέστε μας στο ${site.phone}.`, en: `Sending failed. Please call us on ${site.phone}.` },
} as const

const say = (k: keyof typeof MSG, lang: string) => (lang === 'en' ? MSG[k].en : MSG[k].el)
const clip = (v: unknown, n: number) => (typeof v === 'string' ? v.trim().slice(0, n) : '')

export async function POST(req: Request) {
  const body = await req.json().catch(() => null)
  const lang: 'el' | 'en' = body?.lang === 'en' ? 'en' : 'el'

  const ip = req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() || 'unknown'
  if (limited(ip)) return NextResponse.json({ error: say('tooMany', lang) }, { status: 429 })
  if (!body) return NextResponse.json({ error: say('badRequest', lang) }, { status: 400 })

  // honeypot: τα bots το συμπληρώνουν, οι άνθρωποι δεν το βλέπουν καν
  if (body.website) return NextResponse.json({ ok: true })

  const q: Inquiry = {
    lang,
    firstName: clip(body.firstName, 80),
    lastName: clip(body.lastName, 80),
    phone: clip(body.phone, 40),
    email: clip(body.email, 160) || undefined,
    message: clip(body.message, 5000) || undefined,
    about: clip(body.about, 200) || undefined,
  }
  const slug = clip(body.slug, 160)

  if (!q.firstName || !q.lastName || !q.phone) return NextResponse.json({ error: say('missing', lang) }, { status: 400 })
  if (q.email && !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(q.email)) return NextResponse.json({ error: say('badEmail', lang) }, { status: 400 })
  if (body.consent !== 'yes') return NextResponse.json({ error: say('consent', lang) }, { status: 400 })

  if (slug) {
    const origin = new URL(req.url).origin
    q.url = `${origin}${lang === 'en' ? '/en' : ''}/${encodeURI(slug)}`
  }

  // 1. Βάση
  let saved = false
  if (hasDb()) {
    try {
      const r = await db().query(
        `INSERT INTO site.inquiries (lang, first_name, last_name, phone, email, message, about, property_slug)
         VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING id`,
        [q.lang, q.firstName, q.lastName, q.phone, q.email ?? null, q.message ?? null, q.about ?? null, slug || null],
      )
      q.id = Number(r.rows[0].id)
      saved = true
    } catch (e) {
      console.error('[contact] αποθήκευση απέτυχε', e)
    }
  }

  // 2. & 3. Email
  let office = false
  let customer = false
  if (mailConfigured()) {
    try {
      const m = officeMail(q)
      await sendMail({ to: site.inbox, replyTo: q.email, ...m })
      office = true
    } catch (e) {
      console.error('[contact] email γραφείου απέτυχε', e)
    }
    if (q.email) {
      try {
        const m = customerMail(q)
        await sendMail({ to: q.email, replyTo: site.inbox, ...m })
        customer = true
      } catch (e) {
        console.error('[contact] email πελάτη απέτυχε', e)
      }
    }
  } else {
    console.warn('[contact] Λείπουν SMTP_USER / SMTP_PASS — δεν στάλθηκε email.', q)
  }

  if (saved && q.id) {
    await db().query('UPDATE site.inquiries SET mailed_office = $2, mailed_customer = $3 WHERE id = $1', [q.id, office, customer]).catch(() => {})
  }

  if (!saved && !office) return NextResponse.json({ error: say('failed', lang) }, { status: 502 })
  return NextResponse.json({ ok: true, confirmation: customer })
}
