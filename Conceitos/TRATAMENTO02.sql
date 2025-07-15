-- Tratamento geral com CASE WHEN e COALESCE

-- Agrupamento de dados com CASE WHEN

WITH faixa_de_renda AS (
	SELECT
		income,
		CASE
			WHEN income < 5000 THEN '0 - 5000'
			WHEN income >= 5000 AND income < 10000 THEN '5000 - 10000'
			WHEN income >= 10000 AND income < 15000 THEN '10000 - 15000'
			ELSE '15000+'
			END AS "Faixas de renda"
	FROM sales.customers
)

SELECT
	"Faixas de renda",
	COUNT(*) AS "Contagem"
FROM faixa_de_renda
GROUP BY "Faixas de renda";

-- Tratamento de dados nulos com CASE WHEN

SELECT
	*,
	CASE
		WHEN population IS NOT NULL THEN population
		ELSE (SELECT AVG(population) FROM temp_tables.regions)
		END AS "População"
FROM temp_tables.regions

-- Tratamento de dados nulos com COALESCE

SELECT
	*,
	COALESCE(
		population,
		(SELECT AVG(population) FROM temp_tables.regions)) AS "População ajustada"
FROM temp_tables.regions