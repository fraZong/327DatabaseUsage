
CREATE OR REPLACE VIEW AgencyDistrictOffenseReport AS

SELECT
    pd.district_name,
    a.agency_name,
    COUNT(i.incident_id) AS incident_Count,
    COUNT(DISTINCT o.offense_id) AS offense_Count
FROM incidents i
JOIN leo_response lr ON i.response_id = lr.response_id
JOIN police_districts pd ON lr.district_id = pd.district_id
JOIN agencies a ON lr.agency_id = a.agency_id
JOIN incidents_has_Offenses iho ON i.incident_id = iho.incident_id
JOIN offenses o ON iho.offense_id = o.offense_id
GROUP BY pd.district_name, a.agency_name;

SELECT * FROM AgencyDistrictOffenseReport;
 