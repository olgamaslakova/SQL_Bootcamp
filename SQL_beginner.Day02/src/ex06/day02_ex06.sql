SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id=menu.id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
JOIN (SELECT * FROM person WHERE name='Denis' OR name='Anna') AS people ON person_order.person_id=people.id
ORDER BY pizza_name, pizzeria_name