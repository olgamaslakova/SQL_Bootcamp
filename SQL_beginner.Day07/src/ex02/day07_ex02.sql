WITH 
    visits AS (
	SELECT pizzeria.name, COUNT(pizzeria_id) AS count
	FROM person_visits
	JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
	GROUP BY(pizzeria.name)
	ORDER BY count DESC, name ASC
),
    orders AS (
    SELECT pizzeria.name, COUNT(pizzeria_id) AS count
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
	GROUP BY(pizzeria.name)
	ORDER BY count DESC, name ASC
)

(SELECT visits.name, visits.count, 'visit' AS action_type
FROM visits
LIMIT 3)
UNION 
(SELECT orders.name, orders.count, 'order' AS action_type
FROM orders
LIMIT 3)
ORDER BY action_type ASC, count DESC 