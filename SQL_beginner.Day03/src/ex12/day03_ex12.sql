INSERT INTO person_order
SELECT
		generate_series (
			((SELECT MAX(person_order.id) FROM person_order)+1), 
			((SELECT MAX(person_order.id) FROM person_order) + (SELECT MAX(person.id) FROM person)), 
			1
		),
		
		generate_series (
			(SELECT MIN(person.id) FROM person), 
			(SELECT COUNT(person.id) FROM person), 
			1
		),
		
		(SELECT menu.id FROM menu WHERE menu.pizza_name='greek pizza'),
		'2022-02-25'

