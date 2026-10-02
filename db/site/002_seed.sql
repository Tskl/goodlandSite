-- ΠΑΡΑΓΟΜΕΝΟ από db/site/build-seed.mjs — μην το γράφεις με το χέρι.
-- 2026-10-02T08:20:19.782Z
BEGIN;

-- Περιοχές
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Περιστέρι', 'Peristeri', 'στο Περιστέρι');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Νέα Ιωνία', 'Nea Ionia', 'στη Νέα Ιωνία');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Μαρούσι', 'Maroussi', 'στο Μαρούσι');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Παπάγου', 'Papagou', 'στου Παπάγου');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Μοσχάτο', 'Moschato', 'στο Μοσχάτο');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Παγκράτι', 'Pangrati', 'στο Παγκράτι');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Βριλήσσια', 'Vrilissia', 'στα Βριλήσσια');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Κουκάκι', 'Koukaki', 'στο Κουκάκι');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Άγιος Δημήτριος', 'Agios Dimitrios', 'στον Άγιο Δημήτριο');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Καλλιθέα', 'Kallithea', 'στην Καλλιθέα');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Νέος Κόσμος', 'Neos Kosmos', 'στον Νέο Κόσμο');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Χολαργός', 'Cholargos', 'στον Χολαργό');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Ζωγράφου', 'Zografou', 'στου Ζωγράφου');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Νίκαια', 'Nikaia', 'στη Νίκαια');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Κερατσίνι', 'Keratsini', 'στο Κερατσίνι');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Αγία Παρασκευή', 'Agia Paraskevi', 'στην Αγία Παρασκευή');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Πεύκη', 'Pefki', 'στην Πεύκη');
INSERT INTO site.areas (name_el, name_en, in_el) VALUES ('Παλαιό Φάληρο', 'Palaio Faliro', 'στο Παλαιό Φάληρο');

-- Αλκαμένους 4, Περιστέρι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('alkamenous-4-peristeri', true, 'Αλκαμένους 4', NULL, (SELECT id FROM site.areas WHERE name_el = 'Περιστέρι'), 'new-build', 'Α',
  'Πενταώροφη πολυκατοικία επί pilotis με υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Five-storey apartment building with basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Αλκαμένους 4, Περιστέρι', NULL, NULL, NULL, 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-01', 'apartment', '{1}'::smallint[], NULL, NULL, 48, 1, 'available', 150000,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room, and a bathroom. It has a parking space on the ground floor, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-02', 'apartment', '{1}'::smallint[], NULL, NULL, 73, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, and a bathroom. It has a parking space on the ground floor, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-03', 'apartment', '{1}'::smallint[], NULL, NULL, 70, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, and a bathroom. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-04', 'apartment', '{2}'::smallint[], NULL, NULL, 59, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-05', 'apartment', '{2}'::smallint[], NULL, NULL, 54, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the ground-floor parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-06', 'apartment', '{3}'::smallint[], NULL, NULL, 52, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-07', 'apartment', '{3}'::smallint[], NULL, NULL, 70, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and a bathroom. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-08', 'apartment', '{3}'::smallint[], NULL, NULL, 52, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and bathroom. It has a parking space in the ground-floor covered parking (pilotis), a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-09', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 105, 2, 'available', 335000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, δύο μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, two bathrooms and a wc. It has a parking space in the ground-floor covered parking (pilotis), a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 90);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-10', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 99, 3, 'available', 320000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, δύο μπάνια και wc. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, two bathrooms and a wc. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 100);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'alkamenous-4-11', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 107, 2, 'available', 335000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και δύο μπάνια. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and two bathrooms. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/02.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/11.png', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/12.png', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/19.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/20.jpg', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/21.jpg', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/22.jpg', 80);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/23.png', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/24.png', 100);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/25.png', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/26.png', 120);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'photo', '/images/alkamenous-4-peristeri/27.png', 130);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/03.png', 'Α1', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/04.jpg', 'Α2', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/05.jpg', 'Α3', 1, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/06.jpg', 'Β1', 2, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/07.jpg', 'Β4', 2, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/08.jpg', 'Γ1', 3, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/09.jpg', 'Γ3', 3, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/10.jpg', 'Γ4', 3, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/13.jpg', 'Δ1', 4, 90);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/15.jpg', 'Δ2', 4, 100);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/17.jpg', 'Δ3', 4, 110);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/14.jpg', 'Ε1', 5, 120);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/16.jpg', 'Ε2', 5, 130);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'alkamenous-4-peristeri'), 'plan', '/images/alkamenous-4-peristeri/18.jpg', 'Ε3', 5, 140);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-01' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-02' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-03' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-04' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-05' AND m.plan_code = 'Β4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-06' AND m.plan_code = 'Γ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-07' AND m.plan_code = 'Γ3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-08' AND m.plan_code = 'Γ4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-09' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-09' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-10' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-10' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-11' AND m.plan_code = 'Δ3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'alkamenous-4-11' AND m.plan_code = 'Ε3';

-- Ανδρέα Δημητρίου 87, Νέα Ιωνία
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('andrea-dimitriou-87-nea-iwnia', true, 'Ανδρέα Δημητρίου 87', NULL, (SELECT id FROM site.areas WHERE name_el = 'Νέα Ιωνία'), 'new-build', 'Α',
  'Πενταώροφη πολυκατοικία με σοφίτα & υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Five-storey apartment building with loft &basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Ανδρέα Δημητρίου 87, Νέα Ιωνία', NULL, NULL, NULL, 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-01', 'apartment', '{1}'::smallint[], NULL, NULL, 69, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-02', 'apartment', '{1}'::smallint[], NULL, NULL, 69, 2, 'available', 205000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and bathroom. It has a parking space in the ground-floor covered parking area (pilotis), a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-03', 'apartment', '{2}'::smallint[], NULL, NULL, 42, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-04', 'apartment', '{2}'::smallint[], NULL, NULL, 69, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-05', 'apartment', '{3}'::smallint[], NULL, NULL, 79, 2, 'available', 250000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ιυπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc.It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-06', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 106, 3, 'available', 350000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και δύο μπάνια. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room and two bathrooms. It has a parking spacein the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'andrea-dimit-07', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 104, 3, 'available', 335000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και δύο μπάνια. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, laminate πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room and two bathrooms. It has a parking space in the underground parking area, a storage room in the basement, laminate floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'photo', '/images/andrea-dimitriou-87-nea-iwnia/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'photo', '/images/andrea-dimitriou-87-nea-iwnia/11.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'photo', '/images/andrea-dimitriou-87-nea-iwnia/12.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'photo', '/images/andrea-dimitriou-87-nea-iwnia/13.jpg', 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/02.jpg', 'Α2', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/03.jpg', 'Α3', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/04.jpg', 'Β1', 2, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/05.png', 'Β3', 2, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/06.jpg', 'Γ2', 3, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/07.jpg', 'Δ1', 4, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/09.png', 'Δ2', 4, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/08.jpg', 'Ε1', 5, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'andrea-dimitriou-87-nea-iwnia'), 'plan', '/images/andrea-dimitriou-87-nea-iwnia/10.png', 'Ε2', 5, 90);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-01' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-02' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-03' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-04' AND m.plan_code = 'Β3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-05' AND m.plan_code = 'Γ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-06' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-06' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-07' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'andrea-dimit-07' AND m.plan_code = 'Ε2';

-- Ολύμπου 21, Μαρούσι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('olimpoy-21-marousi', true, 'Ολύμπου 21', NULL, (SELECT id FROM site.areas WHERE name_el = 'Μαρούσι'), 'new-build', 'Α',
  'Πενταώροφη πολυκατοικία επί pilotis με υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Five-storey apartment building with basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Ολύμπου 21, Μαρούσι', NULL, NULL, NULL, 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-01', 'apartment', '{1}'::smallint[], NULL, NULL, 45, 1, 'available', 205000,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space, storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-02', 'apartment', '{1}'::smallint[], NULL, NULL, 64, 1, 'available', 295000,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the groundfloor, storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-03', 'apartment', '{1}'::smallint[], NULL, NULL, 81, 2, 'available', 365000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιο και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space in the groundfloor, storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-04', 'apartment', '{1}'::smallint[], NULL, NULL, 50, 1, 'available', 230000,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the groundfloor, storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-05', 'apartment', '{2}'::smallint[], NULL, NULL, 107, 3, 'available', 500000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και 2 μπάνια. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room and 2 bathrooms. It has a parking space in the groundfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-06', 'apartment', '{2}'::smallint[], NULL, NULL, 70, 2, 'available', 325000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και 2 μπάνια. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and 2 bathrooms. It has a parking space in the groundfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-07', 'apartment', '{2}'::smallint[], NULL, NULL, 59, 1, 'available', 285000,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space in the groundfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-08', 'apartment', '{5}'::smallint[], NULL, NULL, 123, 3, 'available', 660000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, 2 μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, 2 bathrooms and a wc. It has a parking space in the grounfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'olimpoy-21-m-09', 'apartment', '{5}'::smallint[], NULL, NULL, 123, 3, 'available', 660000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, 2 μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, σύστημα ψύξης–θέρμανσης με fan coil, που λειτουργούν μέσω αντλίας θερμότητα, ενδοδαπέδια θέρμανση & παροχή για φορτιστή ηλεκτρικού οχήματος.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, 2 bathrooms and a wc. It has a parking space in the groundfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump, underfloor heating & supply for an electric vehicle charger.', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'photo', '/images/olimpoy-21-marousi/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'photo', '/images/olimpoy-21-marousi/11.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'photo', '/images/olimpoy-21-marousi/12.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'photo', '/images/olimpoy-21-marousi/13.jpg', 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/02.jpg', 'Α1', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/03.jpg', 'Α2', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/04.jpg', 'Α3', 1, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/05.jpg', 'Α4', 1, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/06.jpg', 'Β1', 2, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/07.jpg', 'Β2', 2, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/08.jpg', 'Β3', 2, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/09.jpg', 'Ε1', 5, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olimpoy-21-marousi'), 'plan', '/images/olimpoy-21-marousi/10.jpg', 'Ε2', 5, 90);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-01' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-02' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-03' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-04' AND m.plan_code = 'Α4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-05' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-06' AND m.plan_code = 'Β2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-07' AND m.plan_code = 'Β3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-08' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olimpoy-21-m-09' AND m.plan_code = 'Ε2';

-- Βυζαντίου 56, Παπάγου
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('bizantiou-56-papagou', true, 'Βυζαντίου 56', NULL, (SELECT id FROM site.areas WHERE name_el = 'Παπάγου'), 'new-build', 'Α',
  'Τετραώροφη πολυκατοικία με σοφίτα & υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Four-storey apartment building with loft & basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Βυζαντίου 56, Παπάγου', NULL, NULL, NULL, 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'bizantiou-56-01', 'apartment', '{1}'::smallint[], NULL, NULL, 47, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'bizantiou-56-02', 'apartment', '{2}'::smallint[], NULL, NULL, 47, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedrooms, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'bizantiou-56-03', 'apartment', '{3,4}'::smallint[], NULL, NULL, 110, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και δύο μπάνια. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 3 bedrooms, a living room, a kitchen-dining room and two bathrooms. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/06.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/07.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/08.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/09.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/10.jpg', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/11.jpg', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/12.jpg', 80);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/13.jpg', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/14.jpg', 100);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/15.jpg', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/16.jpg', 120);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/17.jpg', 130);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/18.jpg', 140);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/19.jpg', 150);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/20.jpg', 160);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'photo', '/images/bizantiou-56-papagou/21.jpg', 170);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'plan', '/images/bizantiou-56-papagou/02.jpg', 'Α2', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'plan', '/images/bizantiou-56-papagou/03.jpg', 'Β2', 2, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'plan', '/images/bizantiou-56-papagou/04.jpg', 'Γ2', 3, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'bizantiou-56-papagou'), 'plan', '/images/bizantiou-56-papagou/05.jpg', 'Δ2', 4, 40);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'bizantiou-56-01' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'bizantiou-56-02' AND m.plan_code = 'Β2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'bizantiou-56-03' AND m.plan_code = 'Γ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'bizantiou-56-03' AND m.plan_code = 'Δ2';

-- Κατσώνη 5 & Αχιλλέως 19, Μοσχάτο
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('katswnh-5-mosxato', true, 'Κατσώνη 5 & Αχιλλέως 19', NULL, (SELECT id FROM site.areas WHERE name_el = 'Μοσχάτο'), 'new-build', 'Α',
  'Τετραώροφη πολυκατοικία επί pilotis με υπόγειο & δώμα.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Four-story apartment building on pilotis with basement and roof.
Energy class A.
High standard construction.
Delivery under construction.',
  'Κατσώνη 5 & Αχιλλέως 19, Μοσχάτο', NULL, NULL, NULL, 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-01', 'apartment', '{1}'::smallint[], NULL, NULL, 47, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room, a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-02', 'apartment', '{1}'::smallint[], NULL, NULL, 69, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom. It has a parking space in the underground parking area, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-03', 'apartment', '{2}'::smallint[], NULL, NULL, 47, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedrooms, a living room, a kitchen-dining room, a bathroom. It has a parking space in the groundfloor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump & supply for an electric vehicle charger.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-04', 'apartment', '{2}'::smallint[], NULL, NULL, 69, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom.It has a parking space and storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, cooling-heating system with fan coil, which operate via a heat pump & supply for an electric vehicle charger.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-05', 'apartment', '{2}'::smallint[], NULL, NULL, 51, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1 bedroom, a living room, a kitchen-dining room, a bathroom . It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-06', 'apartment', '{3}'::smallint[], NULL, NULL, 70, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'katswnh-5-mo-07', 'apartment', '{4}'::smallint[], NULL, NULL, 70, 2, 'available', 275000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/01.png', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/02.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/03.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/11.png', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/12.png', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/13.png', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'photo', '/images/katswnh-5-mosxato/14.png', 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/04.jpg', 'Α1', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/05.jpg', 'Α2', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/06.jpg', 'Β1', 2, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/07.jpg', 'Β2', 2, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/08.jpg', 'Β3', 2, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/09.jpg', 'Γ1', 3, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'katswnh-5-mosxato'), 'plan', '/images/katswnh-5-mosxato/10.jpg', 'Δ2', 4, 70);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-01' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-02' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-03' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-04' AND m.plan_code = 'Β2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-05' AND m.plan_code = 'Β3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-06' AND m.plan_code = 'Γ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'katswnh-5-mo-07' AND m.plan_code = 'Δ2';

-- Δικαιάρχου 79, Παγκράτι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('dikaiarxou-79-pagrati', true, 'Δικαιάρχου 79', NULL, (SELECT id FROM site.areas WHERE name_el = 'Παγκράτι'), 'new-build', 'Α',
  'Εξαώροφη πολυκατοικία επί pilotis με 2 υπόγεια.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Six-storey apartment building with 2 basements.
Energy class A.
High standard construction.
Delivery under construction.',
  'Δικαιάρχου 79, Παγκράτι', NULL, NULL, NULL, 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-01', 'apartment', '{1}'::smallint[], NULL, NULL, 74, 2, 'available', 280000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 2 bedrooms, living room, kitchen, dining room and bathroom. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is via a heat pump and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-02', 'apartment', '{2}'::smallint[], NULL, NULL, 52, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is via a heat pump and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-03', 'apartment', '{3}'::smallint[], NULL, NULL, 55, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is via a heat pump and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-04', 'apartment', '{5}'::smallint[], NULL, NULL, 98, 2, 'available', 410000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, χώρο για γραφείο, wc και μπάνιο. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 2 bedrooms, living room, kitchen, dining room, office, wc and bathroom. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is via a heat pump and radiators.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-05', 'apartment', '{5}'::smallint[], NULL, NULL, 55, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is carried out via a heat pump and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'dikaiarxou-7-06', 'apartment', '{6}'::smallint[], NULL, NULL, 55, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling & heating is via a heat pump and radiators.', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/08.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/09.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/10.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/11.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/12.jpg', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'photo', '/images/dikaiarxou-79-pagrati/13.jpg', 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/02.jpg', 'Α1', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/03.jpg', 'Β2', 2, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/04.jpg', 'Γ2', 3, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/05.jpg', 'Ε1', 5, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/06.jpg', 'Ε2', 5, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'dikaiarxou-79-pagrati'), 'plan', '/images/dikaiarxou-79-pagrati/07.jpg', 'ΣΤ2', 6, 60);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-01' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-02' AND m.plan_code = 'Β2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-03' AND m.plan_code = 'Γ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-04' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-05' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'dikaiarxou-7-06' AND m.plan_code = 'ΣΤ2';

-- Ολύμπου 23, Βριλήσσια
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('olympou-23-vrilhssia', true, 'Ολύμπου 23', NULL, (SELECT id FROM site.areas WHERE name_el = 'Βριλήσσια'), 'new-build', 'Α',
  'Ανέγερση δύο τριώροφων Οικοδομών με Υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Construction of two three-story buildings with a basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Ολύμπου 23, Βριλήσσια', NULL, NULL, NULL, 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-01', 'apartment', '{0}'::smallint[], 'Ισόγειο 1', 'Ground floor 1', 146, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, 2 μπάνια & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, kitchen, living room, sitting room, dining room, 2 bathrooms & a basement Play Room. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-02', 'apartment', '{0}'::smallint[], 'Ισόγειο 2', 'Ground floor 2', 128, 2, 'available', 440000,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, μπάνιo, wc & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ και αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room, a bathroom, wc & a basement Play Room. It has a parking space and a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-03', 'apartment', '{0}'::smallint[], 'Ισόγειο 3', 'Ground floor 3', 109, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-04', 'apartment', '{0}'::smallint[], 'Ισόγειο 4', 'Ground floor 4', 89, 2, 'available', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, μπάνιο & wc. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room, bathroom & a wc. There is the possibility of exclusive use of the garden as well as the possibility of a swimming pool. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-05', 'apartment', '{0}'::smallint[], 'Ισόγειο 5', 'Ground floor 5', 146, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, 2 μπάνια & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, kitchen, living room, sitting room, dining room, 2 bathrooms & a basement Play Room. There is the possibility of exclusive use of the garden as well as the possibility of a swimming pool. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-06', 'apartment', '{0}'::smallint[], 'Ισόγειο 6', 'Ground floor 6', 128, 2, 'available', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, μπάνια, wc & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room, bathroom, wc & a basement Play Room. There is the possibility of exclusive use of the garden as well as the possibility of a swimming pool. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-07', 'apartment', '{0}'::smallint[], 'Ισόγειο 7', 'Ground floor 7', 149, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, μπάνιo, wc & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, kitchen, living room, sitting room, dining room, bathroom, wc & a basement Play Room.It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-08', 'apartment', '{0}'::smallint[], 'Ισόγειο 8', 'Ground floor 8', 129, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, μπάνιο, wc & υπόγειο Play Room. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room, bathroom, wc & a basement Play Room.It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-09', 'apartment', '{1}'::smallint[], NULL, NULL, 104, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 90);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-10', 'apartment', '{1}'::smallint[], NULL, NULL, 91, 2, 'available', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 100);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-11', 'apartment', '{1,2}'::smallint[], NULL, NULL, 163, 5, 'available', 675000,
  'Αποτελείται από 5 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και 3 μπάνια. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 5 bedrooms, a living room, a kitchen-dining room and threee bathrooms. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 110);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-12', 'apartment', '{1,2}'::smallint[], NULL, NULL, 135, 4, 'available', 555000,
  'Αποτελείται από 4 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, γραφείο, 2 μπάνια & 1 w.c. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 4 bedrooms, kitchen, living room, sitting room, office, 2 bathrooms & 1 w.c. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 120);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-13', 'apartment', '{2}'::smallint[], NULL, NULL, 102, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, 1 μπάνιο & 1 w.c. . Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, kitchen, living room, sitting room, dining room, 1 bathroom & 1 w.c. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 130);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'olympou-23-v-14', 'apartment', '{2}'::smallint[], NULL, NULL, 92, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία, 1 μπάνιο & 1 w.c. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room, 1 bathroom & 1 w.c. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is provided through an underfloor system with a heat pump and cooling with a fan coil units.', 140);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/02.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/04.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/06.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/10.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/12.png', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/14.jpg', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/16.jpg', 80);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/29.jpg', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/30.jpg', 100);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/31.jpg', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'photo', '/images/olympou-23-vrilhssia/32.jpg', 120);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/03.jpg', 'ΙΣ1', 0, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/05.jpg', 'ΙΣ2', 0, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/07.jpg', 'ΙΣ3', 0, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/08.png', 'ΙΣ4', 0, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/09.jpg', 'ΙΣ5', 0, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/11.png', 'ΙΣ6', 0, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/13.jpg', 'ΙΣ7', 0, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/15.jpg', 'ΙΣ8', 0, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/17.jpg', 'Α1', 1, 90);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/18.png', 'Α2', 1, 100);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/19.jpg', 'Α3', 1, 110);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/21.png', 'Α6', 1, 120);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/23.png', 'Α7', 1, 130);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/25.png', 'Α8', 1, 140);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/27.jpg', 'Β1', 2, 150);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/28.jpg', 'Β2', 2, 160);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/20.jpg', 'Β3', 2, 170);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/22.png', 'Β6', 2, 180);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/24.png', 'Β7', 2, 190);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'olympou-23-vrilhssia'), 'plan', '/images/olympou-23-vrilhssia/26.png', 'Β8', 2, 200);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-01' AND m.plan_code = 'ΙΣ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-02' AND m.plan_code = 'ΙΣ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-03' AND m.plan_code = 'ΙΣ3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-04' AND m.plan_code = 'ΙΣ4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-05' AND m.plan_code = 'ΙΣ5';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-06' AND m.plan_code = 'ΙΣ6';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-07' AND m.plan_code = 'ΙΣ7';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-08' AND m.plan_code = 'ΙΣ8';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-09' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-10' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-11' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-11' AND m.plan_code = 'Β3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-12' AND m.plan_code = 'Α8';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-12' AND m.plan_code = 'Β8';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-13' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'olympou-23-v-14' AND m.plan_code = 'Β2';

-- Καλλιρρόης 80, Κουκάκι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('kalirrois-80-koukaki', true, 'Καλλιρρόης 80', NULL, (SELECT id FROM site.areas WHERE name_el = 'Κουκάκι'), 'new-build', 'Α',
  'Εξαώροφη πολυκατοικία με κατάστημα στο ισόγειο & δώμα.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Six-storey apartment building with shop on the ground floor.
Energy class A.
High standard construction.
Delivery under construction.',
  'Καλλιρρόης 80, Κουκάκι', NULL, NULL, NULL, 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'kalirrois-80-01', 'apartment', '{1}'::smallint[], NULL, NULL, 62, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'kalirrois-80-02', 'apartment', '{1}'::smallint[], NULL, NULL, 42, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 1bedroom, a living room, a kitchen-dining room, a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'kalirrois-80-03', 'apartment', '{5}'::smallint[], NULL, NULL, 108, 3, 'available', 425000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'kalirrois-80-04', 'apartment', '{6}'::smallint[], NULL, NULL, 105, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is via a boiler and radiators.', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/02.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/03.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/04.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/05.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/06.jpg', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/07.jpg', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/08.jpg', 80);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/09.jpg', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/10.jpg', 100);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/11.jpg', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/12.jpg', 120);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/13.jpg', 130);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/14.jpg', 140);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/15.jpg', 150);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/16.jpg', 160);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/17.jpg', 170);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/18.jpg', 180);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/19.jpg', 190);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/20.jpg', 200);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/21.jpg', 210);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/22.jpg', 220);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/23.jpg', 230);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/24.jpg', 240);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/25.jpg', 250);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/26.jpg', 260);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/27.jpg', 270);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/28.jpg', 280);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/29.jpg', 290);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/30.jpg', 300);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/31.jpg', 310);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kalirrois-80-koukaki'), 'photo', '/images/kalirrois-80-koukaki/32.jpg', 320);

-- Βεργίνας 130, Άγιος Δημήτριος
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('verginas-130-agios-dimitrios', true, 'Βεργίνας 130', NULL, (SELECT id FROM site.areas WHERE name_el = 'Άγιος Δημήτριος'), 'new-build', 'Α',
  'Πενταώροφη πολυκατοικία επί pilotis με υπόγειο & σοφίτα.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Five-storey apartment building with loft & basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Βεργίνας 130, Άγιος Δημήτριος', NULL, NULL, NULL, 90);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-01', 'apartment', '{1}'::smallint[], NULL, NULL, 69, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-02', 'apartment', '{4}'::smallint[], NULL, NULL, 81, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-03', 'apartment', '{4}'::smallint[], NULL, NULL, 90, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-04', 'loft-apartment', '{5,6}'::smallint[], NULL, NULL, 98, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-05', 'loft-apartment', '{5,6}'::smallint[], NULL, NULL, 114, 3, 'available', 440000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει δύο θέσεις πάρκινγκ (μία στο υπόγειο και μία στο ισόγειο-pilotis), αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has two parking spaces (one in the underground parking area and one in the ground-floor covered parking - pilotis), a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'verginas-130-06', 'loft-apartment', '{5,6}'::smallint[], NULL, NULL, 77, 2, 'available', 295000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο υπόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για ηλιακό θερμοσίφωνα & για a/c για ψύξη. H θέρμανση πραγματοποιείται μέσω λέβητα φυσικού αερίου και θερμαντικών σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space in the underground parking area, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a solar water heater & for a/c for cooling. Heating is provided by a natural gas boiler and radiators.', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'photo', '/images/verginas-130-agios-dimitrios/01.png', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'photo', '/images/verginas-130-agios-dimitrios/11.png', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'photo', '/images/verginas-130-agios-dimitrios/12.png', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'photo', '/images/verginas-130-agios-dimitrios/13.png', 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/02.jpg', 'Α2', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/03.jpg', 'Δ1', 4, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/04.jpg', 'Δ2', 4, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/05.png', 'Ε1', 5, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/07.jpg', 'Ε2', 5, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/09.png', 'Ε3Β', 5, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/06.png', 'ΣΤ1', 6, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/08.jpg', 'ΣΤ2', 6, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'verginas-130-agios-dimitrios'), 'plan', '/images/verginas-130-agios-dimitrios/10.png', 'ΣΤ3', 6, 90);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-01' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-02' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-03' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-04' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-04' AND m.plan_code = 'ΣΤ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-05' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-05' AND m.plan_code = 'ΣΤ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-06' AND m.plan_code = 'Ε3Β';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'verginas-130-06' AND m.plan_code = 'ΣΤ3';

-- Κέκροπος 4-6, Καλλιθέα
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('kekropos-4-6-kallithea', true, 'Κέκροπος 4-6', NULL, (SELECT id FROM site.areas WHERE name_el = 'Καλλιθέα'), 'new-build', 'Α',
  'Νέο εξαώροφο κτήριο κατοικιών με υπόγειο, pilotis και σοφίτες.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Νew six-storey apartment building with basemen, pilotis and lofts.
Energy class A.
High standard construction.
Delivery under construction.',
  'Κέκροπος 4-6, Καλλιθέα', NULL, NULL, NULL, 100);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-01', 'apartment', '{1}'::smallint[], NULL, NULL, 55, 1, 'available', 190000,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-02', 'apartment', '{1}'::smallint[], NULL, NULL, 53, 1, 'available', 178000,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 1 bedroom, living room, kitchen, dining room and bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-03', 'apartment', '{2}'::smallint[], NULL, NULL, 90, 2, 'available', 325000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-04', 'apartment', '{4}'::smallint[], NULL, NULL, 102, 3, 'available', 375000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-05', 'apartment', '{4}'::smallint[], NULL, NULL, 92, 3, 'available', 340000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-06', 'apartment', '{5}'::smallint[], NULL, NULL, 102, 3, 'available', 386000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-07', 'apartment', '{5}'::smallint[], NULL, NULL, 92, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-08', 'apartment', '{6,7}'::smallint[], NULL, NULL, 110, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'kekropos-4-6-09', 'apartment', '{6,7}'::smallint[], NULL, NULL, 80, 2, 'available', 310000,
  'Αποτελείται απο 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και δύο μπάνια. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξύλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Υπάρχει αναμονή για a/c για ψύξη & η θέρμανση πραγματοποιείται μέσω αντλίας θερμότητας και σωμάτων.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and two bathrooms. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. There is a standby for a/c for cooling & heating is via a heat pump and radiators.', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/01.png', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/07.png', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/08.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/10.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/12.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/13.png', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/14.png', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'photo', '/images/kekropos-4-6-kallithea/15.png', 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/02.png', 'Α2', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/03.png', 'Α3', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/04.png', 'Β3', 2, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/05.png', 'Δ1', 4, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/06.jpg', 'Δ2', 4, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/05.png', 'Ε1', 5, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/06.jpg', 'Ε2', 5, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/09.jpg', 'ΣΤ1', 6, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/11.jpg', 'ΣΤ2', 6, 90);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/09.jpg', 'Ζ1', 7, 100);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kekropos-4-6-kallithea'), 'plan', '/images/kekropos-4-6-kallithea/11.jpg', 'Ζ2', 7, 110);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-01' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-02' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-03' AND m.plan_code = 'Β3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-04' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-05' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-06' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-07' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-08' AND m.plan_code = 'ΣΤ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-08' AND m.plan_code = 'Ζ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-09' AND m.plan_code = 'ΣΤ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'kekropos-4-6-09' AND m.plan_code = 'Ζ2';

-- Καλλιρρόης 100, Κουκάκι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('kallirrois-100-koykaki', true, 'Καλλιρρόης 100', NULL, (SELECT id FROM site.areas WHERE name_el = 'Κουκάκι'), 'resale', 'Β',
  'Επιπλωμένο διαμέρισμα προς πώληση στο Κουκάκι, 107 τμ. -6ος όροφος. -Ενεργειακή κλάση Β. -Αυτόνομη θέρμανση με φυσικό αέριο. -Έτος κατασκευής 2008. -Πολυτελής κατασκευή -Διαθέτει 3 υπνοδωμάτια (το ένα master), κουζίνα, 2 μπάνια, 1 w.c., σαλόνι
χωλ, κουζίνα, αποθήκη 5τ.μ., υπόγειο parking 10τ.μ. -Θέα Φιλοπάππου. -Τιμή πώλησης 380.000€', 'Furnished apartment for sale in Koukaki, 107 m2.
6th floor.
Energy class B.
Independent heating with natural gas. -Year of construction 2008. -High class construction. -It has 3 bedrooms (one master), kitchen, 2 bathrooms, 1 w.c., living room
hall, kitchen, storage room 5 m2, basement parking 10 m2. -Filopappou view. -Sales price 380,000€',
  'Καλλιρρόης 100, Κουκάκι', NULL, NULL, NULL, 110);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'k100', 'apartment', '{6}'::smallint[], NULL, NULL, 107, 3, 'available', 380000,
  '- Επιπλωμένο διαμέρισμα προς πώληση στο Κουκάκι, 107 τμ. -6ος όροφος. -Ενεργειακή κλάση Β. -Αυτόνομη θέρμανση με φυσικό αέριο. -Έτος κατασκευής 2008. -Πολυτελής κατασκευή -Διαθέτει 3 υπνοδωμάτια (το ένα master), κουζίνα, 2 μπάνια, 1 w.c., σαλόνι - χωλ, κουζίνα, αποθήκη 5τ.μ., υπόγειο parking 10τ.μ. -Θέα Φιλοπάππου. -Τιμή πώλησης 380.000€', '- Furnished apartment for sale in Koukaki, 107 m2. - 6th floor. - Energy class B. - Independent heating with natural gas. -Year of construction 2008. -High class construction. -It has 3 bedrooms (one master), kitchen, 2 bathrooms, 1 w.c., living room - hall, kitchen, storage room 5 m2, basement parking 10 m2. -Filopappou view. -Sales price 380,000€', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/02.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/03.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/04.jpg', 40);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/05.jpg', 50);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/06.jpg', 60);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/07.jpg', 70);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/08.jpg', 80);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/09.jpg', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/10.jpg', 100);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/11.jpg', 110);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/12.jpg', 120);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/13.jpg', 130);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/14.jpg', 140);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/15.jpg', 150);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/16.jpg', 160);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'kallirrois-100-koykaki'), 'photo', '/images/kallirrois-100-koykaki/17.jpg', 170);

-- Ευκαλύπτων 7, Μαρούσι
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('ευκαλυπτων-7-μαρουσι', true, 'Ευκαλύπτων 7', NULL, (SELECT id FROM site.areas WHERE name_el = 'Μαρούσι'), 'new-build', 'Α',
  'Τετραώροφη πολυκατοικία με σοφίτα,pilotis & υπόγειο.
Ενεργειακή κλάση Α.
Κατασκευή υψηλών προδιαγραφών.
Παράδοση υπό κατασκευή.', 'Four-storey apartment building with loft,pilotis & basement.
Energy class A.
High standard construction.
Delivery under construction.',
  'Ευκαλύπτων 7, Μαρούσι', NULL, NULL, NULL, 120);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-01', 'apartment', '{1}'::smallint[], NULL, NULL, 50, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία & μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο και αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 1 bedroom, kitchen, living room, sitting room, dining room & bathroom. It has a parking space on the groundfloor and a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-02', 'apartment', '{1}'::smallint[], NULL, NULL, 60, 2, 'available', 258000,
  'Αποτελείται από 2 υπνοδωμάτια, κουζίνα, σαλόνι, καθιστικό, τραπεζαρία & μπάνιo. Διαθέτει θέση πάρκινγκ και αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, kitchen, living room, sitting room, dining room & bathroom. It has a parking space and storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling is via fan coil units.', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-03', 'apartment', '{2}'::smallint[], NULL, NULL, 90, 3, 'available', 400500,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιο και wc. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο,ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, bathroom & wc. It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-04', 'apartment', '{2}'::smallint[], NULL, NULL, 60, 2, 'available', 267000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία & μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, a living room, a kitchen-dining room & a bathroom . It has a parking space on the ground floor & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-05', 'apartment', '{3}'::smallint[], NULL, NULL, 90, 3, 'available', 405000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, wc & μπάνιο. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3bedrooms, a living room, a kitchen-dining room , wc & a bathroom . It has a parking space & a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-06', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 110, 3, 'available', 550000,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία & 2 μπάνια. Διαθέτει δύο θέσεις πάρκινγκ, μία στο υπόγειο και μία στο ισόγειο & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, living room, kitchen, dining room,& 2 bathrooms. It has two parking spaces, one in the basement and one on the ground floor & storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-07', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 140, 4, 'available', 686000,
  'Αποτελείται από 4 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, wc & 2 μπάνια. Διαθέτει δύο θέσεις πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 4 bedrooms, living room, kitchen, dining room, wc & 2 bathrooms. It has two parking spaces & storage in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-08', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 80, 2, 'available', 392000,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, χώρο για γραφείο & 2 μπάνια. Διαθέτει θέση πάρκινγκ & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 2 bedrooms, living room, kitchen, dining room, space for an office & two bathrooms. It has a parking space & storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'ευκαλυπτων-7-09', 'maisonette', '{4,5}'::smallint[], NULL, NULL, 95, 3, 'available', 465500,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, & 2 μπάνια. Διαθέτει 2 θέσεις πάρκινγκ μια στο ισόγειο και μια στο υπόγειο & αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil units.', 'It consists of 3 bedrooms, living room, kitchen, dining room, & 2 bathrooms. It has 2 parking spaces, one on the ground floor and one in the basement & storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, provision for an electric vehicle charger. Installation and connection of a solar water heater is provided. Heating is via an underfloor system with a heat pump and cooling with fan coil units.', 90);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'photo', '/images/ευκαλυπτων-7-μαρουσι/01.jpg', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'photo', '/images/ευκαλυπτων-7-μαρουσι/13.jpg', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'photo', '/images/ευκαλυπτων-7-μαρουσι/14.jpg', 30);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'photo', '/images/ευκαλυπτων-7-μαρουσι/15.jpg', 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/04.jpg', 'Α2', 1, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/02.jpg', 'Α3', 1, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/03.jpg', 'Α4', 1, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/04.jpg', 'Β2', 2, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/02.jpg', 'Β3', 2, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/03.jpg', 'Β4', 2, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/04.jpg', 'Γ2', 3, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/02.jpg', 'Γ3', 3, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/03.jpg', 'Γ4', 3, 90);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/05.jpg', 'Δ1', 4, 100);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/07.jpg', 'Δ2', 4, 110);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/09.jpg', 'Δ3', 4, 120);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/11.jpg', 'Δ4', 4, 130);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/06.jpg', 'Ε1', 5, 140);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/08.jpg', 'Ε2', 5, 150);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/10.jpg', 'Ε3', 5, 160);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'ευκαλυπτων-7-μαρουσι'), 'plan', '/images/ευκαλυπτων-7-μαρουσι/12.jpg', 'Ε4', 5, 170);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-01' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-02' AND m.plan_code = 'Α4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-03' AND m.plan_code = 'Β2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-04' AND m.plan_code = 'Β4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-05' AND m.plan_code = 'Γ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-06' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-06' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-07' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-07' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-08' AND m.plan_code = 'Δ3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-08' AND m.plan_code = 'Ε3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-09' AND m.plan_code = 'Δ4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'ευκαλυπτων-7-09' AND m.plan_code = 'Ε4';

-- Μαρκοπουλιώτη 26-32, Νέος Κόσμος
INSERT INTO site.properties (slug, slug_locked, address_el, address_en, area_id, kind, energy_class,
  description_el, description_en, seo_title_el, seo_title_en, seo_description_el, seo_description_en, sort_order)
VALUES ('markopoulioti-26-32-neos-kosmos', true, 'Μαρκοπουλιώτη 26-32', NULL, (SELECT id FROM site.areas WHERE name_el = 'Νέος Κόσμος'), 'new-build', 'Α',
  '', NULL,
  'Μαρκοπουλιώτη 26-32, Νέος Κόσμος', NULL, NULL, NULL, 130);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-01', 'apartment', '{0}'::smallint[], NULL, NULL, 69, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία, και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 10);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-02', 'apartment', '{0}'::smallint[], NULL, NULL, 64, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedrooms, a living room, a kitchen-dining room, and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 20);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-03', 'apartment', '{0}'::smallint[], NULL, NULL, 61, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 30);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-04', 'apartment', '{1}'::smallint[], NULL, NULL, 63, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία, και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 40);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-05', 'apartment', '{1}'::smallint[], NULL, NULL, 82, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 2 bedrooms, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 50);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-06', 'apartment', '{1}'::smallint[], NULL, NULL, 60, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 60);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-07', 'apartment', '{1}'::smallint[], NULL, NULL, 63, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 70);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-08', 'apartment', '{2}'::smallint[], NULL, NULL, 38, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιο, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 80);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-09', 'apartment', '{2}'::smallint[], NULL, NULL, 63, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 2 bedrooms, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 90);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-10', 'apartment', '{3}'::smallint[], NULL, NULL, 60, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 100);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-11', 'apartment', '{3}'::smallint[], NULL, NULL, 75, 2, 'sold', NULL,
  'Αποτελείται από 2 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία μπάνιo και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 2 bedroomσ, a living room, a kitchen-dining room, a bathroom and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 110);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-12', 'apartment', '{3}'::smallint[], NULL, NULL, 53, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιo. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 120);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-13', 'apartment', '{4}'::smallint[], NULL, NULL, 132, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία 2 μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 3 bedrooms, a living room, a kitchen-dining room 2 bathrooms and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 130);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-14', 'apartment', '{4}'::smallint[], NULL, NULL, 95, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 3 bedrooms, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 140);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-15', 'apartment', '{4}'::smallint[], NULL, NULL, 60, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 150);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-16', 'apartment', '{4}'::smallint[], NULL, NULL, 53, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 160);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-17', 'apartment', '{5}'::smallint[], NULL, NULL, 122, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, 2 μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, two bathrooms and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 170);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-18', 'apartment', '{5}'::smallint[], NULL, NULL, 107, 3, 'sold', NULL,
  'Αποτελείται από 3 υπνοδωμάτια, καθιστικό, κουζίνα, τραπεζαρία, 2 μπάνια και wc. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 3 bedrooms, a living room, a kitchen-dining room, two bathrooms and a wc. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 180);
INSERT INTO site.units (property_id, legacy_id, unit_type, floors, floor_label_el, floor_label_en, sqm, bedrooms, status, price_eur, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'markopouliot-19', 'apartment', '{5}'::smallint[], NULL, NULL, 53, 1, 'sold', NULL,
  'Αποτελείται από 1 υπνοδωμάτιo, καθιστικό, κουζίνα, τραπεζαρία και μπάνιο. Διαθέτει θέση πάρκινγκ στο ισόγειο, αποθήκη στο υπόγειο, ξυλινα πατώματα, θερμομονωτικά κουφώματα, σίτες, ενεργειακούς υαλοπίνακες, κέλυφος εξωτερικής θερμομόνωσης, παροχή για φορτιστή ηλεκτρικού οχήματος. Προβλέπεται τοποθέτηση και σύνδεση ηλιακού θερμοσίφωνα. Η θέρμανση πραγματοποιείται μέσω ενδοδαπέδιου συστήματος με αντλία θερμότητας και η ψύξη με fan coil', 'It consists of 1 bedroom, a living room, a kitchen-dining room, two bathrooms and a bathroom. It has a parking space on the ground floor, a storage room in the basement, wooden floors, thermally insulated frames, screens, energy-efficient glazing, external thermal insulation shell, power supply for an electric vehicle charger. Installation and connection of a solar water heater is planned. Heating is carried out through an underfloor system with a heat pump and cooling with a fan coil', 190);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'photo', '/images/markopoulioti-26-32-neos-kosmos/01.png', 10);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'photo', '/images/markopoulioti-26-32-neos-kosmos/21.png', 20);
INSERT INTO site.media (property_id, kind, url, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'photo', '/images/markopoulioti-26-32-neos-kosmos/22.png', 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/02.jpg', 'Ι1', 0, 10);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/03.jpg', 'Ι2', 0, 20);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/04.jpg', 'Ι3', 0, 30);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/05.jpg', 'Α1', 1, 40);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/06.jpg', 'Α2', 1, 50);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/07.jpg', 'Α3', 1, 60);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/08.jpg', 'Α5', 1, 70);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/09.jpg', 'Β1', 2, 80);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/10.jpg', 'Β5', 2, 90);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/11.jpg', 'Γ1', 3, 100);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/12.jpg', 'Γ4', 3, 110);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/13.jpg', 'Γ6', 3, 120);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/14.jpg', 'Δ1', 4, 130);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/15.jpg', 'Δ2', 4, 140);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/16.jpg', 'Δ3', 4, 150);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/17.jpg', 'Δ4', 4, 160);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/18.jpg', 'Ε1', 5, 170);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/19.jpg', 'Ε2', 5, 180);
INSERT INTO site.media (property_id, kind, url, plan_code, plan_floor, sort_order) VALUES ((SELECT id FROM site.properties WHERE slug = 'markopoulioti-26-32-neos-kosmos'), 'plan', '/images/markopoulioti-26-32-neos-kosmos/20.jpg', 'Ε3', 5, 190);
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-01' AND m.plan_code = 'Ι1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-02' AND m.plan_code = 'Ι2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-03' AND m.plan_code = 'Ι3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-04' AND m.plan_code = 'Α1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-05' AND m.plan_code = 'Α2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-06' AND m.plan_code = 'Α3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-07' AND m.plan_code = 'Α5';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-08' AND m.plan_code = 'Β1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-09' AND m.plan_code = 'Β5';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-10' AND m.plan_code = 'Γ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-11' AND m.plan_code = 'Γ4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-12' AND m.plan_code = 'Γ6';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-13' AND m.plan_code = 'Δ1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-14' AND m.plan_code = 'Δ2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-15' AND m.plan_code = 'Δ3';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-16' AND m.plan_code = 'Δ4';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-17' AND m.plan_code = 'Ε1';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-18' AND m.plan_code = 'Ε2';
INSERT INTO site.unit_plans (unit_id, media_id)
  SELECT u.id, m.id FROM site.units u JOIN site.media m ON m.property_id = u.property_id
  WHERE u.legacy_id = 'markopouliot-19' AND m.plan_code = 'Ε3';

-- Ολοκληρωμένα: Παπάγου
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('papagou', true, (SELECT id FROM site.areas WHERE name_el = 'Παπάγου'), 10);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'ΧΕΙΜΑΡΡΑΣ 36, ΠΑΠΑΓΟΥ', '36 CHEIMARRAS ST, PAPAGOU', 'ΤΕΤΡΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ, ΓΚΑΡΑΖ, ΣΟΦΙΤΑ, ΣΤΕΓΗ & ΔΩΜΑ', 'FOUR-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT, GARAGE, ATTIC, PITCHED ROOF & ROOF TERRACE', 'Σύγχρονο κτήριο σε πολύ ήσυχο σημείο στην περιοχή του Παπάγου. Ο σχεδιασμός του κτηρίου βασίζεται στην βέλτιστη αξιοποίηση του οικοπέδου και του προσανατολισμού. Αποτελείται από τέσσερις ορόφους και συνολικά πέντε διαμερίσματα. Στο τελευταίο επίπεδο βρίσκεται μια μεζονέτα, τα χαρακτηριστικά της οποίας παρουσιάζονται στο παρακάτω σχέδιο.', 'A contemporary building on a very quiet spot in Papagou. The design makes the best possible use of the plot and its orientation. It has four floors and five apartments in total. On the top level there is a maisonette, whose features are shown in the drawing below.', 10);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'ΕΘΝΙΚΗΣ ΑΜΥΝΗΣ 1, ΠΑΠΑΓΟΥ', '1 ETHNIKIS AMYNIS AVE, PAPAGOU', 'ΠΕΝΤΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΔΩΜΑ', 'FIVE-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & ROOF TERRACE', NULL, NULL, 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/03.jpg', 30);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/04.jpg', 40);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/05.jpg', 50);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/06.jpg', 60);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/07.jpg', 70);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/08.jpg', 80);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/09.jpg', 90);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'papagou'), 'photo', '/images/papagou/10.jpg', 100);

-- Ολοκληρωμένα: Χολαργός
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('xolargos', true, (SELECT id FROM site.areas WHERE name_el = 'Χολαργός'), 20);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'ΠΥΘΑΓΟΡΑ 20, ΧΟΛΑΡΓΟΣ', '20 PYTHAGORA ST, CHOLARGOS', 'ΤΕΤΡΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΔΩΜΑ', 'FOUR-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & ROOF TERRACE', 'Πρόκειται για ένα κτήριο κατοικιών τοποθετημένο στην περιοχή του Χολαργού. Με σύμμαχο τον άριστο προσανατολισμό, δημιουργήθηκε ένα κτήριο με λευκά γραμμικά οριζόντια στοιχεία και ξύλινα περσιδωτά χωρίσματα. Η μέγιστη ενεργειακή κατάταξη του κτηρίου επιτυγχάνεται με την χρήση ενεργειακών κουφωμάτων, ηλιακών συλλεκτών, θερμοπρόσοψης 10εκ., καθώς και αντλιών θερμότητας ψύξης θέρμανσης.', 'A residential building in Cholargos. With an excellent orientation on its side, it was built with white linear horizontal elements and wooden louvred screens. The building reaches the top energy rating through energy-efficient frames, solar collectors, 10 cm external wall insulation, and heat pumps for cooling and heating.', 10);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'ΑΝΑΣΤΑΣΕΩΣ 55, ΧΟΛΑΡΓΟΣ', '55 ANASTASEOS ST, CHOLARGOS', 'ΤΕΤΡΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΔΩΜΑ', 'FOUR-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & ROOF TERRACE', NULL, NULL, 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/03.jpg', 30);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/04.jpg', 40);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/05.jpg', 50);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/06.jpg', 60);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/07.jpg', 70);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'xolargos'), 'photo', '/images/xolargos/08.jpg', 80);

-- Ολοκληρωμένα: Ζωγράφου
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('zografou', true, (SELECT id FROM site.areas WHERE name_el = 'Ζωγράφου'), 30);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'zografou'), 'ΛΟΧΑΓΟΥ ΓΙΑΝΝΟΠΟΥΛΟΥ 11, ΖΩΓΡΑΦΟΥ', '11 LOCHAGOU GIANNOPOULOU ST, ZOGRAFOU', 'ΕΞΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ, ΓΚΑΡΑΖ, ΠΑΤΑΡΙ & ΔΩΜΑ', 'SIX-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT, GARAGE, MEZZANINE & ROOF TERRACE', NULL, NULL, 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'zografou'), 'photo', '/images/zografou/01.jpg', 10);

-- Ολοκληρωμένα: Νίκαια
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('nikea', true, (SELECT id FROM site.areas WHERE name_el = 'Νίκαια'), 40);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'nikea'), 'ΑΔΡΑΜΥΤΙΟΥ 15, ΝΙΚΑΙΑ', '15 ADRAMYTIOU ST, NIKAIA', 'ΠΕΝΤΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΔΩΜΑ', 'FIVE-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & ROOF TERRACE', NULL, NULL, 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'nikea'), 'photo', '/images/nikea/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'nikea'), 'photo', '/images/nikea/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'nikea'), 'photo', '/images/nikea/03.jpg', 30);

-- Ολοκληρωμένα: Κερατσίνι
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('keratsini', true, (SELECT id FROM site.areas WHERE name_el = 'Κερατσίνι'), 50);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'keratsini'), 'ΔΕΛΦΩΝ 13 & ΙΘΑΚΗΣ, ΚΕΡΑΤΣΙΝΙ', '13 DELFON ST & ITHAKIS ST, KERATSINI', 'ΠΕΝΤΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΔΩΜΑ', 'FIVE-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & ROOF TERRACE', NULL, NULL, 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'keratsini'), 'photo', '/images/keratsini/01.jpg', 10);

-- Ολοκληρωμένα: Αγία Παρασκευή
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('agia-paraskevi', true, (SELECT id FROM site.areas WHERE name_el = 'Αγία Παρασκευή'), 60);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'ΤΕΡΨΙΘΕΑΣ 27, ΑΓ. ΠΑΡΑΣΚΕΥΗ', '27 TERPSITHEAS ST, AGIA PARASKEVI', 'ΠΕΝΤΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ.', 'FIVE-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT.', 'Σύγχρονο κτήριο σε πολύ ήσυχο σημείο στην περιοχή της Αγίας Παρασκευής. Ο σχεδιασμός του κτιρίου βασίζεται στην βέλτιστη αξιοποίηση του οικοπέδου και του προσανατολισμού. Αποτελείται από πέντε ορόφους και συνολικά εφτά διαμερίσματα.', 'A contemporary building on a very quiet spot in Agia Paraskevi. The design makes the best possible use of the plot and its orientation. It has five floors and seven apartments in total.', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/03.jpg', 30);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/04.jpg', 40);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/05.jpg', 50);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/06.jpg', 60);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/07.jpg', 70);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/27.jpg', 80);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/28.jpg', 90);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/10.jpg', 100);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/30.jpg', 110);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/12.jpg', 120);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/29.jpg', 130);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/32.jpg', 140);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/15.jpg', 150);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/34.jpg', 160);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/17.jpg', 170);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/kouzines/33.jpg', 180);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/25.jpg', 190);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/20.jpg', 200);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/33.jpg', 210);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/27.jpg', 220);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/23.jpg', 230);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/21.jpg', 240);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/22.jpg', 250);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/23.jpg', 260);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/29.jpg', 270);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/28.jpg', 280);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/wc/24.jpg', 290);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/28.jpg', 300);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/30.jpg', 310);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/29.jpg', 320);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/31.jpg', 330);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/34.jpg', 340);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/35.jpg', 350);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/36.png', 360);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/upnodomatia/32.jpg', 370);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/38.jpg', 380);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/39.jpg', 390);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/40.jpg', 400);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'agia-paraskevi'), 'photo', '/images/agia-paraskevi/41.jpg', 410);

-- Ολοκληρωμένα: Πεύκη
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('peukh', true, (SELECT id FROM site.areas WHERE name_el = 'Πεύκη'), 70);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'ΚΩΝΣΤΑΝΤΙΝΟΥΠΟΛΕΩΣ 67, ΠΕΥΚΗ', '67 KONSTANTINOUPOLEOS ST, PEFKI', 'ΤΕΤΡΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ΕΠΙ PILOTIS ΜΕ ΥΠΟΓΕΙΟ & ΠΑΤΑΡΙ.', 'FOUR-STOREY APARTMENT BUILDING ON PILOTIS WITH BASEMENT & MEZZANINE.', 'Σύγχρονο κτήριο σε πολύ ήσυχο σημείο στην περιοχή της Πεύκης. Διαθέτει ένα διαμέρισμα ανά όροφο, υπόγειες αποθήκες και ισόγειες θέσεις στάθμευσης.', 'A contemporary building on a very quiet spot in Pefki. One apartment per floor, storage rooms in the basement and parking spaces at ground level.', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/03.jpg', 30);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/04.jpg', 40);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/05.jpg', 50);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/06.jpg', 60);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/07.jpg', 70);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/08.jpg', 80);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/09.jpg', 90);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/10.jpg', 100);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/11.jpg', 110);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/12.jpg', 120);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/13.jpg', 130);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/14.jpeg', 140);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/15.jpg', 150);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/16.jpg', 160);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/17.jpg', 170);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/18.jpg', 180);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/19.jpg', 190);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/20.jpg', 200);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/21.jpg', 210);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/22.jpg', 220);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/23.jpg', 230);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/24.jpg', 240);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/25.jpg', 250);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/26.jpg', 260);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/27.jpg', 270);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/28.jpg', 280);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/29.jpg', 290);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/30.jpg', 300);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/31.jpg', 310);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/32.jpg', 320);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/33.jpg', 330);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/34.jpg', 340);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/35.jpg', 350);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/36.jpg', 360);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/37.jpg', 370);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/38.jpg', 380);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/39.jpg', 390);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/40.jpg', 400);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/41.jpg', 410);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'peukh'), 'photo', '/images/peukh/42.jpg', 420);

-- Ολοκληρωμένα: Παλαιό Φάληρο
INSERT INTO site.completed_areas (slug, slug_locked, area_id, sort_order) VALUES ('palaio-faliro', true, (SELECT id FROM site.areas WHERE name_el = 'Παλαιό Φάληρο'), 80);
INSERT INTO site.completed_buildings (area_id, address_el, address_en, specs_el, specs_en, description_el, description_en, sort_order)
VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'ΑΙΑΝΤΟΣ 81, ΠΑΛΑΙΟ ΦΑΛΗΡΟ', '81 AIANTOS ST, PALAIO FALIRO', 'ΝΕΑ ΕΠΤΑΩΡΟΦΗ ΠΟΛΥΚΑΤΟΙΚΙΑ ME PILOTIS, ΥΠΟΓΕΙΟ ΚΑΙ ΔΩΜΑ', 'NEW SEVEN-STOREY APARTMENT BUILDING WITH PILOTIS, BASEMENT AND ROOF TERRACE', 'Σύγχρονο κτήριο σε εύκολα προσβάσιμο σημείο στην περιοχή του Παλαιού φαλήρου. Διαθέτει επτά ορόφους και έξι διαμερίσματα, υπόγειες αποθήκες και ισόγειες και υπόγειες θέσεις στάθμευσης.', 'A contemporary building in an easily reached part of Palaio Faliro. It has seven floors and six apartments, storage rooms in the basement, and parking spaces at ground level and below.', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/01.jpg', 10);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/02.jpg', 20);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/03.jpg', 30);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/04.jpg', 40);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/05.jpg', 50);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/06.jpg', 60);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/07.jpg', 70);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/08.jpg', 80);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/09.jpg', 90);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/10.jpg', 100);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/11.jpg', 110);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/12.jpg', 120);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/13.jpg', 130);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/14.jpg', 140);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/15.jpg', 150);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/16.jpg', 160);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/17.jpg', 170);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/18.jpg', 180);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/19.jpg', 190);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/20.jpg', 200);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/21.jpg', 210);
INSERT INTO site.media (completed_area_id, kind, url, sort_order) VALUES ((SELECT id FROM site.completed_areas WHERE slug = 'palaio-faliro'), 'photo', '/images/palaio-faliro/22.jpg', 220);

-- Διαμόρφωση: Σαλόνια
INSERT INTO site.interiors (slug, slug_locked, title_el, title_en, intro_el, intro_en, sort_order)
VALUES ('saloni', true, 'Σαλόνια', 'Living rooms', NULL, NULL, 10);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/01.jpg', 10);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/02.jpg', 20);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/03.jpg', 30);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/04.jpg', 40);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/05.jpg', 50);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/06.jpg', 60);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/07.jpg', 70);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/08.jpg', 80);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/09.jpg', 90);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/10.jpg', 100);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/11.jpg', 110);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/12.jpg', 120);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/13.jpg', 130);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/14.jpg', 140);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/15.jpg', 150);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/16.jpg', 160);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/17.jpg', 170);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/18.jpg', 180);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/19.jpg', 190);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/20.jpg', 200);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'saloni'), 'photo', '/images/saloni/21.jpg', 210);

-- Διαμόρφωση: Κουζίνες
INSERT INTO site.interiors (slug, slug_locked, title_el, title_en, intro_el, intro_en, sort_order)
VALUES ('kouzines', true, 'Κουζίνες', 'Kitchens', NULL, NULL, 20);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/01.jpg', 10);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/02.jpg', 20);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/03.jpg', 30);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/04.jpg', 40);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/05.jpg', 50);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/06.jpg', 60);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/07.jpg', 70);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/08.jpg', 80);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/09.jpg', 90);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/10.jpg', 100);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/11.jpg', 110);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/12.jpg', 120);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/13.jpg', 130);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/14.jpg', 140);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/15.jpg', 150);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/16.jpg', 160);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/17.jpg', 170);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/18.jpg', 180);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/19.jpg', 190);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/20.jpg', 200);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/21.jpg', 210);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/22.jpg', 220);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/23.jpg', 230);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/24.jpg', 240);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/25.jpg', 250);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/26.jpg', 260);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/27.jpg', 270);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/28.jpg', 280);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/29.jpg', 290);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/30.jpg', 300);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/31.png', 310);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/32.jpg', 320);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/33.jpg', 330);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'kouzines'), 'photo', '/images/kouzines/34.jpg', 340);

-- Διαμόρφωση: Μπάνια
INSERT INTO site.interiors (slug, slug_locked, title_el, title_en, intro_el, intro_en, sort_order)
VALUES ('wc', true, 'Μπάνια', 'Bathrooms', NULL, NULL, 30);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/01.jpg', 10);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/02.jpg', 20);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/03.jpg', 30);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/04.jpg', 40);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/05.jpg', 50);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/06.jpg', 60);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/07.jpg', 70);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/08.jpg', 80);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/09.jpg', 90);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/10.jpg', 100);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/11.jpg', 110);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/12.jpg', 120);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/13.jpg', 130);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/14.jpg', 140);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/15.jpg', 150);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/16.jpg', 160);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/17.jpg', 170);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/18.jpg', 180);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/19.jpg', 190);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/20.jpg', 200);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/21.jpg', 210);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/22.jpg', 220);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/23.jpg', 230);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/24.jpg', 240);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/25.jpg', 250);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/26.jpg', 260);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/27.jpg', 270);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/28.jpg', 280);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'wc'), 'photo', '/images/wc/29.jpg', 290);

-- Διαμόρφωση: Υπνοδωμάτια
INSERT INTO site.interiors (slug, slug_locked, title_el, title_en, intro_el, intro_en, sort_order)
VALUES ('upnodomatia', true, 'Υπνοδωμάτια', 'Bedrooms', NULL, NULL, 40);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/01.jpg', 10);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/02.jpg', 20);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/03.jpg', 30);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/04.jpg', 40);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/05.jpg', 50);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/06.jpg', 60);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/07.jpg', 70);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/08.jpg', 80);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/09.jpg', 90);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/10.jpg', 100);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/11.jpg', 110);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/12.jpg', 120);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/13.jpg', 130);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/14.jpg', 140);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/15.jpg', 150);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/16.jpg', 160);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/17.jpg', 170);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/18.jpg', 180);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/19.jpg', 190);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/20.jpg', 200);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/21.jpg', 210);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/22.jpg', 220);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/23.jpg', 230);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/24.jpg', 240);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/25.jpg', 250);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/26.jpg', 260);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/27.jpg', 270);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/28.jpg', 280);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/29.jpg', 290);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/30.jpg', 300);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/31.jpg', 310);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/32.jpg', 320);
INSERT INTO site.media (interior_id, kind, url, sort_order) VALUES ((SELECT id FROM site.interiors WHERE slug = 'upnodomatia'), 'photo', '/images/upnodomatia/33.jpg', 330);

-- Υπηρεσίες
INSERT INTO site.services (title_el, title_en, description_el, description_en, href, sort_order)
VALUES ('Μελέτη & κατασκευή κτηρίων', 'Analysis, design & construction', 'Νέες πολυκατοικίες ενεργειακής κλάσης Α, από το οικόπεδο ως την παράδοση.', 'New energy-class A apartment buildings, from the plot to the handover.', '/pros-polisi', 10);
INSERT INTO site.services (title_el, title_en, description_el, description_en, href, sort_order)
VALUES ('Διαμόρφωση εσωτερικών χώρων', 'Interior design', 'Λύσεις εσωτερικών διαρρυθμίσεων προσαρμοσμένες στις ανάγκες σας.', 'Interior layouts shaped around the way you actually live.', '/projects', 20);
INSERT INTO site.services (title_el, title_en, description_el, description_en, href, sort_order)
VALUES ('Ανακαινίσεις', 'Renovations', 'Ριζικές ανακαινίσεις κατοικιών και ενεργειακή αναβάθμιση.', 'Full home renovations and energy upgrades.', '/katalogos', 30);
INSERT INTO site.services (title_el, title_en, description_el, description_en, href, sort_order)
VALUES ('Ξυλουργικές κατασκευές', 'Wooden constructions', 'Κουζίνες, ντουλάπες και κατασκευές κατά παραγγελία.', 'Kitchens, wardrobes and bespoke joinery.', '/kouzines', 40);

COMMIT;
