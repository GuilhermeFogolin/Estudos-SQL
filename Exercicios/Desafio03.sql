-- Desafio 03

-- Questão 01

SELECT COUNT(*)
FROM sales.customers
WHERE ((CURRENT_DATE - birth_date) / 365) < 30;

-- Questão 02

SELECT 
	MAX((CURRENT_DATE - birth_date) / 365) AS "Mais velho", 
	MIN((CURRENT_DATE - birth_date) / 365) AS "Mais novo"
FROM sales.customers;

-- Questão 03

SELECT *
FROM sales.customers
WHERE income = (
	SELECT MAX(income)
	FROM sales.customers);

-- Questão 04

SELECT
	COUNT(product_id) AS "Contagem",
	brand AS "Marca"
FROM sales.products	
GROUP BY "Marca"
ORDER BY "Marca" 

-- Questão 05

SELECT
	COUNT(product_id) AS "Veículos",
	brand AS "Marca",
	model_year AS "Ano modelo"
FROM sales.products
GROUP BY "Marca", "Ano modelo"
ORDER BY "Marca", "Ano modelo"

-- Questão 06

SELECT
	COUNT(product_id) AS "Veículos",
	brand AS "Marca"
FROM sales.products
GROUP BY "Marca"
HAVING COUNT(product_id) > 10