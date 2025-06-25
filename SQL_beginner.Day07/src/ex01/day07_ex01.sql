WITH visits AS (
	SELECT person_id, COUNT(person_id) AS count_of_visits
	FROM person_visits
	GROUP BY(person_id)
)

SELECT person.name, visits.count_of_visits
FROM visits
JOIN person ON visits.person_id = person.id
ORDER BY count_of_visits DESC, name ASC
LIMIT 4 