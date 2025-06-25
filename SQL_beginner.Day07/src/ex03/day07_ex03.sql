WITH 
    visits AS (
	SELECT pizzeria.id, COUNT(pizzeria_id) AS count
	FROM person_visits
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	GROUP BY(pizzeria.id)
	ORDER BY count DESC, name ASC
),
    orders AS (
    SELECT pizzeria.id, COUNT(pizzeria_id) AS count
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	GROUP BY(pizzeria.id)
	ORDER BY count DESC, name ASC
)

SELECT pizzeria.name,
       (COALESCE(visits.count, 0) + COALESCE(orders.count, 0)) AS total_count
FROM pizzeria
FULL JOIN visits ON pizzeria.id = visits.id
FULL JOIN orders ON pizzeria.id = orders.id
ORDER BY total_count DESC, name ASC