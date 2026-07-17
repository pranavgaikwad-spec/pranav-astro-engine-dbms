-- ============================================================
-- Astroverse - Reporting Queries
-- Professional SQL Reporting Examples
-- ============================================================

PRAGMA foreign_keys = ON;

------------------------------------------------------------
-- Report 1 : Total Persons
------------------------------------------------------------

SELECT COUNT(*) AS total_persons
FROM persons;

------------------------------------------------------------
-- Report 2 : Total Birth Profiles
------------------------------------------------------------

SELECT COUNT(*) AS total_birth_profiles
FROM birth_profiles;

------------------------------------------------------------
-- Report 3 : Total Kundli Charts
------------------------------------------------------------

SELECT COUNT(*) AS total_charts
FROM kundli_charts;

------------------------------------------------------------
-- Report 4 : Total Planets
------------------------------------------------------------

SELECT COUNT(*) AS total_planets
FROM planets;

------------------------------------------------------------
-- Report 5 : Total Zodiac Signs
------------------------------------------------------------

SELECT COUNT(*) AS total_zodiac_signs
FROM zodiac_signs;

------------------------------------------------------------
-- Report 6 : Charts Per Person
------------------------------------------------------------

SELECT
    p.first_name,
    p.last_name,
    COUNT(k.chart_id) AS chart_count
FROM persons p
LEFT JOIN birth_profiles bp
    ON p.person_id = bp.person_id
LEFT JOIN kundli_charts k
    ON bp.birth_profile_id = k.birth_profile_id
GROUP BY p.person_id
ORDER BY chart_count DESC;

------------------------------------------------------------
-- Report 7 : Planet Distribution
------------------------------------------------------------

SELECT
    pl.planet_name,
    COUNT(pp.planet_position_id) AS occurrences
FROM planets pl
LEFT JOIN planet_positions pp
    ON pl.planet_id = pp.planet_id
GROUP BY pl.planet_id
ORDER BY occurrences DESC;

------------------------------------------------------------
-- Report 8 : Average Planets Per Chart
------------------------------------------------------------

SELECT
    AVG(total_planets) AS average_planets
FROM (
    SELECT
        chart_id,
        COUNT(*) AS total_planets
    FROM planet_positions
    GROUP BY chart_id
);

------------------------------------------------------------
-- Report 9 : Persons Without Charts
------------------------------------------------------------

SELECT
    p.person_id,
    p.first_name,
    p.last_name
FROM persons p
LEFT JOIN birth_profiles bp
    ON p.person_id = bp.person_id
LEFT JOIN kundli_charts kc
    ON bp.birth_profile_id = kc.birth_profile_id
WHERE kc.chart_id IS NULL;

------------------------------------------------------------
-- Report 10 : Database Summary
------------------------------------------------------------

SELECT 'Persons' AS category, COUNT(*) AS total FROM persons
UNION ALL
SELECT 'Birth Profiles', COUNT(*) FROM birth_profiles
UNION ALL
SELECT 'Charts', COUNT(*) FROM kundli_charts
UNION ALL
SELECT 'Planets', COUNT(*) FROM planets
UNION ALL
SELECT 'Zodiac Signs', COUNT(*) FROM zodiac_signs;
