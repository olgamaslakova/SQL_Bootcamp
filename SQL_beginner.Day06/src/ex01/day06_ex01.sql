WITH orders_number AS (
	SELECT person_order.person_id, menu.pizzeria_id, COUNT(*) AS counts
	FROM person_order
	JOIN menu ON person_order.menu_id = menu.id
	GROUP BY person_order.person_id, menu.pizzeria_id
)

INSERT INTO person_discounts
SELECT ROW_NUMBER( ) OVER ( ) AS id,
       orders_number.person_id,
	   orders_number.pizzeria_id,
	   (CASE
	   		WHEN orders_number.counts = 1 THEN 10.5
			WHEN orders_number.counts = 2 THEN 22
			ELSE 30
		END 
		)
FROM orders_number