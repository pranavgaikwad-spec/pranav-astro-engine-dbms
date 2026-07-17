--------------------------------------------------
-- Astroverse DBMS Table Tests
--------------------------------------------------

.headers ON
.mode column

-- Count total tables
SELECT COUNT(*) AS total_tables
FROM sqlite_master
WHERE type='table';


-- Check important tables exist

SELECT name AS table_name
FROM sqlite_master
WHERE type='table'
AND name IN (
'countries',
'states',
'cities',
'persons',
'birth_profiles',
'planets',
'zodiac_signs',
'kundli_charts',
'planet_positions',
'remedies',
'prediction_reports'
)
ORDER BY name;


-- Check indexes exist

SELECT name AS index_name
FROM sqlite_master
WHERE type='index'
ORDER BY name;
