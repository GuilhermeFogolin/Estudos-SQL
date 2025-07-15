-- Exemplos com subqueries

-- Exemplo 01

WITH primeira_visita AS (
	SELECT
		customer_id,
		MIN(visit_page_date) AS "Primeira visita"
	from sales.funnel
	GROUP BY customer_id
)

SELECT
	visit_page_date,
	(fun.visit_page_date) <> primeira_visita."Primeira visita" AS "Lead recorrente?",
	COUNT(*) AS "Contagem de leads"
FROM sales.funnel AS fun
LEFT JOIN primeira_visita
ON fun.customer_id = primeira_visita.customer_id
GROUP BY fun.visit_page_date, "Lead recorrente?"
ORDER BY fun.visit_page_date DESC, "Lead recorrente?"

-- Exemplo 02

WITH preco_medio AS (
	SELECT
		brand,
		AVG(price) AS "Preço médio"
	FROM sales.products
	GROUP BY brand
)

SELECT
	fun.visit_id AS "ID da visita",
	fun.visit_page_date AS "Data da visita",
	pro.brand AS "Marca",
	(pro.price * (1 + fun.discount)) AS "Preço final",
	preco_medio."Preço médio",
	((pro.price * (1 + fun.discount)) - preco_medio."Preço médio") AS "Preço VS Média"
FROM sales.funnel AS fun
LEFT JOIN sales.products AS pro
ON fun.product_id = pro.product_id
LEFT JOIN preco_medio
ON pro.brand = preco_medio.brand