-- SUBQUERIES

-- Subquery no WHERE

SELECT *
FROM sales.products
WHERE price = (
	SELECT MIN(price)
	FROM sales.products);

-- Subquery com WITH

WITH calcular_media AS (
SELECT
	professional_status,
	(CURRENT_DATE - birth_date) / 365 AS "Idade"
FROM sales.customers)
SELECT
	professional_status AS "Status",
	AVG("Idade") AS "Idade média"
FROM calcular_media
GROUP BY "Status";

-- Subquery no FROM

SELECT
	professional_status AS "Status",
	AVG("Idade") AS "Idade média"
FROM (
	SELECT
		professional_status,
		(CURRENT_DATE - birth_date) / 365 AS "Idade"
	FROM sales.customers) AS "Retornar idade"
GROUP BY "Status";

-- Subquery no SELECT

SELECT
	fun.visit_id,
	fun.visit_page_date,
	sto.store_name
	(
		SELECT COUNT(*)
		FROM sales.funnel AS fun2
		WHERE fun2.visit_page_date <= fun.visit_page_date
		AND fun2.store_id = fun.store_id
	) AS "Visitas acumuladas"
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
ON fun.store_id = sto.store_id
ORDER BY sto.store_name, fun.visit_page_date;