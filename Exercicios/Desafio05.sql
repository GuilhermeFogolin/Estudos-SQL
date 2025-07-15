-- Desafio 05

WITH visitas AS (
	SELECT
		customer_id AS "ID Cliente",
		COUNT(*) AS "Visitas"
	FROM sales.funnel
	GROUP BY "ID Cliente"
)

SELECT *
FROM sales.customers AS cus
LEFT JOIN visitas
ON cus.customer_id = visitas."ID Cliente"
ORDER BY visitas."Visitas" DESC;