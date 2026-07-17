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
