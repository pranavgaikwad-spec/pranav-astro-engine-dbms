CREATE VIEW planet_knowledge_view AS
SELECT
    p.planet_name,
    g.gemstone_name,
    d.deity_name,
    m.mantra_name
FROM planets p
LEFT JOIN planet_gemstones pg
    ON p.planet_id = pg.planet_id
LEFT JOIN gemstones g
    ON pg.gemstone_id = g.gemstone_id
LEFT JOIN planet_deities pd
    ON p.planet_id = pd.planet_id
LEFT JOIN deities d
    ON pd.deity_id = d.deity_id
LEFT JOIN mantras m
    ON p.planet_id = m.associated_planet_id
/* planet_knowledge_view(planet_name,gemstone_name,deity_name,mantra_name) */;
CREATE INDEX idx_person_name
ON persons(first_name);
CREATE INDEX idx_planet_name
ON planets(planet_name);
CREATE INDEX idx_city_name
ON cities(city_name);
CREATE TABLE activity_logs (
    log_id INTEGER PRIMARY KEY,
    action TEXT NOT NULL,
    table_name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER after_person_insert
