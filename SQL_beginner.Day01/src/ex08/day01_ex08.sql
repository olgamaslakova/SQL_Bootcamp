SELECT person_order.order_date, concat (help_table.name, ' (age:',help_table.age,')') AS person_information
FROM person_order
NATURAL JOIN (SELECT id AS person_id, name, age FROM person) AS help_table
ORDER BY order_date, name