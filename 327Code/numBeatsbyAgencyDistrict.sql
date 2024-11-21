USE mydb;

CREATE OR REPLACE VIEW numBeatsbyAgencyDistrict AS

SELECT COUNT(beat_id) AS "Number of Beats" , district_name AS "District Name", agency_name AS "Agency Name"
FROM beats
	JOIN leo_response USING(beat_id)
	JOIN police_districts ON (police_districts.district_id = leo_response.district_id)
	JOIN agencies ON (agencies.agency_id = leo_response.agency_id)
WHERE agencies.agency_id = 1
GROUP BY district_name, agency_name
ORDER BY COUNT(beat_id) DESC, district_name;

SELECT * FROM numBeatsbyAgencyDistrict;
