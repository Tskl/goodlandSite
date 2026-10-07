-- ════════════════════════════════════════════════════════════════════
-- Μηνύματα από τη φόρμα επικοινωνίας.
-- Κάθε μήνυμα αποθηκεύεται ΠΡΙΝ σταλεί το email, ώστε να μη χάνεται
-- τίποτα ακόμα κι αν η αποστολή αποτύχει. Φαίνονται στο /admin/messages.
-- Τρέχει μία φορά, μετά τα 001 και 002.
-- ════════════════════════════════════════════════════════════════════
BEGIN;

CREATE TABLE IF NOT EXISTS site.inquiries (
  id              bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  created_at      timestamptz NOT NULL DEFAULT now(),
  lang            text NOT NULL DEFAULT 'el' CHECK (lang IN ('el', 'en')),
  first_name      text NOT NULL,
  last_name       text NOT NULL,
  phone           text NOT NULL,
  email           text,
  message         text,
  about           text,          -- «Βεργίνας 130, Άγιος Δημήτριος» όταν ήρθε από σελίδα έργου
  property_slug   text,
  mailed_office   boolean NOT NULL DEFAULT false,
  mailed_customer boolean NOT NULL DEFAULT false,
  handled         boolean NOT NULL DEFAULT false,
  handled_by      bigint REFERENCES site.admins(id) ON DELETE SET NULL,
  handled_at      timestamptz
);
CREATE INDEX IF NOT EXISTS inquiries_created_idx ON site.inquiries (created_at DESC);

ALTER TABLE site.inquiries ENABLE ROW LEVEL SECURITY;

COMMIT;
