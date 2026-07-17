CREATE TABLE countries (
    country_id INTEGER PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL UNIQUE,
    iso_code CHAR(3) UNIQUE,
    continent VARCHAR(50),
    official_currency VARCHAR(50),
    official_language VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE states (
    state_id INTEGER PRIMARY KEY,
    country_id INTEGER NOT NULL,
    state_name VARCHAR(100) NOT NULL,
    state_code VARCHAR(10),

    FOREIGN KEY (country_id)
        REFERENCES countries(country_id)
);
CREATE TABLE cities (
    city_id INTEGER PRIMARY KEY,
    state_id INTEGER NOT NULL,
    city_name VARCHAR(100) NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),

    FOREIGN KEY (state_id)
        REFERENCES states(state_id)
);
CREATE TABLE time_zones (
    timezone_id INTEGER PRIMARY KEY,
    timezone_name VARCHAR(100) NOT NULL UNIQUE,
    utc_offset VARCHAR(10) NOT NULL,
    observes_dst BOOLEAN DEFAULT FALSE
);
CREATE TABLE persons (
    person_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE birth_profiles (
    profile_id INTEGER PRIMARY KEY,
    person_id INTEGER NOT NULL,
    birth_date DATE NOT NULL,
    birth_time TIME NOT NULL,
    city_id INTEGER NOT NULL,
    timezone_id INTEGER NOT NULL,
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    chart_name VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (person_id) REFERENCES persons(person_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id),
    FOREIGN KEY (timezone_id) REFERENCES time_zones(timezone_id)
);
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
CREATE TABLE zodiac_signs (
    zodiac_id INTEGER PRIMARY KEY,
    sign_name VARCHAR(50) NOT NULL UNIQUE,
    symbol VARCHAR(10),
    sign_order INTEGER NOT NULL UNIQUE,
    element VARCHAR(20),
    modality VARCHAR(20),
    ruling_planet_id INTEGER,

    FOREIGN KEY (ruling_planet_id)
        REFERENCES planets(planet_id)
);
CREATE TABLE kundli_charts (
    chart_id INTEGER PRIMARY KEY,
    person_id INTEGER NOT NULL,
    profile_id INTEGER NOT NULL,
    ascendant_sign_id INTEGER,
    moon_sign_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (person_id) REFERENCES persons(person_id),
    FOREIGN KEY (profile_id) REFERENCES birth_profiles(profile_id),
    FOREIGN KEY (ascendant_sign_id) REFERENCES zodiac_signs(zodiac_id),
    FOREIGN KEY (moon_sign_id) REFERENCES zodiac_signs(zodiac_id)
);
CREATE TABLE doshas (
    dosha_id INTEGER PRIMARY KEY,
    dosha_name VARCHAR(100) NOT NULL UNIQUE,
    severity VARCHAR(20),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE ganas (
    gana_id INTEGER PRIMARY KEY,
    gana_name VARCHAR(50) NOT NULL UNIQUE,
    nature TEXT
);
CREATE TABLE nakshatras (
    nakshatra_id INTEGER PRIMARY KEY,
    nakshatra_name VARCHAR(50) NOT NULL UNIQUE,
    symbol VARCHAR(100),
    deity VARCHAR(100),
    ruling_planet_id INTEGER,
    gana_id INTEGER, zodiac_id INTEGER
REFERENCES zodiac_signs(zodiac_id),
    FOREIGN KEY (ruling_planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (gana_id) REFERENCES ganas(gana_id)
);
CREATE TABLE yogas (
    yoga_id INTEGER PRIMARY KEY,
    yoga_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50),
    description TEXT,
    benefits TEXT
);
CREATE TABLE remedies (
    remedy_id INTEGER PRIMARY KEY,
    remedy_name VARCHAR(100) NOT NULL UNIQUE,
    remedy_type VARCHAR(50),
    description TEXT
);
CREATE TABLE deities (
    deity_id INTEGER PRIMARY KEY,
    deity_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50),
    description TEXT
);
CREATE TABLE gemstones (
    gemstone_id INTEGER PRIMARY KEY,
    gemstone_name VARCHAR(100) NOT NULL UNIQUE,
    associated_planet_id INTEGER,
    color VARCHAR(50),
    description TEXT,
    FOREIGN KEY (associated_planet_id) REFERENCES planets(planet_id)
);
CREATE TABLE planet_gemstones (
    planet_gemstone_id INTEGER PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    gemstone_id INTEGER NOT NULL,

    FOREIGN KEY (planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (gemstone_id) REFERENCES gemstones(gemstone_id)
);
CREATE TABLE dosha_remedies (
    dosha_remedy_id INTEGER PRIMARY KEY,
    dosha_id INTEGER NOT NULL,
    remedy_id INTEGER NOT NULL,

    FOREIGN KEY (dosha_id) REFERENCES doshas(dosha_id),
    FOREIGN KEY (remedy_id) REFERENCES remedies(remedy_id)
);
CREATE TABLE planet_deities (
    planet_deity_id INTEGER PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    deity_id INTEGER NOT NULL,

    FOREIGN KEY (planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (deity_id) REFERENCES deities(deity_id)
);
CREATE TABLE mantras (
    mantra_id INTEGER PRIMARY KEY,
    mantra_name VARCHAR(150) NOT NULL UNIQUE,
    associated_planet_id INTEGER,
    deity_id INTEGER,
    description TEXT,

    FOREIGN KEY (associated_planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (deity_id) REFERENCES deities(deity_id)
);
CREATE TABLE festivals (
    festival_id INTEGER PRIMARY KEY,
    festival_name VARCHAR(100) NOT NULL UNIQUE,
    month_name VARCHAR(30),
    associated_deity_id INTEGER,
    description TEXT,

    FOREIGN KEY (associated_deity_id) REFERENCES deities(deity_id)
);
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
AFTER INSERT ON persons
BEGIN
    INSERT INTO activity_logs(action, table_name)
    VALUES ('New person added', 'persons');
END;
CREATE TABLE chart_doshas (
    chart_dosha_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    dosha_id INTEGER NOT NULL,

    FOREIGN KEY (chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY (dosha_id) REFERENCES doshas(dosha_id)
);
CREATE TABLE chart_yogas (
    chart_yoga_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    yoga_id INTEGER NOT NULL,

    FOREIGN KEY (chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY (yoga_id) REFERENCES yogas(yoga_id)
);
CREATE TABLE planet_remedies (
    planet_remedy_id INTEGER PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    remedy_id INTEGER NOT NULL,

    FOREIGN KEY (planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (remedy_id) REFERENCES remedies(remedy_id)
);
CREATE TABLE tithis (
    tithi_id INTEGER PRIMARY KEY,
    tithi_name VARCHAR(50) NOT NULL UNIQUE,
    paksha VARCHAR(20) NOT NULL,
    tithi_number INTEGER NOT NULL,
    description TEXT
);
CREATE TABLE varas (
    vara_id INTEGER PRIMARY KEY,
    vara_name VARCHAR(20) NOT NULL UNIQUE,
    ruling_planet_id INTEGER NOT NULL,
    description TEXT,

    FOREIGN KEY (ruling_planet_id)
    REFERENCES planets(planet_id)
);
CREATE TABLE karanas (
    karana_id INTEGER PRIMARY KEY,
    karana_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);
CREATE TABLE panchang_yogas (
    panchang_yoga_id INTEGER PRIMARY KEY,
    yoga_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);
CREATE TABLE "panchang" (
    panchang_id INTEGER PRIMARY KEY,
    panchang_date DATE NOT NULL UNIQUE,

    tithi_id INTEGER NOT NULL,
    vara_id INTEGER NOT NULL,
    nakshatra_id INTEGER NOT NULL,
    panchang_yoga_id INTEGER NOT NULL,
    karana_id INTEGER NOT NULL,

    FOREIGN KEY (tithi_id) REFERENCES tithis(tithi_id),
    FOREIGN KEY (vara_id) REFERENCES varas(vara_id),
    FOREIGN KEY (nakshatra_id) REFERENCES nakshatras(nakshatra_id),
    FOREIGN KEY (panchang_yoga_id) REFERENCES panchang_yogas(panchang_yoga_id),
    FOREIGN KEY (karana_id) REFERENCES karanas(karana_id)
);
CREATE TABLE houses (
    house_id INTEGER PRIMARY KEY,
    house_number INTEGER NOT NULL UNIQUE,
    house_name VARCHAR(50) NOT NULL,
    life_area TEXT
);
CREATE TABLE "planet_positions" (
    position_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    sign_id INTEGER NOT NULL,
    house_id INTEGER NOT NULL,
    degree DECIMAL(5,2),
    is_retrograde BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY (planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (sign_id) REFERENCES zodiac_signs(zodiac_id),
    FOREIGN KEY (house_id) REFERENCES houses(house_id)
);
CREATE TABLE "temples" (
    temple_id INTEGER PRIMARY KEY,
    temple_name VARCHAR(150) NOT NULL UNIQUE,
    deity_id INTEGER,
    city_id INTEGER,
    famous_for TEXT,

    FOREIGN KEY (deity_id) REFERENCES deities(deity_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);
CREATE TABLE "festival_temples" (
    festival_temple_id INTEGER PRIMARY KEY,
    festival_id INTEGER NOT NULL,
    temple_id INTEGER NOT NULL,

    FOREIGN KEY (festival_id) REFERENCES festivals(festival_id),
    FOREIGN KEY (temple_id) REFERENCES temples(temple_id)
);
CREATE INDEX idx_birth_profile_person
ON birth_profiles(person_id);
CREATE INDEX idx_kundli_charts_person
ON kundli_charts(person_id);
CREATE INDEX idx_planet_positions_chart
ON planet_positions(chart_id);
CREATE INDEX idx_chart_yogas_chart
ON chart_yogas(chart_id);
CREATE INDEX idx_chart_doshas_chart
ON chart_doshas(chart_id);
CREATE INDEX idx_planet_remedies_planet
ON planet_remedies(planet_id);
CREATE INDEX idx_festival_temples_temple
ON festival_temples(temple_id);
CREATE INDEX idx_festival_temples_festival
ON festival_temples(festival_id);
CREATE INDEX idx_planet_deities_deity
ON planet_deities(deity_id);
CREATE INDEX idx_planet_gemstones_planet
ON planet_gemstones(planet_id);
CREATE INDEX idx_chart_yogas_yoga
ON chart_yogas(yoga_id);
CREATE TABLE sqlite_stat1(tbl,idx,stat);
CREATE TABLE dasha_types (
    dasha_type_id INTEGER PRIMARY KEY,
    dasha_type_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT
);
CREATE TABLE chart_dashas (
    chart_dasha_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    dasha_type_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,

    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    remarks TEXT,

    FOREIGN KEY (chart_id)
        REFERENCES kundli_charts(chart_id),

    FOREIGN KEY (dasha_type_id)
        REFERENCES dasha_types(dasha_type_id),

    FOREIGN KEY (planet_id)
        REFERENCES planets(planet_id)
);
CREATE INDEX idx_chart_dashas_chart
ON chart_dashas(chart_id);
CREATE INDEX idx_chart_dashas_planet
ON chart_dashas(planet_id);
CREATE INDEX idx_chart_dashas_type
ON chart_dashas(dasha_type_id);
CREATE TABLE birth_panchang (
    birth_panchang_id INTEGER PRIMARY KEY,

    profile_id INTEGER NOT NULL UNIQUE,
    panchang_id INTEGER NOT NULL,

    FOREIGN KEY (profile_id)
        REFERENCES birth_profiles(profile_id),

    FOREIGN KEY (panchang_id)
        REFERENCES panchang(panchang_id)
);
CREATE TABLE prediction_reports (
    report_id INTEGER PRIMARY KEY,

    chart_id INTEGER NOT NULL,

    report_type VARCHAR(50) NOT NULL,

    prediction TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (chart_id)
        REFERENCES kundli_charts(chart_id)
);
CREATE INDEX idx_prediction_chart
ON prediction_reports(chart_id);
CREATE INDEX idx_birth_panchang_profile
ON birth_panchang(profile_id);
CREATE INDEX idx_birth_panchang_panchang
ON birth_panchang(panchang_id);
CREATE TABLE planet_strengths (
    strength_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    strength_score DECIMAL(5,2),
    strength_level VARCHAR(20),
    remarks TEXT,

    FOREIGN KEY(chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY(planet_id) REFERENCES planets(planet_id)
);
CREATE TABLE planet_aspects (
    aspect_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    from_planet_id INTEGER NOT NULL,
    to_planet_id INTEGER NOT NULL,
    aspect_degree DECIMAL(5,2),

    FOREIGN KEY(chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY(from_planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY(to_planet_id) REFERENCES planets(planet_id)
);
CREATE TABLE compatibility_reports (
    compatibility_id INTEGER PRIMARY KEY,

    male_profile_id INTEGER,
    female_profile_id INTEGER,

    score DECIMAL(5,2),

    remarks TEXT,

    FOREIGN KEY(male_profile_id)
        REFERENCES birth_profiles(profile_id),

    FOREIGN KEY(female_profile_id)
        REFERENCES birth_profiles(profile_id)
);
CREATE INDEX idx_strength_chart
ON planet_strengths(chart_id);
CREATE INDEX idx_aspect_chart
ON planet_aspects(chart_id);
CREATE INDEX idx_compatibility_male
ON compatibility_reports(male_profile_id);
CREATE INDEX idx_compatibility_female
ON compatibility_reports(female_profile_id);
CREATE TABLE transits (
    transit_id INTEGER PRIMARY KEY,
    planet_id INTEGER NOT NULL,
    zodiac_id INTEGER NOT NULL,
    transit_date DATE NOT NULL,
    degree DECIMAL(5,2),

    FOREIGN KEY (planet_id) REFERENCES planets(planet_id),
    FOREIGN KEY (zodiac_id) REFERENCES zodiac_signs(zodiac_id)
);
CREATE TABLE combustion_status (
    combustion_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    is_combust BOOLEAN DEFAULT FALSE,
    remarks TEXT,

    FOREIGN KEY(chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY(planet_id) REFERENCES planets(planet_id)
);
CREATE TABLE planet_dignity (
    dignity_id INTEGER PRIMARY KEY,
    chart_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    dignity_type VARCHAR(30),

    FOREIGN KEY(chart_id) REFERENCES kundli_charts(chart_id),
    FOREIGN KEY(planet_id) REFERENCES planets(planet_id)
);
CREATE INDEX idx_transits_planet
ON transits(planet_id);
CREATE INDEX idx_combust_chart
ON combustion_status(chart_id);
CREATE INDEX idx_dignity_chart
ON planet_dignity(chart_id);
