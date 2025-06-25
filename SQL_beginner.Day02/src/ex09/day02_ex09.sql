WITH women(woman_name, pizza_name) AS
	(SELECT person.name, menu.pizza_name 
	FROM person_order
	JOIN person ON person_order.person_id=person.id
	JOIN menu ON person_order.menu_id=menu.id
	WHERE person.gender='female')


SELECT women.woman_name AS name
FROM women
WHERE women.pizza_name='pepperoni pizza'
INTERSECT
SELECT women.woman_name AS name
FROM women
WHERE women.pizza_name='cheese pizza'
ORDER BY name
