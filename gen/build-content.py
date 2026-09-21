# -*- coding: utf-8 -*-
"""Μετατρέπει τα content/raw/*.json σε δομημένα content/*.ts κατά types.ts."""
import json, os, re

RAW = "content/raw"
def load(s): return json.load(open(f"{RAW}/{s}.json", encoding="utf-8"))

# Διευθύνσεις γραμμένες σωστά (με τόνους) - το site τις έχει όλες κεφαλαία
PROPS = [
  ("alkamenous-4-peristeri",        "Αλκαμένους 4",              "Περιστέρι"),
  ("andrea-dimitriou-87-nea-iwnia", "Ανδρέα Δημητρίου 87",       "Νέα Ιωνία"),
  ("olimpoy-21-marousi",            "Ολύμπου 21",                "Μαρούσι"),
  ("bizantiou-56-papagou",          "Βυζαντίου 56",              "Παπάγου"),
  ("katswnh-5-mosxato",             "Κατσώνη 5 & Αχιλλέως 19",   "Μοσχάτο"),
  ("dikaiarxou-79-pagrati",         "Δικαιάρχου 79",             "Παγκράτι"),
  ("olympou-23-vrilhssia",          "Ολύμπου 23",                "Βριλήσσια"),
  ("kalirrois-80-koukaki",          "Καλλιρρόης 80",             "Κουκάκι"),
  ("verginas-130-agios-dimitrios",  "Βεργίνας 130",              "Άγιος Δημήτριος"),
  ("kekropos-4-6-kallithea",        "Κέκροπος 4-6",              "Καλλιθέα"),
  ("kallirrois-100-koykaki",        "Καλλιρρόης 100",            "Κουκάκι"),
  ("ευκαλυπτων-7-μαρουσι",          "Ευκαλύπτων 7",              "Μαρούσι"),
  ("markopoulioti-26-32-neos-kosmos","Μαρκοπουλιώτη 26-32",      "Νέος Κόσμος"),
]

AREAS = [
  ("papagou","Παπάγου"), ("xolargos","Χολαργός"), ("zografou","Ζωγράφου"),
  ("nikea","Νίκαια"), ("keratsini","Κερατσίνι"), ("agia-paraskevi","Αγία Παρασκευή"),
  ("peukh","Πεύκη"), ("palaio-faliro","Παλαιό Φάληρο"),
]

INTERIORS = [
  ("saloni","Σαλόνια","Living rooms"),
  ("kouzines","Κουζίνες","Kitchens"),
  ("wc","Μπάνια","Bathrooms"),
  ("upnodomatia","Υπνοδωμάτια","Bedrooms"),
]


# χάρτης: URL του Wix -> τοπικό αρχείο, ακριβώς όπως το γράφει το download-images.mjs
MANIFEST = json.load(open("content/images-manifest.json", encoding="utf-8"))
URL2LOCAL = {}
for _slug, _imgs in MANIFEST.items():
    for _i, _im in enumerate(_imgs, 1):
        _ext = (re.search(r"\.(jpe?g|png|webp|gif)$", _im["full"], re.I) or [None, "jpg"])[1].lower()
        URL2LOCAL[_im["full"]] = f"/images/{_slug}/{_i:02d}.{_ext}"

def local(u):
    return URL2LOCAL.get(u, u)


# ── Κατόψεις ────────────────────────────────────────────────────────
# Το παλιό site κωδικοποιούσε τις κατόψεις στο alt της εικόνας:
# ΑΛΚΑΜΕΝΟΥΣ-Α1.png, 'Γ3.jpg, ΚΕΚΡΟΠΟΣ-ΣΤ1-Ζ1.jpg (μεζονέτα, δύο επίπεδα).
# Γράμμα = όροφος (Ι=ισόγειο, Α=1ος, Β=2ος, …), αριθμός = διαμέρισμα.
import unicodedata

FLOOR_OF = {'ΙΣ': 0, 'Ι': 0, 'Α': 1, 'Β': 2, 'Γ': 3, 'Δ': 4, 'Ε': 5, 'ΣΤ': 6, 'Ζ': 7}
# Λατινικά που χρησιμοποιούσε εναλλάξ το παλιό site (μόνο ΚΕΦΑΛΑΙΑ, αλλιώς
# πιάνει και φωτογραφίες τύπου i1.jpg).
LATIN = {'I': 'Ι', 'A': 'Α', 'B': 'Β', 'C': 'Γ', 'D': 'Δ', 'E': 'Ε', 'ST': 'ΣΤ', 'Z': 'Ζ'}

def _noacc(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s or '') if unicodedata.category(c) != 'Mn')

def plan_codes(alt):
    """Κωδικοί κατόψεων μέσα σε ένα alt. Γυρνά λίστα (κωδικός, όροφος)."""
    a = _noacc(alt)
    a = re.sub(r'\.(jpe?g|png|webp|gif)$', '', a, flags=re.I)
    out = []
    for tok in re.split(r'[^0-9A-Za-zΑ-Ωα-ω]+', a):
        m = re.match(r'^(ΣΤ|ST|ΙΣ|[ΑΒΓΔΕΖΙ]|[ABCDEIZ])(\d+)([ΑΒαβ]?)$', tok.upper()
                     if re.match(r'^[Α-Ωα-ω]', tok) else tok)
        if not m:
            continue
        letters = m.group(1)
        if re.match(r'^[A-Z]+$', letters):          # λατινικά: μόνο κεφαλαία
            if not tok.startswith(letters):
                continue
            letters = LATIN.get(letters)
            if not letters:
                continue
        if letters not in FLOOR_OF:
            continue
        out.append((letters + m.group(2) + m.group(3).upper(), FLOOR_OF[letters]))
    return out

def unit_floors(floor_el):
    """Επίπεδα μονάδας: '4ος-5ος ΟΡΟΦΟΣ' -> [4,5], 'ΙΣΟΓΕΙΟ 3' -> [0]."""
    s = _noacc(floor_el or '').upper()
    nums = [int(n) for n in re.findall(r'(\d+)\s*(?:ΟΣ|ΟΥ)', s)]
    if nums:
        return sorted(set(nums))
    if 'ΙΣΟΓΕΙΟ' in s:
        return [0]
    return []

try:
    with open("gen/unit-plans.json", encoding="utf-8") as f:
        UNIT_PLANS = json.load(f)
except FileNotFoundError:
    UNIT_PLANS = {}

def ts(s):
    if s is None: return "undefined"
    return "'" + str(s).replace("\\", "\\\\").replace("'", "\\'").replace("\n", " ") + "'"

def L(el, en=None):
    return "{ el: %s }" % ts(el) if not en else "{ el: %s, en: %s }" % (ts(el), ts(en))

def bedrooms_el(d):
    m = re.search(r"Αποτελείται απ[όο]\s*(\d+)\s*υπνοδωμ", d or "")
    return int(m.group(1)) if m else None

def bedrooms_en(d):
    m = re.search(r"consists of\s*(\d+)\s*bedroom", d or "", re.I)
    return int(m.group(1)) if m else None

def status_of(raw):
    if raw is None: return "unknown", None
    r = raw.strip()
    if "€" in r: return "available", r.replace(" €", "€")
    low = r.lower()
    if low.startswith("διαθέσιμο"): return "available", None
    if "διαθέσιμο" in low: return "sold", None
    if low == "άγνωστο" or r == "ΑΓΝΩΣΤΟ": return "unknown", None
    return "unknown", None


def nice_floor(t):
    if not t: return t
    t = t.replace("ΟΡΟΦΟΣ", "όροφος").replace("ΙΣΟΓΕΙΟ", "Ισόγειο")
    t = t.replace("FLOOR", "floor").replace("GROUNDFLOOR", "Ground floor")
    t = re.sub(r"\s+", " ", t).strip()
    return t

def unit_type(u):
    t = (u.get("title_el") or "") + (u.get("floor_el") or "")
    if "ΜΕΖΟΝΕΤ" in t.upper() or "MEZONET" in t.upper(): return ("Μεζονέτα", "Maisonette")
    if "ΣΟΦΙΤΑ" in t.upper(): return ("Διαμέρισμα με σοφίτα", "Apartment with loft")
    return ("Διαμέρισμα", "Apartment")

out_props = []
review = []

for slug, addr, area in PROPS:
    d = load(slug)
    imgs = [i["full"] for i in d.get("images", [])
            if "LOGO" not in (i.get("alt") or "") and not i["full"].startswith("https://static.wixstatic.com/media/11062b")]
    flags = []
    units_ts = []

    # κατόψεις: κωδικός -> τοπικό αρχείο (μια εικόνα μπορεί να καλύπτει
    # δύο επίπεδα μεζονέτας ή τρεις πανομοιότυπους ορόφους)
    plans = []
    seen_codes = set()
    for im in d.get("images", []):
        for code, fl in plan_codes(im.get("alt")):
            if code in seen_codes:
                continue
            seen_codes.add(code)
            plans.append((code, fl, local(im["full"])))
    plans.sort(key=lambda x: (x[1], x[0]))
    plan_by_code = {c: src for c, fl, src in plans}

    if slug == "kallirrois-100-koykaki":
        sp = d["single_property"]
        units_ts.append("""    {
      id: 'k100',
      floor: %s,
      type: %s,
      sqm: %d,
      bedrooms: %d,
      status: 'available',
      price: %s,
      description: %s,
    }""" % (L("6ος όροφος","6th floor"), L("Διαμέρισμα","Apartment"), sp["sqm"], sp["bedrooms"],
            ts(sp["price"]), L(" ".join(sp["el"]), " ".join(sp["en"]))))
        kind = "resale"
        energy = "Β"
        bdesc = L(" ".join(sp["el"]), " ".join(sp["en"]))
        flags.append("Μεταπώληση 2008, όχι νεόδμητο - ο τίτλος στο Wix έλεγε λάθος 'Νεόδμητη Κατοικία'")
    else:
        kind = "new-build"
        energy = "Α"
        b = d.get("building", {})
        bdesc = L(" ".join(b.get("el", [])), " ".join(b.get("en", [])))
        for n, u in enumerate(d.get("units", []), 1):
            st, price = status_of(u.get("status_raw"))
            be, bn = bedrooms_el(u.get("desc_el")), bedrooms_en(u.get("desc_en"))
            ur = []
            if be and bn and be != bn:
                ur.append(f"υπνοδωμάτια: ελληνικά {be}, αγγλικά {bn}")
                review.append(f"{slug} / μονάδα {n} ({u.get('sqm')} τ.μ.): υπνοδωμάτια el={be} en={bn}")
            if u.get("sqm_el") and u.get("sqm_en") and u["sqm_el"] != u["sqm_en"]:
                ur.append(f"τ.μ.: ελληνικά {u['sqm_el']}, αγγλικά {u['sqm_en']}")
                review.append(f"{slug} / μονάδα {n}: τ.μ. el={u['sqm_el']} en={u['sqm_en']}")
            if st == "unknown":
                ur.append("άγνωστη διαθεσιμότητα")
                review.append(f"{slug} / μονάδα {n} ({u.get('sqm') or u.get('sqm_el')} τ.μ.): άγνωστη διαθεσιμότητα")
            te, ten = unit_type(u)
            sqm = u.get("sqm") or u.get("sqm_el")
            uid = "%s-%02d" % (slug[:12], n)
            fls = unit_floors(u.get("floor_el"))
            pinned = (UNIT_PLANS.get(slug) or {}).get(uid)
            if isinstance(pinned, str):
                pinned = [pinned]
            pinned = [c for c in (pinned or []) if c in plan_by_code]
            units_ts.append("""    {
      id: '%s',
      floor: %s,
      type: %s,%s%s
      status: '%s',%s
      description: %s,%s
      floors: [%s],%s
    }""" % (uid,
                    L(nice_floor(u.get("floor_el","")), nice_floor(u.get("floor_en"))),
                    L(te, ten),
                    ("\n      sqm: %d," % sqm) if sqm else "",
                    ("\n      bedrooms: %d," % be) if be else "",
                    st,
                    ("\n      price: %s," % ts(price)) if price else "",
                    L(u.get("desc_el",""), u.get("desc_en")),
                    ("\n      needsReview: [%s]," % ", ".join(ts(x) for x in ur)) if ur else "",
                    ", ".join(str(x) for x in fls),
                    ("\n      plan: [%s]," % ", ".join(ts(c) for c in pinned)) if pinned else ""))

    for n in d.get("notes", []):
        if n.startswith(("ΑΣΥΜΦΩΝΙΑ","ΠΡΟΣΟΧΗ","ΟΡΦΑΝΟ","ΑΝΤΙΦΑΣΗ","ΔΙΕΥΘΥΝΣΗ","ΔΕΝ ")) or "ΤΙΜΕΣ" in n:
            flags.append(n)

    out_props.append("""  {
    slug: %s,
    address: %s,
    area: %s,
    kind: '%s',
    energyClass: %s,
    buildingDescription: %s,
    units: [
%s
    ],
    images: [
%s
    ],
    plans: [
%s
    ],
    seo: { title: %s },%s
  }""" % (ts(slug), L(addr), L(area), kind, ts(energy), bdesc,
          "\n".join(u + "," for u in units_ts) if units_ts else "",
          "\n".join("      %s," % ts(local(i)) for i in imgs),
          "\n".join("      { code: %s, floor: %d, src: %s }," % (ts(c), fl, ts(src)) for c, fl, src in plans),
          L(f"{addr}, {area}"),
          ("\n    needsReview: [\n%s\n    ]," % "\n".join("      %s," % ts(f) for f in flags)) if flags else ""))

os.makedirs("content", exist_ok=True)
with open("content/properties.ts", "w", encoding="utf-8") as f:
    f.write("import type { Property } from './types'\n\nexport const properties: Property[] = [\n")
    f.write(",\n".join(out_props))
    f.write("\n]\n")

# --- areas ---
# Αγγλικές αποδόσεις: μετάφραση των ελληνικών, σε ξεχωριστό αρχείο ώστε να
# μη χάνονται σε κάθε regeneration.
try:
    with open("gen/areas-en.json", encoding="utf-8") as f:
        AREAS_EN = json.load(f)
except FileNotFoundError:
    AREAS_EN = {}

out_areas = []
for slug, name in AREAS:
    d = load(slug)
    en_list = AREAS_EN.get(slug, [])
    imgs = [i["full"] for i in d.get("images", []) if "LOGO" not in (i.get("alt") or "")]
    bts = []
    for bi, b in enumerate(d.get("buildings", [])):
        desc = b.get("description_el")
        if isinstance(desc, list): desc = " ".join(desc)
        en = en_list[bi] if bi < len(en_list) else {}
        bts.append("""      {
        address: %s,
        specs: %s,%s
      }""" % (L(b["address"], en.get("address")), L(b.get("specs_el",""), en.get("specs")),
                ("\n        description: %s," % L(desc, en.get("description"))) if desc else ""))
    out_areas.append("""  {
    slug: %s,
    area: %s,
    buildings: [
%s,
    ],
    images: [
%s
    ],
  }""" % (ts(slug), L(name), ",\n".join(bts), "\n".join("      %s," % ts(local(i)) for i in imgs)))

with open("content/areas.ts", "w", encoding="utf-8") as f:
    f.write("import type { ProjectArea } from './types'\n\nexport const areas: ProjectArea[] = [\n")
    f.write(",\n".join(out_areas))
    f.write("\n]\n")

# --- interiors ---
out_int = []
for slug, t_el, t_en in INTERIORS:
    d = load(slug)
    imgs = [i["full"] for i in d.get("images", [])
            if "LOGO" not in (i.get("alt") or "") and not i["full"].startswith("https://static.wixstatic.com/media/11062b")]
    out_int.append("""  {
    slug: %s,
    title: %s,
    images: [
%s
    ],
  }""" % (ts(slug), L(t_el, t_en), "\n".join("      %s," % ts(local(i)) for i in imgs)))

with open("content/interiors.ts", "w", encoding="utf-8") as f:
    f.write("import type { Interior } from './types'\n\nexport const interiors: Interior[] = [\n")
    f.write(",\n".join(out_int))
    f.write("\n]\n")

with open("content/REVIEW.txt", "w", encoding="utf-8") as f:
    f.write("Σημεία που χρειάζονται επιβεβαίωση από τον Άγγελο\n")
    f.write("=" * 50 + "\n\n")
    for r in review: f.write("- " + r + "\n")

print("properties:", len(out_props), "| areas:", len(out_areas), "| interiors:", len(out_int))
print("σημεία προς έλεγχο:", len(review))
