erDiagram

    PERSONS ||--|| BIRTH_PROFILES : has
    PERSONS ||--o{ ACTIVITY_LOGS : generates

    BIRTH_PROFILES ||--o{ KUNDLI_CHARTS : creates

    KUNDLI_CHARTS ||--o{ PLANET_POSITIONS : contains
    KUNDLI_CHARTS ||--o{ CHART_YOGAS : has
    KUNDLI_CHARTS ||--o{ CHART_DOSHAS : has

    PLANETS ||--o{ PLANET_POSITIONS : appears_in
    PLANETS ||--o{ PLANET_REMEDIES : receives
    PLANETS ||--o{ MANTRAS : associated_with
    PLANETS ||--o{ PLANET_GEMSTONES : linked_with
    PLANETS ||--o{ PLANET_DEITIES : associated_with

    ZODIAC_SIGNS ||--o{ NAKSHATRAS : contains
    ZODIAC_SIGNS ||--o{ PLANET_POSITIONS : influences

    YOGAS ||--o{ CHART_YOGAS : mapped_to
    DOSHAS ||--o{ CHART_DOSHAS : mapped_to

    REMEDIES ||--o{ PLANET_REMEDIES : contains
    GEMSTONES ||--o{ PLANET_GEMSTONES : contains

    DEITIES ||--o{ TEMPLES : belongs_to
    DEITIES ||--o{ FESTIVALS : associated_with
    DEITIES ||--o{ MANTRAS : connected_with

    FESTIVALS ||--o{ FESTIVAL_TEMPLES : celebrated_at
    TEMPLES ||--o{ FESTIVAL_TEMPLES : hosts

    COUNTRIES ||--o{ STATES : contains
    STATES ||--o{ CITIES : contains
    CITIES ||--o{ BIRTH_PROFILES : location_of

    PANCHANG ||--o{ TITHIS : uses
    PANCHANG ||--o{ KARANAS : uses
    PANCHANG ||--o{ VARAS : uses
    PANCHANG ||--o{ PANCHANG_YOGAS : uses

