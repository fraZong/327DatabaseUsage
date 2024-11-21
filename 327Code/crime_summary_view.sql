USE mydb;

#Incident summary for incidents with a valid end date.

CREATE OR REPLACE VIEW incidentSummaryWithEndDate AS
	SELECT incident_id, CR_number_id, start_date, end_date, NIBRS_code, crime_2, crime_1
	FROM incidents_has_offenses
		JOIN incidents USING(incident_id)
		JOIN offenses USING(offense_id)
		JOIN nibrs USING(NIBRS_id)
		JOIN general_crime USING(crime_id)
	WHERE end_date IS NOT NULL
	ORDER BY end_date;

SELECT * FROM incidentSummaryWithEndDate;