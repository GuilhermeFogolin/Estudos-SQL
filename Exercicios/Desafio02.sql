-- Desafio 02

-- Questã0 01

SELECT
	email AS "E-mail",
	income AS "Salários",
	(income / 1200) AS "Total de salários mínimos"
FROM sales.customers;

-- Questão 02

SELECT
	email AS "E-mail",
	income AS "Salários",
	(income / 1200) AS "Total de salários mínimos",
	((income / 1200) > 4) AS "Acima de 4 salários"
FROM sales.customers;

-- Questão 03

SELECT
	email AS "E-mail",
	income AS "Salários",
	(income / 1200) AS "Total de salários mínimos",
	((income / 1200) > 4) AS "Acima de 4 salários"
FROM sales.customers
WHERE income BETWEEN (1200 * 4) AND (1200 * 5);

-- Questão 04

SELECT
	email AS "E-mail",
	city AS "Cidade",
	state AS "Estado"
FROM sales.customers	
WHERE state IN ('MG', 'MT');

-- Questão 05

SELECT
	email AS "E-mail",
	city AS "Cidade",
	state AS "Estado"
FROM sales.customers	
WHERE state <> 'SP';

-- Questão 06

SELECT
	city AS "Cidade com Z"
FROM temp_tables.regions
WHERE city ILIKE 'Z%'