CREATE FUNCTION fnc_fibonacci(pstop int DEFAULT 10)
	RETURNS TABLE(num_fib int) AS $$
		WITH RECURSIVE set_fib(a, b) AS (
		    VALUES (0, 1)
		  	UNION ALL
		    SELECT GREATEST(a, b), (a + b) FROM set_fib WHERE b < pstop
		)
		SELECT a FROM set_fib;
$$ LANGUAGE sql;

-- select * from fnc_fibonacci(100);

-- select * from fnc_fibonacci();