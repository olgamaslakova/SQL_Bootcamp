SELECT menu1.pizza_name,
       pizzeria_list1.name AS pizzeria_name_1,
       pizzeria_list2.name AS pizzeria_name_2,
       menu1.price
FROM menu menu1
JOIN menu AS menu2 ON menu1.price=menu2.price
JOIN pizzeria AS pizzeria_list1 ON menu1.pizzeria_id=pizzeria_list1.id
JOIN pizzeria AS pizzeria_list2 ON menu2.pizzeria_id=pizzeria_list2.id
WHERE menu1.id>menu2.id AND menu1.pizza_name=menu2.pizza_name
ORDER BY pizza_name