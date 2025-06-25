WITH visits AS
	(SELECT pizzeria.name AS pizzeria_name, person.gender
	FROM person_order
	JOIN person ON person_order.person_id=person.id
	JOIN menu ON person_order.menu_id=menu.id
	JOIN pizzeria ON menu.pizzeria_id=pizzeria.id),

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
EXCEPT 
SELECT * 
FROM men_visits)
UNION 
(SELECT * 
FROM men_visits
EXCEPT 
SELECT * 
FROM women_visits)

ORDER BY pizzeria_name