--------------------------------------------------
-- Persons Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO persons
(person_id, first_name, middle_name, last_name, gender, email, phone)
VALUES
(1, 'Pranav', NULL, 'Gaikwad', 'Male', 'pranav@example.com', '9000000001'),
(2, 'Aarav', NULL, 'Sharma', 'Male', 'aarav@example.com', '9000000002');


--------------------------------------------------
-- Birth Profiles Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO birth_profiles
(profile_id, person_id, birth_date, birth_time, city_id, timezone_id, latitude, longitude, chart_name)
VALUES
(1, 1, '2006-10-21', '07:00:00', 1, 1, 19.8762, 75.3433, 'Pranav Kundli'),
(2, 2, '2005-05-15', '10:30:00', 2, 1, 28.6139, 77.2090, 'Aarav Kundli');


--------------------------------------------------
-- Planets Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO planets
(planet_id, planet_name, planet_symbol, planet_type, ruling_day, element)
VALUES
(1, 'Sun', '☉', 'Fire', 'Sunday', 'Fire'),
(2, 'Moon', '☽', 'Mind', 'Monday', 'Water'),
(3, 'Mars', '♂', 'Energy', 'Tuesday', 'Fire'),
(4, 'Mercury', '☿', 'Intelligence', 'Wednesday', 'Earth'),
(5, 'Jupiter', '♃', 'Wisdom', 'Thursday', 'Ether'),
(6, 'Venus', '♀', 'Love', 'Friday', 'Water'),
(7, 'Saturn', '♄', 'Discipline', 'Saturday', 'Air');


--------------------------------------------------
-- Zodiac Signs Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO zodiac_signs
(zodiac_id, sign_name)
VALUES
(1, 'Aries'),
(2, 'Taurus'),
(3, 'Gemini'),
(4, 'Cancer'),
(5, 'Leo'),
(6, 'Virgo'),
(7, 'Libra'),
(8, 'Scorpio'),
(9, 'Sagittarius'),
(10, 'Capricorn'),
(11, 'Aquarius'),
(12, 'Pisces');--------------------------------------------------
-- Geography Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO countries
(country_id, country_name, iso_code, continent, official_currency, official_language)
VALUES
(1, 'India', 'IND', 'Asia', 'INR', 'Hindi'),
(2, 'Russia', 'RUS', 'Europe', 'RUB', 'Russian'),
(3, 'United States', 'USA', 'North America', 'USD', 'English');


INSERT OR IGNORE INTO states
(state_id, country_id, state_name, state_code)
VALUES
(1, 1, 'Maharashtra', 'MH'),
(2, 1, 'Delhi', 'DL'),
(3, 2, 'Moscow Oblast', 'MO');


INSERT OR IGNORE INTO cities
(city_id, state_id, city_name, latitude, longitude)
VALUES
(1, 1, 'Sambhajinagar', 19.8762, 75.3433),
(2, 2, 'New Delhi', 28.6139, 77.2090),
(3, 3, 'Moscow', 55.7558, 37.6173);


INSERT OR IGNORE INTO time_zones
(timezone_id, timezone_name, utc_offset)
VALUES
(1, 'Asia/Kolkata', '+05:30'),
(2, 'Europe/Moscow', '+03:00');

--------------------------------------------------
-- Kundli Charts Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO kundli_charts
(chart_id, person_id, profile_id, ascendant_sign_id, moon_sign_id)
VALUES
(1, 1, 1, 6, 9),
(2, 2, 2, 5, 12);


--------------------------------------------------
-- Houses Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO houses
(house_id, house_number)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12);


--------------------------------------------------
-- Planet Positions Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO planet_positions
(position_id, chart_id, planet_id, sign_id, house_id, degree, is_retrograde)
VALUES
(1, 1, 1, 6, 1, 15.25, 0),
(2, 1, 5, 9, 5, 22.50, 0),
(3, 1, 7, 10, 10, 5.75, 1),
(4, 2, 2, 12, 4, 18.20, 0);


--------------------------------------------------
-- Prediction Reports Sample Data
--------------------------------------------------

INSERT OR IGNORE INTO prediction_reports
(report_id, profile_id, prediction_type, prediction_text)
VALUES
(1, 1, 'Career', 'Strong analytical and leadership potential.'),
(2, 2, 'General', 'Balanced growth and learning opportunities.');

