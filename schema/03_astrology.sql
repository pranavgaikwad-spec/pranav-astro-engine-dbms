-- =====================================================
-- PRANAV ASTRO ENGINE DBMS
-- MODULE 03 : ASTROLOGY MASTER DATA
-- =====================================================

CREATE TABLE planets (
    planet_id INTEGER PRIMARY KEY,
    planet_name VARCHAR(50) NOT NULL UNIQUE,
    planet_symbol VARCHAR(10),
    planet_type VARCHAR(30),
    ruling_day VARCHAR(20),
    element VARCHAR(20),
    color VARCHAR(30),
    gemstone VARCHAR(50),
    metal VARCHAR(30),
    deity VARCHAR(100),
    description TEXT
);


