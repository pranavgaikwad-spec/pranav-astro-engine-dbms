-- Astroverse Constraint Tests

PRAGMA foreign_keys = ON;


-- Test: Check tables with primary keys

SELECT name AS table_name
FROM sqlite_master
WHERE type='table'
AND sql LIKE '%PRIMARY KEY%';


-- Test: Check important foreign key relationships

SELECT 
    'Foreign Key Check' AS test_name,
    COUNT(*) AS violations
FROM pragma_foreign_key_check;


-- Test: Check NULL values in critical fields

SELECT COUNT(*) AS missing_person_names
FROM persons
WHERE first_name IS NULL;


SELECT COUNT(*) AS missing_planet_names
FROM planets
WHERE planet_name IS NULL;


SELECT COUNT(*) AS missing_zodiac_names
FROM zodiac_signs
WHERE sign_name IS NULL;


-- Test: Verify unique constraints

SELECT planet_name, COUNT(*)
FROM planets
GROUP BY planet_name
HAVING COUNT(*) > 1;

SELECT sign_name, COUNT(*)
FROM zodiac_signs
GROUP BY sign_name
HAVING COUNT(*) > 1;

