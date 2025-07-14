-- HAVING

SELECT
	state,
	COUNT(*)
FROM sales.customers
GROUP BY state
HAVING COUNT(*) > 100;

SELECT
	state,
	COUNT(*)
FROM sales.customers
WHERE state <> 'MG' -- Adicionando WHERE na query
GROUP BY state
HAVING COUNT(*) > 100;

SELECT
	state,
	COUNT(*)
FROM sales.customers
GROUP BY state
HAVING COUNT(*) > 100 AND state <> 'MG' -- Sem o WHERE. Igual query anterior!