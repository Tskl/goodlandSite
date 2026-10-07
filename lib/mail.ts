import nodemailer from 'nodemailer'
import { site } from '@/content/site'

/**
 * Αποστολή email μέσω Gmail (goolanltd@gmail.com) — χωρίς τρίτη υπηρεσία.
 *   SMTP_USER  = goolanltd@gmail.com
 *   SMTP_PASS  = «Κωδικός εφαρμογής» 16 χαρακτήρων από τον λογαριασμό Google
 *   (προαιρετικά SMTP_HOST / SMTP_PORT για άλλον πάροχο αργότερα)
 */
export function mailConfigured(): boolean {
  return !!(process.env.SMTP_USER && process.env.SMTP_PASS)
}

// Ο τύπος βγαίνει από την ίδια τη συνάρτηση — δουλεύει με όποια έκδοση τύπων του nodemailer.
type Transport = ReturnType<typeof nodemailer.createTransport>
let transport: Transport | null = null
function tx(): Transport {
  if (!transport) {
    const port = Number(process.env.SMTP_PORT || 465)
    transport = nodemailer.createTransport({
      host: process.env.SMTP_HOST || 'smtp.gmail.com',
      port,
      secure: port === 465,
      auth: { user: process.env.SMTP_USER, pass: (process.env.SMTP_PASS || '').replace(/\s+/g, '') },
    })
  }
  return transport
}

export async function sendMail(m: { to: string; subject: string; html: string; text: string; replyTo?: string }) {
  await tx().sendMail({
    from: { name: 'Εύγειος Goodland', address: process.env.SMTP_USER as string },
    to: m.to,
    replyTo: m.replyTo,
    subject: m.subject,
    html: m.html,
    text: m.text,
  })
}

// ── Πρότυπα ─────────────────────────────────────────────────────────
const esc = (s: string) =>
  s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
const nl2br = (s: string) => esc(s).replace(/\n/g, '<br>')

export type Inquiry = {
  id?: number
  lang: 'el' | 'en'
  firstName: string
  lastName: string
  phone: string
  email?: string
  message?: string
  about?: string
  url?: string
}

/* Τα τέσσερα τετράγωνα του λογοτύπου ως πίνακας — φαίνονται σε κάθε
   πρόγραμμα email, χωρίς εικόνες που μπλοκάρονται. */
const MARK = `
<table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;border-spacing:3px"><tr>
<td style="width:14px;height:12px;background:#5972E5"></td><td style="width:14px;height:12px;background:#DE302D"></td></tr><tr>
<td style="width:14px;height:12px;background:#F7E24F"></td><td style="width:14px;height:12px;background:#D9D9D9"></td></tr></table>`

function frame(inner: string, lang: 'el' | 'en') {
  const addr = lang === 'en' ? site.address.en : site.address.el
  return `<!doctype html><html lang="${lang}"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width"></head>
<body style="margin:0;padding:0;background:#F1EADB">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="background:#F1EADB"><tr><td align="center" style="padding:28px 12px">
<table role="presentation" width="100%" cellpadding="0" cellspacing="0" style="max-width:560px;background:#FAF6EC;border:1px solid #DCD7CC;font-family:Segoe UI,Helvetica,Arial,sans-serif;color:#16150F">
<tr><td style="padding:24px 28px 8px">
  <table role="presentation" cellpadding="0" cellspacing="0"><tr>
    <td style="vertical-align:middle">${MARK}</td>
    <td style="vertical-align:middle;padding-left:10px;font-size:15px;font-weight:700;letter-spacing:.12em;color:#16150F">ΕΥΓΕΙΟΣ</td>
  </tr></table>
</td></tr>
<tr><td style="padding:8px 28px 24px;font-size:15px;line-height:1.6">${inner}</td></tr>
<tr><td style="padding:16px 28px 22px;border-top:1px solid #DCD7CC;font-size:12.5px;line-height:1.6;color:#4A463E">
  <b style="color:#16150F">${esc(site.name)}</b><br>
  ${esc(addr ?? '')} · <a href="${site.phoneHref}" style="color:#16150F">${site.phone}</a> ·
  <a href="https://www.goodland.gr" style="color:#16150F">goodland.gr</a>
</td></tr>
</table></td></tr></table></body></html>`
}

const row = (k: string, v?: string) =>
  v ? `<tr><td style="padding:6px 12px 6px 0;color:#5E5A51;font-size:13px;white-space:nowrap;vertical-align:top">${esc(k)}</td><td style="padding:6px 0;font-size:14px">${nl2br(v)}</td></tr>` : ''

/** Email προς το γραφείο. */
export function officeMail(q: Inquiry) {
  const name = `${q.firstName} ${q.lastName}`
  const subject = q.about ? `Ενδιαφέρον για ${q.about} — ${name}` : `Νέο μήνυμα από το site — ${name}`
  const html = frame(`
    <h1 style="font-size:19px;margin:6px 0 4px">${q.about ? 'Νέο αίτημα ενδιαφέροντος' : 'Νέο μήνυμα από το site'}</h1>
    ${q.about ? `<p style="margin:0 0 14px;color:#4A463E">για <b style="color:#16150F">${esc(q.about)}</b>${q.url ? ` · <a href="${esc(q.url)}" style="color:#4B66E3">σελίδα</a>` : ''}</p>` : ''}
    <table role="presentation" cellpadding="0" cellspacing="0" style="margin:10px 0 16px">
      ${row('Όνομα', name)}
      ${row('Τηλέφωνο', q.phone)}
      ${row('Email', q.email || '—')}
      ${row('Γλώσσα', q.lang === 'en' ? 'Αγγλικά (έγραψε από το /en)' : undefined)}
    </table>
    ${q.message ? `<div style="padding:14px 16px;background:#F1EADB;border-left:3px solid #F7E24F;margin:0 0 18px">${nl2br(q.message)}</div>` : ''}
    <a href="tel:${esc(q.phone.replace(/[^\d+]/g, ''))}" style="display:inline-block;background:#1B1A16;color:#FAF6EC;text-decoration:none;padding:11px 18px;font-weight:600;font-size:14px">Κλήση ${esc(q.phone)}</a>
    ${q.email ? `<p style="margin:14px 0 0;font-size:13px;color:#5E5A51">Αν απαντήσεις σε αυτό το email, η απάντηση πηγαίνει κατευθείαν στον πελάτη.</p>` : ''}
    ${q.id ? `<p style="margin:8px 0 0;font-size:12px;color:#5E5A51">Μήνυμα #${q.id} · φαίνεται και στο admin → Μηνύματα</p>` : ''}
  `, 'el')
  const text = [
    q.about ? `Νέο αίτημα ενδιαφέροντος για ${q.about}` : 'Νέο μήνυμα από το site',
    q.url ?? '', '',
    `Όνομα:    ${name}`, `Τηλέφωνο: ${q.phone}`, `Email:    ${q.email || '—'}`,
    q.lang === 'en' ? 'Γλώσσα:   αγγλικά' : '', '', q.message || '(χωρίς μήνυμα)',
  ].filter((x) => x !== null).join('\n')
  return { subject, html, text }
}

/** Email επιβεβαίωσης προς τον πελάτη, στη γλώσσα του. */
export function customerMail(q: Inquiry) {
  const en = q.lang === 'en'
  const subject = en
    ? (q.about ? `We received your enquiry about ${q.about}` : 'We received your message')
    : (q.about ? `Λάβαμε το αίτημά σας για ${q.about}` : 'Λάβαμε το μήνυμά σας')
  // Ελληνικά: χωρίς όνομα — η κλητική («Γιάννη», όχι «Γιάννης») δεν βγαίνει σωστά αυτόματα.
  const hi = en ? `Dear ${esc(q.firstName)},` : 'Γεια σας,'
  const body = en
    ? `<p>Thank you for contacting us. We have received your ${q.about ? `enquiry about <b>${esc(q.about)}</b>` : 'message'}
       and a member of our team will call you on <b>${esc(q.phone)}</b>, usually within one working day.</p>
       <p>If it's urgent, you can reach us directly on <a href="${site.phoneHref}" style="color:#16150F;font-weight:600">${site.phone}</a>.</p>`
    : `<p>Σας ευχαριστούμε που επικοινωνήσατε μαζί μας. Λάβαμε ${q.about ? `το αίτημα ενδιαφέροντός σας για <b>${esc(q.about)}</b>` : 'το μήνυμά σας'}
       και θα σας καλέσουμε στο <b>${esc(q.phone)}</b>, συνήθως μέσα σε μία εργάσιμη ημέρα.</p>
       <p>Αν είναι επείγον, μπορείτε να μας καλέσετε απευθείας στο <a href="${site.phoneHref}" style="color:#16150F;font-weight:600">${site.phone}</a>.</p>`
  const recap = q.message
    ? `<p style="margin:18px 0 6px;font-size:13px;color:#5E5A51">${en ? 'Your message' : 'Το μήνυμά σας'}</p>
       <div style="padding:14px 16px;background:#F1EADB;border-left:3px solid #F7E24F">${nl2br(q.message)}</div>`
    : ''
  const cta = q.url
    ? `<p style="margin:20px 0 0"><a href="${esc(q.url)}" style="display:inline-block;background:#1B1A16;color:#FAF6EC;text-decoration:none;padding:11px 18px;font-weight:600;font-size:14px">${en ? 'See the property again' : 'Δείτε ξανά το ακίνητο'}</a></p>`
    : ''
  const html = frame(`
    <h1 style="font-size:19px;margin:6px 0 14px">${en ? 'We received your message' : 'Λάβαμε το μήνυμά σας'}</h1>
    <p>${hi}</p>${body}${recap}${cta}
    <p style="margin:22px 0 0">${en ? 'Kind regards,' : 'Με εκτίμηση,'}<br><b>${en ? 'The Goodland team' : 'Η ομάδα της Εύγειος Goodland'}</b></p>
    <p style="margin:18px 0 0;font-size:12px;color:#5E5A51">${en
      ? 'You are receiving this because you filled in the contact form on goodland.gr. We will not send you marketing emails.'
      : 'Λαμβάνετε αυτό το email επειδή συμπληρώσατε τη φόρμα επικοινωνίας στο goodland.gr. Δεν θα σας στείλουμε διαφημιστικά μηνύματα.'}</p>
  `, q.lang)
  const text = en
    ? `Dear ${q.firstName},\n\nThank you for contacting us. We have received your ${q.about ? `enquiry about ${q.about}` : 'message'} and will call you on ${q.phone}, usually within one working day.\nUrgent? Call us on ${site.phone}.\n\nKind regards,\nThe Goodland team\n${q.url ?? 'https://www.goodland.gr'}`
    : `Γεια σας,\n\nΣας ευχαριστούμε που επικοινωνήσατε μαζί μας. Λάβαμε ${q.about ? `το αίτημα ενδιαφέροντός σας για ${q.about}` : 'το μήνυμά σας'} και θα σας καλέσουμε στο ${q.phone}, συνήθως μέσα σε μία εργάσιμη ημέρα.\nΑν είναι επείγον: ${site.phone}.\n\nΜε εκτίμηση,\nΗ ομάδα της Εύγειος Goodland\n${q.url ?? 'https://www.goodland.gr'}`
  return { subject, html, text }
}
