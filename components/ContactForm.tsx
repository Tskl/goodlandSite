'use client'

import { useState } from 'react'
import Link from 'next/link'
import type { Lang } from '@/lib/i18n'
import { href, tr } from '@/lib/i18n'

type State = 'idle' | 'sending' | 'ok' | 'error'

export default function ContactForm({ about, lang = 'el' }: { about?: string; lang?: Lang }) {
  const T = tr(lang)
  const [state, setState] = useState<State>('idle')
  const [error, setError] = useState('')

  async function onSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault()
    setState('sending')
    setError('')
    const data = Object.fromEntries(new FormData(e.currentTarget))
    try {
      const res = await fetch('/api/contact', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...data, about, lang }),
      })
      const json = await res.json()
      if (!res.ok) throw new Error(json.error || T('somethingWrong'))
      setState('ok')
    } catch (err) {
      setState('error')
      setError(err instanceof Error ? err.message : T('somethingWrong'))
    }
  }

  if (state === 'ok') {
    return (
      <div className="form__ok">
        <h3>{T('sentTitle')}</h3>
        <p className="dim" style={{ marginBottom: 0 }}>{T('sentBody')}</p>
      </div>
    )
  }

  return (
    <form className="form" onSubmit={onSubmit}>
      {about && <p className="label">{T('interestedIn')} <strong>{about}</strong></p>}

      <div className="form__row">
        <label className="field">
          <span>{T('firstName')} <em>*</em></span>
          <input name="firstName" type="text" required autoComplete="given-name" />
        </label>
        <label className="field">
          <span>{T('lastName')} <em>*</em></span>
          <input name="lastName" type="text" required autoComplete="family-name" />
        </label>
      </div>

      <div className="form__row">
        <label className="field">
          <span>{T('phone')} <em>*</em></span>
          <input name="phone" type="tel" required inputMode="tel" autoComplete="tel"
                 pattern="[0-9+\s()\-]{10,}" title={T('tenDigits')} />
        </label>
        <label className="field">
          <span>{T('email')}</span>
          <input name="email" type="email" autoComplete="email" />
        </label>
      </div>

      <label className="field">
        <span>{T('message')}</span>
        <textarea name="message" rows={5} />
      </label>

      {/* παγίδα για bots — αόρατο στους ανθρώπους, χωρίς captcha */}
      <div className="hp" aria-hidden="true">
        <label>{T('hpLabel')}
          <input name="website" type="text" tabIndex={-1} autoComplete="off" />
        </label>
      </div>

      <label className="check">
        <input name="consent" type="checkbox" required value="yes" />
        <span>
          {T('consentPre')} <Link href={href('/politiki-aporritou', lang)}>{T('privacy')}</Link>{' '}
          {T('consentPost')} <em>*</em>
        </span>
      </label>

      <button className="btn" type="submit" disabled={state === 'sending'}>
        {state === 'sending' ? T('sending') : T('submit')}
      </button>

      {state === 'error' && <p style={{ color: 'var(--red)', marginTop: 12 }}>{error}</p>}
    </form>
  )
}
