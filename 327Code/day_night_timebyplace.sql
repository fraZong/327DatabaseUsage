CREATE VIEW day_night_crimebyplace AS
(
WITH d AS (
SELECT * FROM incidents WHERE
HOUR(start_date) >= 4
AND HOUR(start_date) <= 17
),
n AS (
SELECT * FROM incidents WHERE
HOUR(start_date) > 17
OR HOUR(start_date) < 4
)

SELECT t1.place_name as 'Type of Place', day_count, night_count FROM
(
SELECT place_name,place_id, COUNT(*) as 'day_count' FROM
d JOIN addresses USING(address_id)
JOIN places USING(place_id)
GROUP BY place_id
ORDER BY count(*) DESC
) t1
JOIN
(
SELECT place_name,place_id, COUNT(*) as 'night_count' FROM
n JOIN addresses USING(address_id)
JOIN places USING(place_id)
GROUP BY place_id
ORDER BY count(*) DESC
)t2
USING(place_id)
)

