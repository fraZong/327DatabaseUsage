CREATE OR REPLACE VIEW FilteredIncidentResponseReport AS
SELECT
    pd.district_name AS 'District',
    a.agency_name AS 'Agency',
    n.crime_2 AS "Crime",
    COUNT(i.incident_id) AS Incident_Count
FROM incidents i
JOIN leo_response lr ON i.response_id =lr.response_id
JOIN agencies a ON lr.agency_id = a.agency_id
JOIN police_Districts pd ON lr.district_id = pd.district_id
JOIN incidents_has_Offenses iho ON i.incident_id = iho.incident_id
JOIN offenses o ON iho.offense_id = o.offense_id
JOIN nibrs n ON o.NIBRS_id = n.NIBRS_id
WHERE n.nibrs_id = 3
GROUP BY pd.district_name, a.agency_name, n.crime_2;
    
SELECT * FROM FilteredIncidentResponseReport;