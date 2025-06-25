SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name, person_visits.visit_date
FROM person_visits
JOIN person ON person_visits.person_id=person.id
JOIN pizzeria ON person_visits.pizzeria_id=pizzeria.id
JOIN menu ON pizzeria.id=menu.pizzeria_id
WHERE person.name='Kate' AND (menu.price BETWEEN 800 AND 1000) 
ORDER BY pizza_name, price, pizzeria_name