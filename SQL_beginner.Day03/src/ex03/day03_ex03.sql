WITH visits AS
	(SELECT pizzeria.name AS pizzeria_name, person.gender
	FROM person_visits
	JOIN pizzeria ON person_visits.pizzeria_id=pizzeria.id
	JOIN person ON person_visits.person_id=person.id),

	women_visits(pizzeria_name) AS
	(SELECT pizzeria_name
	FROM visits
	WHERE visits.gender='female'),

	men_visits(pizzeria_name) AS
	(SELECT pizzeria_name
	FROM visits
	WHERE visits.gender='male')

(SELECT * 
FROM women_visits
EXCEPT ALL
SELECT * 
FROM men_visits)
UNION ALL
(SELECT * 
FROM men_visits
EXCEPT ALL
SELECT * 
FROM women_visits)

ORDER BY pizzeria_name