CREATE VIEW v_symmetric_union AS
((SELECT * FROM person_visits
WHERE person_visits.visit_date='2022-01-02'
EXCEPT
SELECT * FROM person_visits
WHERE person_visits.visit_date='2022-01-06')
UNION
(SELECT * FROM person_visits
WHERE person_visits.visit_date='2022-01-06'
EXCEPT
SELECT * FROM person_visits
WHERE person_visits.visit_date='2022-01-02'))