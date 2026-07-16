-- Astroverse Performance Tests

-- Check database size
PRAGMA page_count;

PRAGMA page_size;


-- Check available indexes

SELECT 
    name AS index_name,
    tbl_name AS table_name
FROM sqlite_master
WHERE type = 'index'
ORDER BY tbl_name;


-- Query plan tests

EXPLAIN QUERY PLAN
SELECT *
FROM persons
WHERE first_name = 'Pranav';


EXPLAIN QUERY PLAN
SELECT *
FROM planets
WHERE planet_name = 'Jupiter';


EXPLAIN QUERY PLAN
SELECT *
FROM birth_profiles
WHERE person_id = 1;


EXPLAIN QUERY PLAN
SELECT *
FROM planet_positions
WHERE chart_id = 1;


EXPLAIN QUERY PLAN
SELECT *
FROM chart_yogas
WHERE chart_id = 1;


-- Check table sizes

SELECT 
    name AS table_name
FROM sqlite_master
WHERE type='table'
ORDER BY name;

