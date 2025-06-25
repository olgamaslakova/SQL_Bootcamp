WITH address_info AS (
    SELECT person.address, 
    ROUND((MAX(age) - MIN(age)::numeric / MAX(age)), 2) AS formula,
    ROUND(AVG(age), 2) AS average
    FROM person
    GROUP BY person.address
)

SELECT *, 
       (CASE
              WHEN formula > average THEN true
              ELSE false
       END
       ) AS comparison
FROM address_info
ORDER BY address