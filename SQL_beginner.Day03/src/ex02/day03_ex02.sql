WITH pizzas_list AS (SELECT * 
                     FROM menu
                     WHERE NOT EXISTS (SELECT person_order.menu_id  FROM person_order WHERE person_order.menu_id=menu.id)
)
SELECT pizzas_list.pizza_name,
       pizzas_list.price,
	   pizzeria.name AS pizzeria_name
FROM pizzas_list
JOIN pizzeria ON pizzas_list.pizzeria_id=pizzeria.id
ORDER BY pizza_name, price