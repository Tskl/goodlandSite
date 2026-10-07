import { db } from '@/lib/db'
import { requireAdmin } from '@/lib/admin/auth'
import { toggleHandledAction } from '@/lib/admin/actions'
import { AdminBar } from '@/components/admin/ui'
import { Submit } from '@/components/admin/client'

/** Ό,τι ήρθε από τη φόρμα επικοινωνίας — το «Inbox» που είχε το Wix. */
export default async function Messages() {
  const admin = await requireAdmin()
  const { rows } = await db().query(`
    SELECT i.*, a.display_name AS handler,
           to_char(i.created_at AT TIME ZONE 'Europe/Athens', 'DD/MM/YYYY HH24:MI') AS at,
           to_char(i.handled_at AT TIME ZONE 'Europe/Athens', 'DD/MM HH24:MI') AS handled_at_s
    FROM site.inquiries i LEFT JOIN site.admins a ON a.id = i.handled_by
    ORDER BY i.handled, i.created_at DESC LIMIT 300`)
  const open = rows.filter((r) => !r.handled).length

  return (
    <>
      <AdminBar admin={admin} />
      <main className="adm-main">
        <div className="adm-head">
          <h1>Μηνύματα</h1>
          <span className="adm-dim">{open ? `${open} χωρίς απάντηση` : 'Όλα απαντημένα'}</span>
        </div>
        {rows.length === 0 && <p className="adm-dim">Δεν έχει έρθει κανένα μήνυμα ακόμα.</p>}
        <div className="adm-msgs">
          {rows.map((m) => (
            <article key={m.id} id={`m${m.id}`} className={`adm-msg ${m.handled ? 'is-done' : ''}`}>
              <header>
                <b>{m.first_name} {m.last_name}</b>
                <span className="adm-dim">{m.at}</span>
                {m.lang === 'en' && <span className="adm-tag">EN</span>}
                {!m.mailed_office && <span className="adm-tag" title="Το email προς το γραφείο δεν στάλθηκε — το μήνυμα υπάρχει μόνο εδώ">χωρίς email</span>}
              </header>
              {m.about && (
                <p className="adm-msg__about">
                  Για: {m.property_slug ? <a href={`/${m.property_slug}`} target="_blank" rel="noopener">{m.about} ↗</a> : m.about}
                </p>
              )}
              <p className="adm-msg__contact">
                <a href={`tel:${String(m.phone).replace(/[^\d+]/g, '')}`}>{m.phone}</a>
                {m.email && <> · <a href={`mailto:${m.email}`}>{m.email}</a></>}
                {m.email && <span className="adm-dim"> · {m.mailed_customer ? 'πήρε επιβεβαίωση' : 'δεν πήρε επιβεβαίωση'}</span>}
              </p>
              {m.message && <p className="adm-msg__text">{m.message}</p>}
              <form action={toggleHandledAction} className="adm-msg__foot">
                <input type="hidden" name="id" value={m.id} />
                {m.handled && <span className="adm-dim">✓ {m.handler ?? ''} {m.handled_at_s}</span>}
                <Submit className={`adm-btn adm-btn--sm ${m.handled ? 'adm-btn--ghost' : ''}`}>
                  {m.handled ? 'Ξανά ανοιχτό' : 'Απαντήθηκε ✓'}
                </Submit>
              </form>
            </article>
          ))}
        </div>
      </main>
    </>
  )
}
