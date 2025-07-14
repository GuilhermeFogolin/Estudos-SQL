-- Operadores aritméticos

SELECT 
	email AS "E-mail",
	birth_date AS "Data de nascimento",
	(CURRENT_DATE - birth_date) / 365 AS "Idade"
FROM sales.customers;

SELECT 
	first_name AS "Nome",
	birth_date AS "Data de nascimento",
	(CURRENT_DATE - birth_date) / 365 AS "Idade"
FROM sales.customers
ORDER BY "Idade"
LIMIT 10;

-- Concatenando strings

SELECT	
	first_name || ' ' || last_name AS "Nome completo"
FROM sales.customers;