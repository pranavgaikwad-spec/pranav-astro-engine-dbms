# Astroverse Module Reference

## 1. Geography Module

File:
schema/01_geography.sql

Purpose:
Stores geographical information including countries, states, cities, coordinates, and timezone-related data used for birth location management.

---

## 2. Person & Birth Module

File:
schema/02_persons.sql

Purpose:
Stores personal details and birth profiles that serve as the foundation for Kundli generation.

---

## 3. Astrology Knowledge Module

File:
schema/03_astrology.sql

Purpose:
Contains the core astrological knowledge base including planets, zodiac signs, houses, nakshatras, yogas, doshas, dashas, gemstones, deities, and related relationships.

---

## 4. Kundli Chart Module

File:
schema/04_charts.sql

Purpose:
Stores generated Kundli charts, planetary positions, and chart-specific astrological calculations.

---

## 5. Prediction Module

File:
schema/05_predictions.sql

Purpose:
Stores prediction logic, compatibility information, planetary influences, and future analysis modules.

---

## 6. Remedies Module

File:
schema/06_remedies.sql

Purpose:
Stores remedies, gemstones, mantras, temples, festivals, donations, fasting practices, and spiritual guidance associated with astrology.

---

## 7. Administration Module

File:
schema/07_admin.sql

Purpose:
Contains database administration components including activity logs, views, triggers, indexes, and maintenance structures.

---

# Module Dependency

Geography
↓
Persons
↓
Birth Profiles
↓
Kundli Charts
↓
Planetary Analysis
↓
Predictions
↓
Remedies

This layered dependency keeps the database modular, scalable, and easy to maintain.
