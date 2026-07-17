# Astroverse Project Structure

## Overview

Astroverse follows a modular project structure that separates database schema, documentation, sample data, SQL queries, testing, and visual resources into dedicated directories. This organization improves maintainability, scalability, and developer productivity.

---

# Root Structure

README.md

astroverse.db

schema/

sample_data/

queries/

docs/

diagrams/

tests/

---

# Directory Reference

## schema/

Contains the complete database schema divided into logical modules.

Contents:

- Geography
- Person Management
- Astrology Knowledge
- Kundli Charts
- Predictions
- Remedies
- Administration

Purpose:

Provides a modular and maintainable database definition.

---

## sample_data/

Contains sample records used for testing and demonstration.

Purpose:

Allows developers to populate the database quickly for experimentation and validation.

---

## queries/

Contains SQL query collections.

Contents include:

- Basic SQL
- Advanced SQL
- Analytical Queries
- Performance Queries (future)

Purpose:

Demonstrates practical database usage and SQL proficiency.

---

## docs/

Contains technical documentation.

Current documents:

- Database Design
- Module Reference
- Project Structure

Purpose:

Explains the architecture and engineering decisions behind Astroverse.

---

## diagrams/

Contains database diagrams and architecture visuals.

Contents:

- ER Diagram Source
- ER Diagram Image (future)

Purpose:

Provides visual understanding of the database architecture.

---

## tests/

Contains SQL scripts used to validate database quality.

Current tests:

- Integrity Tests
- Constraint Tests
- Performance Tests

Purpose:

Ensures database consistency, correctness, and performance.

---

# Design Philosophy

Astroverse is organized using a modular engineering approach where every directory serves a single, well-defined purpose. This structure keeps the project clean, scalable, and suitable for future expansion into desktop, web, mobile, and AI-powered applications.
