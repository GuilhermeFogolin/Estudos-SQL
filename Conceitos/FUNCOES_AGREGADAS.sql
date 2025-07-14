-- Funções agregadas

-- COUNT

SELECT COUNT(*)
FROM sales.funnel; -- TODAS as linhas

SELECT COUNT(paid_date)
FROM sales.funnel; -- Sem incluir NULL

SELECT COUNT(DISTINCT product_id)
FROM sales.funnel
WHERE visit_page_date BETWEEN '2021-01-01' AND '2021-01-31'; -- Coluna distinta

-- MAX, MIN, AVG

SELECT MIN(price), MAX(price), AVG(price)
FROM sales.products;

SELECT *
FROM sales.products
WHERE price = (
	SELECT MAX(price) AS "Valor"
	FROM sales.products) -- Veículo mais caro com SUBQUERY