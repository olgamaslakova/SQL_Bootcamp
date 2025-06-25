COMMENT ON TABLE person_discounts IS 'This table contains a person''s discount at some pizzerias';
COMMENT ON COLUMN person_discounts.id IS 'This column displays an unique primary key for every note';
COMMENT ON COLUMN person_discounts.person_id IS 'This column displays an unique id of people, who made an order';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'This column displays an unique id of pizzerias, which matches the selected person, from the order list';
COMMENT ON COLUMN person_discounts.discount IS 'This column displays a discount of a certain person at a certain pizzeria from 0 to 100% and default is 0'