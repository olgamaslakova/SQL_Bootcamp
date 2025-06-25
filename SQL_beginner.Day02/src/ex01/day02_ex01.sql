SELECT all_dates::date AS missing_date
FROM generate_series(
  '2022-01-01'::date, 
  '2022-01-10',
  '1 day'
) AS all_dates
LEFT JOIN (SELECT * FROM person_visits WHERE person_id=1 OR person_id=2) ON visit_date=all_dates
WHERE visit_date IS NULL
ORDER BY missing_date