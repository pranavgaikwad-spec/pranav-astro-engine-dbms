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
