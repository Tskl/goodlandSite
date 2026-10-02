-- ════════════════════════════════════════════════════════════════════
-- goodland.gr — σχήμα περιεχομένου του δημόσιου site
-- Schema: site   (στο ίδιο Supabase με το «Goodland Management Tool»)
--
-- Κανόνες (ίδιοι με το εσωτερικό σύστημα):
--   • σκέτη PostgreSQL — καμία εξάρτηση από Supabase Auth/Storage/Realtime
--   • σύνδεση μόνο μέσω DATABASE_URL, ο backend συνδέεται ως postgres
--   • RLS ενεργό ΧΩΡΙΣ policies → το δημόσιο anon key δεν βλέπει τίποτα
--   • δίγλωσσο: κάθε κείμενο έχει _el (υποχρεωτικό) και _en (προαιρετικό)
--
-- Τρέχει μία φορά. Είναι idempotent μόνο ως προς το CREATE SCHEMA·
-- για ξανατρέξιμο από το μηδέν: DROP SCHEMA site CASCADE;
-- ════════════════════════════════════════════════════════════════════

BEGIN;

CREATE SCHEMA IF NOT EXISTS site;

-- ── Βοηθητικά ──────────────────────────────────────────────────────

-- updated_at αυτόματα σε κάθε UPDATE
CREATE OR REPLACE FUNCTION site.touch_updated_at() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
  NEW.updated_at := now();
  RETURN NEW;
END $$;

-- Τα 31 URL του παλιού site δεν αλλάζουν ΠΟΤΕ (6 χρόνια Google indexing).
-- Γραμμή με slug_locked = true δεν μπορεί να αλλάξει slug ούτε να ξεκλειδωθεί από το admin.
CREATE OR REPLACE FUNCTION site.guard_locked_slug() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
  IF OLD.slug_locked AND (NEW.slug IS DISTINCT FROM OLD.slug OR NOT NEW.slug_locked) THEN
    RAISE EXCEPTION 'Το slug «%» είναι κλειδωμένο (URL του παλιού site) και δεν αλλάζει.', OLD.slug
      USING ERRCODE = 'check_violation';
  END IF;
  RETURN NEW;
END $$;

CREATE OR REPLACE FUNCTION site.guard_locked_delete() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
  IF OLD.slug_locked THEN
    RAISE EXCEPTION 'Η σελίδα «%» είναι URL του παλιού site και δεν διαγράφεται· κάν'' την μη δημοσιευμένη.', OLD.slug
      USING ERRCODE = 'check_violation';
  END IF;
  RETURN OLD;
END $$;

-- slug: ό,τι επιτρέπει ένα URL path segment, πεζά, χωρίς κενά/κάθετους.
-- (Ελληνικά επιτρέπονται — βλ. «ευκαλυπτων-7-μαρουσι».)
CREATE DOMAIN site.slug AS text
  CHECK (VALUE ~ '^[^\s/?#A-ZΑ-Ω]+$' AND length(VALUE) BETWEEN 2 AND 120);


-- ── Χρήστες του admin ──────────────────────────────────────────────
-- Δικό μας auth: bcrypt + JWT (jose), όπως στο εσωτερικό σύστημα.
CREATE TABLE site.admins (
  id            bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  username      text NOT NULL UNIQUE CHECK (username ~ '^[a-z0-9._-]{3,40}$'),
  password_hash text NOT NULL,
  display_name  text NOT NULL,
  is_active     boolean NOT NULL DEFAULT true,
  created_at    timestamptz NOT NULL DEFAULT now(),
  last_login_at timestamptz
);


-- ── Περιοχές ───────────────────────────────────────────────────────
-- Το άρθρο δεν βγαίνει με κανόνα (στου Παπάγου, στα Βριλήσσια, στο Μαρούσι),
-- γι' αυτό το γράφει ο άνθρωπος μία φορά ανά περιοχή.
CREATE TABLE site.areas (
  id         bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name_el    text NOT NULL UNIQUE,          -- «Περιστέρι»
  name_en    text NOT NULL,                 -- «Peristeri»
  in_el      text NOT NULL,                 -- «στο Περιστέρι»
  CHECK (in_el ~ '^στ(ο|η|ην|ον|α|ις|ους|ου|ων) '),
  created_at timestamptz NOT NULL DEFAULT now()
);


-- ── Ακίνητα προς πώληση ────────────────────────────────────────────
CREATE TABLE site.properties (
  id                 bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slug               site.slug NOT NULL UNIQUE,
  slug_locked        boolean NOT NULL DEFAULT false,

  address_el         text NOT NULL,
  address_en         text,
  area_id            bigint NOT NULL REFERENCES site.areas(id),
  kind               text NOT NULL DEFAULT 'new-build'
                       CHECK (kind IN ('new-build', 'resale')),
  energy_class       text CHECK (energy_class IN ('Α+','Α','Β+','Β','Γ','Δ','Ε','Ζ','Η')),

  -- Μία κουκκίδα ανά γραμμή (το site τις δείχνει ως λίστα).
  description_el     text NOT NULL DEFAULT '',
  description_en     text,

  seo_title_el       text,                     -- κενό → «Διεύθυνση, Περιοχή»
  seo_title_en       text,
  seo_description_el text,
  seo_description_en text,

  sort_order         integer NOT NULL DEFAULT 0,
  is_published       boolean NOT NULL DEFAULT true,
  created_at         timestamptz NOT NULL DEFAULT now(),
  updated_at         timestamptz NOT NULL DEFAULT now(),
  updated_by         bigint REFERENCES site.admins(id) ON DELETE SET NULL
);

-- ── Διαμερίσματα ───────────────────────────────────────────────────
CREATE TABLE site.units (
  id             bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  property_id    bigint NOT NULL REFERENCES site.properties(id) ON DELETE CASCADE,
  legacy_id      text UNIQUE,                  -- «alkamenous-4-01» από το παλιό site

  unit_type      text NOT NULL DEFAULT 'apartment'
                   CHECK (unit_type IN ('apartment', 'maisonette', 'loft-apartment')),
  -- Επίπεδα: {1} = 1ος, {4,5} = μεζονέτα, {0} = ισόγειο.
  floors         smallint[] NOT NULL DEFAULT '{}'
                   CHECK (floors <@ ARRAY[-1,0,1,2,3,4,5,6,7,8,9,10]::smallint[]),
  -- Προαιρετικό: όταν το αυτόματο «4ος-5ος όροφος» δεν αρκεί (π.χ. «Ισόγειο 3»).
  floor_label_el text,
  floor_label_en text,

  sqm            numeric(6,2) NOT NULL CHECK (sqm > 0 AND sqm < 2000),
  bedrooms       smallint CHECK (bedrooms BETWEEN 0 AND 10),
  status         text NOT NULL DEFAULT 'available'
                   CHECK (status IN ('available', 'reserved', 'sold')),
  price_eur      integer CHECK (price_eur > 0),   -- ακέραια ευρώ· κενό = «κατόπιν επικοινωνίας»

  description_el text NOT NULL DEFAULT '',
  description_en text,

  sort_order     integer NOT NULL DEFAULT 0,
  created_at     timestamptz NOT NULL DEFAULT now(),
  updated_at     timestamptz NOT NULL DEFAULT now(),
  updated_by     bigint REFERENCES site.admins(id) ON DELETE SET NULL
);
CREATE INDEX units_property_idx ON site.units (property_id, sort_order);


-- ── Ολοκληρωμένα έργα (ανά περιοχή) ────────────────────────────────
CREATE TABLE site.completed_areas (
  id           bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slug         site.slug NOT NULL UNIQUE,
  slug_locked  boolean NOT NULL DEFAULT false,
  area_id      bigint NOT NULL REFERENCES site.areas(id),
  sort_order   integer NOT NULL DEFAULT 0,
  is_published boolean NOT NULL DEFAULT true,
  created_at   timestamptz NOT NULL DEFAULT now(),
  updated_at   timestamptz NOT NULL DEFAULT now(),
  updated_by   bigint REFERENCES site.admins(id) ON DELETE SET NULL
);

CREATE TABLE site.completed_buildings (
  id             bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  area_id        bigint NOT NULL REFERENCES site.completed_areas(id) ON DELETE CASCADE,
  address_el     text NOT NULL,
  address_en     text,
  specs_el       text NOT NULL DEFAULT '',
  specs_en       text,
  description_el text,
  description_en text,
  sort_order     integer NOT NULL DEFAULT 0,
  updated_at     timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX completed_buildings_area_idx ON site.completed_buildings (area_id, sort_order);


-- ── Διαμορφώσεις εσωτερικών χώρων ──────────────────────────────────
CREATE TABLE site.interiors (
  id           bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  slug         site.slug NOT NULL UNIQUE,
  slug_locked  boolean NOT NULL DEFAULT false,
  title_el     text NOT NULL,
  title_en     text,
  intro_el     text,
  intro_en     text,
  sort_order   integer NOT NULL DEFAULT 0,
  is_published boolean NOT NULL DEFAULT true,
  updated_at   timestamptz NOT NULL DEFAULT now(),
  updated_by   bigint REFERENCES site.admins(id) ON DELETE SET NULL
);


-- ── Φωτογραφίες και κατόψεις ───────────────────────────────────────
-- Μία γραμμή ανά αρχείο. Ανήκει σε ακριβώς ΕΝΑ από: ακίνητο, περιοχή, χώρο.
CREATE TABLE site.media (
  id               bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  property_id      bigint REFERENCES site.properties(id)      ON DELETE CASCADE,
  completed_area_id bigint REFERENCES site.completed_areas(id) ON DELETE CASCADE,
  interior_id      bigint REFERENCES site.interiors(id)       ON DELETE CASCADE,
  CHECK (num_nonnulls(property_id, completed_area_id, interior_id) = 1),

  kind       text NOT NULL DEFAULT 'photo' CHECK (kind IN ('photo', 'plan')),
  url        text NOT NULL,           -- Vercel Blob URL (ή /images/... μέχρι τη μεταφορά)
  width      integer CHECK (width > 0),
  height     integer CHECK (height > 0),
  bytes      integer CHECK (bytes > 0),
  alt_el     text,
  alt_en     text,

  -- Μόνο για κατόψεις: Α1 = 1ος όροφος, διαμέρισμα 1.
  plan_code  text,
  plan_floor smallint,
  CHECK (kind = 'plan' OR (plan_code IS NULL AND plan_floor IS NULL)),
  CHECK (kind = 'photo' OR plan_floor IS NOT NULL),
  -- Οι κατόψεις ανήκουν μόνο σε ακίνητα προς πώληση.
  CHECK (kind = 'photo' OR property_id IS NOT NULL),

  sort_order integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX media_property_idx ON site.media (property_id, kind, sort_order) WHERE property_id IS NOT NULL;
CREATE INDEX media_area_idx     ON site.media (completed_area_id, sort_order) WHERE completed_area_id IS NOT NULL;
CREATE INDEX media_interior_idx ON site.media (interior_id, sort_order)       WHERE interior_id IS NOT NULL;
-- Ένας κωδικός κάτοψης ανά ακίνητο.
CREATE UNIQUE INDEX media_plan_code_uq ON site.media (property_id, plan_code) WHERE plan_code IS NOT NULL;

-- Ποια κάτοψη δείχνει κάθε διαμέρισμα. Αν ένα διαμέρισμα δεν έχει
-- καμία γραμμή εδώ, το site δείχνει όλες τις κατόψεις των ορόφων του.
CREATE TABLE site.unit_plans (
  unit_id  bigint NOT NULL REFERENCES site.units(id) ON DELETE CASCADE,
  media_id bigint NOT NULL REFERENCES site.media(id) ON DELETE CASCADE,
  PRIMARY KEY (unit_id, media_id)
);
-- Ίδια κάτοψη σε δύο διαμερίσματα = λάθος (το audit.mjs το έψαχνε χειροκίνητα).
CREATE UNIQUE INDEX unit_plans_media_uq ON site.unit_plans (media_id);

-- Η κάτοψη πρέπει να είναι του ίδιου ακινήτου και ορόφου με το διαμέρισμα.
CREATE OR REPLACE FUNCTION site.check_unit_plan() RETURNS trigger
LANGUAGE plpgsql AS $$
DECLARE u site.units; m site.media;
BEGIN
  SELECT * INTO u FROM site.units WHERE id = NEW.unit_id;
  SELECT * INTO m FROM site.media WHERE id = NEW.media_id;
  IF m.kind <> 'plan' THEN
    RAISE EXCEPTION 'Το αρχείο % δεν είναι κάτοψη.', m.id USING ERRCODE = 'check_violation';
  END IF;
  IF m.property_id IS DISTINCT FROM u.property_id THEN
    RAISE EXCEPTION 'Η κάτοψη % ανήκει σε άλλο ακίνητο.', m.plan_code USING ERRCODE = 'check_violation';
  END IF;
  IF cardinality(u.floors) > 0 AND NOT (m.plan_floor = ANY (u.floors)) THEN
    RAISE EXCEPTION 'Η κάτοψη % είναι στον όροφο %, το διαμέρισμα στους %.', m.plan_code, m.plan_floor, u.floors
      USING ERRCODE = 'check_violation';
  END IF;
  RETURN NEW;
END $$;
CREATE TRIGGER unit_plans_check BEFORE INSERT OR UPDATE ON site.unit_plans
  FOR EACH ROW EXECUTE FUNCTION site.check_unit_plan();


-- ── Υπηρεσίες ──────────────────────────────────────────────────────
CREATE TABLE site.services (
  id             bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title_el       text NOT NULL,
  title_en       text,
  description_el text NOT NULL DEFAULT '',
  description_en text,
  href           text NOT NULL CHECK (href LIKE '/%'),
  sort_order     integer NOT NULL DEFAULT 0,
  is_published   boolean NOT NULL DEFAULT true
);


-- ── Ιστορικό αλλαγών ───────────────────────────────────────────────
-- Με πολλούς χρήστες στο admin: ποιος άλλαξε τι, πότε. Γράφεται από την εφαρμογή.
CREATE TABLE site.audit_log (
  id         bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  at         timestamptz NOT NULL DEFAULT now(),
  admin_id   bigint REFERENCES site.admins(id) ON DELETE SET NULL,
  table_name text NOT NULL,
  row_id     bigint,
  action     text NOT NULL CHECK (action IN ('insert', 'update', 'delete')),
  summary    text,                 -- «Βεργίνας 130 / 77 τ.μ.: διαθέσιμο → πωλήθηκε»
  before     jsonb,
  after      jsonb
);
CREATE INDEX audit_log_at_idx ON site.audit_log (at DESC);


-- ── Triggers ───────────────────────────────────────────────────────
CREATE TRIGGER properties_touch BEFORE UPDATE ON site.properties          FOR EACH ROW EXECUTE FUNCTION site.touch_updated_at();
CREATE TRIGGER units_touch      BEFORE UPDATE ON site.units               FOR EACH ROW EXECUTE FUNCTION site.touch_updated_at();
CREATE TRIGGER areas_touch      BEFORE UPDATE ON site.completed_areas     FOR EACH ROW EXECUTE FUNCTION site.touch_updated_at();
CREATE TRIGGER buildings_touch  BEFORE UPDATE ON site.completed_buildings FOR EACH ROW EXECUTE FUNCTION site.touch_updated_at();
CREATE TRIGGER interiors_touch  BEFORE UPDATE ON site.interiors           FOR EACH ROW EXECUTE FUNCTION site.touch_updated_at();

CREATE TRIGGER properties_slug BEFORE UPDATE ON site.properties      FOR EACH ROW EXECUTE FUNCTION site.guard_locked_slug();
CREATE TRIGGER areas_slug      BEFORE UPDATE ON site.completed_areas FOR EACH ROW EXECUTE FUNCTION site.guard_locked_slug();
CREATE TRIGGER interiors_slug  BEFORE UPDATE ON site.interiors       FOR EACH ROW EXECUTE FUNCTION site.guard_locked_slug();

CREATE TRIGGER properties_nodel BEFORE DELETE ON site.properties      FOR EACH ROW EXECUTE FUNCTION site.guard_locked_delete();
CREATE TRIGGER areas_nodel      BEFORE DELETE ON site.completed_areas FOR EACH ROW EXECUTE FUNCTION site.guard_locked_delete();
CREATE TRIGGER interiors_nodel  BEFORE DELETE ON site.interiors       FOR EACH ROW EXECUTE FUNCTION site.guard_locked_delete();

-- Τα slugs πρέπει να είναι μοναδικά ΚΑΙ ανάμεσα στους τρεις πίνακες,
-- γιατί όλα ζουν στο ίδιο /[slug].
CREATE OR REPLACE FUNCTION site.guard_slug_global() RETURNS trigger
LANGUAGE plpgsql AS $$
BEGIN
  IF (TG_TABLE_NAME <> 'properties'      AND EXISTS (SELECT 1 FROM site.properties      WHERE slug = NEW.slug))
  OR (TG_TABLE_NAME <> 'completed_areas' AND EXISTS (SELECT 1 FROM site.completed_areas WHERE slug = NEW.slug))
  OR (TG_TABLE_NAME <> 'interiors'       AND EXISTS (SELECT 1 FROM site.interiors       WHERE slug = NEW.slug))
  OR NEW.slug IN ('pros-polisi','olokliromena-erga','projects','katalogos','contact',
                  'politiki-aporritou','en','api','admin','sitemap.xml','robots.txt','icon.svg') THEN
    RAISE EXCEPTION 'Το slug «%» χρησιμοποιείται ήδη.', NEW.slug USING ERRCODE = 'unique_violation';
  END IF;
  RETURN NEW;
END $$;
CREATE TRIGGER properties_slug_global BEFORE INSERT OR UPDATE OF slug ON site.properties      FOR EACH ROW EXECUTE FUNCTION site.guard_slug_global();
CREATE TRIGGER areas_slug_global      BEFORE INSERT OR UPDATE OF slug ON site.completed_areas FOR EACH ROW EXECUTE FUNCTION site.guard_slug_global();
CREATE TRIGGER interiors_slug_global  BEFORE INSERT OR UPDATE OF slug ON site.interiors       FOR EACH ROW EXECUTE FUNCTION site.guard_slug_global();


-- ── RLS: ενεργό χωρίς policies ─────────────────────────────────────
ALTER TABLE site.admins              ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.areas               ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.properties          ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.units               ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.completed_areas     ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.completed_buildings ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.interiors           ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.media               ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.unit_plans          ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.services            ENABLE ROW LEVEL SECURITY;
ALTER TABLE site.audit_log           ENABLE ROW LEVEL SECURITY;

COMMIT;
