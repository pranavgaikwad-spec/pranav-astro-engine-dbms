--------------------------------------------------
-- Astroverse Query Tests
--------------------------------------------------

.headers ON
.mode column

-- Test persons with birth profiles

SELECT
p.first_name,
p.last_name,
b.birth_date,
b.chart_name
FROM persons p
JOIN birth_profiles b
ON p.person_id = b.person_id;


-- Test kundli with planets

SELECT
k.chart_id,
p.planet_name,
z.sign_name,
pp.degree
FROM kundli_charts k
JOIN planet_positions pp
ON k.chart_id = pp.chart_id
JOIN planets p
ON pp.planet_id = p.planet_id
JOIN zodiac_signs z
ON pp.sign_id = z.zodiac_id;


-- Test prediction reports

SELECT
report_type,
prediction
FROM prediction_reports;
