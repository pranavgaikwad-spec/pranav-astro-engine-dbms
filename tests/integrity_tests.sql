-- Astroverse Database Integrity Tests

PRAGMA foreign_keys = ON;

-- Check foreign key violations
PRAGMA foreign_key_check;


-- Check important table counts

SELECT 'Persons' AS table_name, COUNT(*) AS total FROM persons;

SELECT 'Birth Profiles' AS table_name, COUNT(*) AS total FROM birth_profiles;

SELECT 'Kundli Charts' AS table_name, COUNT(*) AS total FROM kundli_charts;

SELECT 'Planets' AS table_name, COUNT(*) AS total FROM planets;

SELECT 'Zodiac Signs' AS table_name, COUNT(*) AS total FROM zodiac_signs;


-- Check duplicate planet names
SELECT planet_name, COUNT(*)
FROM planets
GROUP BY planet_name
HAVING COUNT(*) > 1;


-- Check duplicate zodiac signs
SELECT sign_name, COUNT(*)
FROM zodiac_signs
GROUP BY sign_name
HAVING COUNT(*) > 1;

