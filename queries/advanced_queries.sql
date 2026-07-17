-- ============================================================
-- Astroverse - Advanced SQL Query Collection
-- Demonstrates professional SQL querying techniques.
-- ============================================================

PRAGMA foreign_keys = ON;

------------------------------------------------------------
-- 1. Persons with their Birth Profiles
------------------------------------------------------------
SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    bp.birth_date,
    bp.birth_time
FROM persons p
JOIN birth_profiles bp
ON p.person_id = bp.person_id;

------------------------------------------------------------
-- 2. Kundli Charts with Owner Names
------------------------------------------------------------
SELECT
    kc.chart_id,
    p.first_name,
    p.last_name,
    kc.chart_name
FROM kundli_charts kc
JOIN birth_profiles bp
ON kc.birth_profile_id = bp.birth_profile_id
JOIN persons p
ON bp.person_id = p.person_id;

------------------------------------------------------------
-- 3. Planet Positions with Planet Names
------------------------------------------------------------
SELECT
    pp.chart_id,
    pl.planet_name,
    pp.house_number,
    pp.degree
FROM planet_positions pp
JOIN planets pl
ON pp.planet_id = pl.planet_id;

------------------------------------------------------------
-- 4. Count of Charts Per Person
------------------------------------------------------------
SELECT
    p.first_name,
    COUNT(kc.chart_id) AS total_charts
FROM persons p
JOIN birth_profiles bp
ON p.person_id = bp.person_id
JOIN kundli_charts kc
ON bp.birth_profile_id = kc.birth_profile_id
GROUP BY p.person_id;

------------------------------------------------------------
-- 5. Persons Having More Than One Chart
------------------------------------------------------------
SELECT
    p.first_name,
    COUNT(*) AS chart_count
FROM persons p
JOIN birth_profiles bp
ON p.person_id = bp.person_id
JOIN kundli_charts kc
ON bp.birth_profile_id = kc.birth_profile_id
GROUP BY p.person_id
HAVING COUNT(*) > 1;

------------------------------------------------------------
-- 6. Planet Count in Every Chart
------------------------------------------------------------
SELECT
    chart_id,
    COUNT(*) AS total_planets
FROM planet_positions
GROUP BY chart_id;

------------------------------------------------------------
-- 7. Charts Having Jupiter
------------------------------------------------------------
SELECT DISTINCT
    chart_id
FROM planet_positions pp
JOIN planets pl
ON pp.planet_id = pl.planet_id
WHERE pl.planet_name='Jupiter';

------------------------------------------------------------
-- 8. CASE Example
------------------------------------------------------------
SELECT
    planet_name,
    CASE
        WHEN planet_type='Benefic' THEN 'Positive'
        ELSE 'General'
    END AS category
FROM planets;

------------------------------------------------------------
-- 9. Correlated Subquery
------------------------------------------------------------
SELECT
    first_name
FROM persons p
WHERE EXISTS (
    SELECT 1
    FROM birth_profiles bp
    WHERE bp.person_id=p.person_id
);

------------------------------------------------------------
-- 10. Charts with Maximum Planet Entries
------------------------------------------------------------
SELECT
    chart_id,
    COUNT(*) AS total
FROM planet_positions
GROUP BY chart_id
ORDER BY total DESC;

------------------------------------------------------------
-- 11. Average Planet Degree
------------------------------------------------------------
SELECT
    AVG(degree) AS average_degree
FROM planet_positions;

------------------------------------------------------------
-- 12. Birth Profiles Without Charts
------------------------------------------------------------
SELECT
    birth_profile_id
FROM birth_profiles
WHERE birth_profile_id NOT IN (
    SELECT birth_profile_id
    FROM kundli_charts
);

------------------------------------------------------------
-- 13. Zodiac Distribution
------------------------------------------------------------
SELECT
    sign_name,
    COUNT(*) AS total
FROM zodiac_signs
GROUP BY sign_name;

------------------------------------------------------------
-- 14. Total Records Per Table Example
------------------------------------------------------------
SELECT COUNT(*) AS total_persons
FROM persons;

------------------------------------------------------------
-- 15. Ordered Planet List
------------------------------------------------------------
SELECT
    planet_name
FROM planets
ORDER BY planet_name;

