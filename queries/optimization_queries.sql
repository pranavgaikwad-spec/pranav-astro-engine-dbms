-- ============================================================
-- Astroverse - Query Optimization Examples
-- ============================================================

PRAGMA foreign_keys = ON;

------------------------------------------------------------
-- Database Information
------------------------------------------------------------

PRAGMA page_count;
PRAGMA page_size;
PRAGMA cache_size;

------------------------------------------------------------
-- Existing Indexes
------------------------------------------------------------

SELECT
    name,
    tbl_name
FROM sqlite_master
WHERE type='index'
ORDER BY tbl_name;

------------------------------------------------------------
-- Query Plan : Person Lookup
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM persons

WHERE person_id=1;

------------------------------------------------------------
-- Query Plan : Planet Lookup
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM planets

WHERE planet_name='Jupiter';

------------------------------------------------------------
-- Query Plan : Birth Profile
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM birth_profiles

WHERE person_id=1;

------------------------------------------------------------
-- Query Plan : Planet Position
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM planet_positions

WHERE chart_id=1;

------------------------------------------------------------
-- Query Plan : Yoga Lookup
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM chart_yogas

WHERE chart_id=1;

------------------------------------------------------------
-- Query Plan : Remedy Lookup
------------------------------------------------------------

EXPLAIN QUERY PLAN

SELECT *

FROM remedies

WHERE remedy_id=1;

------------------------------------------------------------
-- Table Statistics
------------------------------------------------------------

SELECT

name

FROM sqlite_master

WHERE type='table'

ORDER BY name;
