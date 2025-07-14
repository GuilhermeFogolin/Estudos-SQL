-- GROUP BY

SELECT 
	state AS "Estado",
	COUNT(*) AS "Contagem"
FROM sales.customers
GROUP BY "Estado"
ORDER BY "Contagem" DESC;

SELECT 
	state AS "Estado",
	professional_status "Status professional",
	COUNT(*) AS "Contagem"
FROM sales.customers
GROUP BY "Estado", "Status professional"
ORDER BY "Estado", "Contagem" DESC;

SELECT 
	state AS "Estado",
	professional_status "Status professional",
	COUNT(*) AS "Contagem"
FROM sales.customers
GROUP BY 1, 2 -- Igual a query anterior. Prejudica legibilidade!
ORDER BY "Estado", "Contagem" DESC;

SELECT 
	DISTINCT state
FROM sales.customers;

SELECT
	state
FROM sales.customers
GROUP BY state; -- Igual a query anterior!