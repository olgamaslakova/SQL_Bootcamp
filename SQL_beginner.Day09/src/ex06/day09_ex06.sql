CREATE FUNCTION fnc_person_visits_and_eats_on_date(
							pperson varchar DEFAULT 'Dmitriy',
							pprice numeric DEFAULT 500,
							pdate date DEFAULT '2022-01-08')
	RETURNS TABLE (
		name varchar
	) AS $$
	BEGIN
		RETURN QUERY
			SELECT DISTINCT pizzeria.name 
			FROM person_visits
			JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
			JOIN person ON person_visits.person_id = person.id
			JOIN menu ON pizzeria.id = menu.pizzeria_id
			WHERE person.name = pperson AND 
			      menu.price < pprice AND 
				  person_visits.visit_date = pdate;
	END;
$$ LANGUAGE plpgsql;

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');