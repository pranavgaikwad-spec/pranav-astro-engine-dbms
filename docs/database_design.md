# Astroverse Database Design Documentation

## 1. Project Overview

Astroverse is a professional relational database management system designed to model the complete ecosystem of Vedic astrology. The project transforms a vast and interconnected knowledge domain into a structured, normalized, and scalable SQL database using SQLite.

The database has been engineered to demonstrate professional database design principles including relational modeling, normalization, referential integrity, indexing, query optimization, views, triggers, and modular schema organization.

---

# 2. Database Architecture

Astroverse follows a modular architecture where every major domain is separated into dedicated schema modules while remaining connected through foreign key relationships.

Current architecture:

- Geography Module
- Person & Birth Module
- Astrology Knowledge Module
- Kundli Chart Module
- Prediction Module
- Remedies Module
- Administration Module

This modular structure improves readability, maintenance, scalability, and future expansion.

---

# 3. Schema Organization

The project is organized into separate SQL files.

schema/

- 01_geography.sql
- 02_persons.sql
- 03_astrology.sql
- 04_charts.sql
- 05_predictions.sql
- 06_remedies.sql
- 07_admin.sql

Each schema focuses on one domain while maintaining relational consistency across the database.

---

# 4. Core Relationships

Major relationship flow:

Geography
↓
Birth Profiles
↓
Persons
↓
Kundli Charts
↓
Planet Positions
↓
Predictions

Knowledge modules such as planets, zodiac signs, nakshatras, yogas, doshas, dashas, remedies, deities, gemstones, temples, and festivals are linked through relational mapping tables.

---

# 5. Database Design Principles

Astroverse has been developed using the following principles:

• Third Normal Form (3NF)

• Primary Keys

• Foreign Keys

• Referential Integrity

• Data Consistency

• Reduced Redundancy

• Modular Schema Design

• Performance Optimization

---

# 6. Performance Optimization

Performance improvements include:

- Strategic indexes
- SQL Views
- Database Triggers
- Query Plan Analysis
- Constraint Validation
- Optimized table relationships

---

# 7. Testing Framework

The project includes SQL-based testing for:

- Database integrity
- Constraint validation
- Query performance

Testing scripts are located inside the tests directory.

---

# 8. Future Scope

Astroverse has been designed for future expansion including:

- AI-powered astrology engine
- Python backend integration
- REST API development
- Web application
- Mobile application
- Advanced prediction engine
- User authentication system
- Enterprise database migration to PostgreSQL

---

# 9. Conclusion

Astroverse demonstrates how a complex traditional knowledge system can be engineered into a scalable, production-oriented relational database using modern SQL database engineering principles.
