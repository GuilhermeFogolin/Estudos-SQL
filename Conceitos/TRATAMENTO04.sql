-- Tratamento de data e hora

-- INTERVAL

SELECT 
	CURRENT_DATE AS "Hoje",
	CURRENT_DATE + 10 "Daqui 10 dias..." -- Soma apenas 10 dias

SELECT CURRENT_DATE + interval '10 weeks' -- 10 semanas com hora

SELECT (CURRENT_DATE + interval '10 weeks')::date -- Resultado apenas em data

SELECT CURRENT_DATE + interval '12 months' -- 12 meses

SELECT CURRENT_DATE + interval '25 hours' -- 25 horas

-- DATE_TRUNC: Truncagem de datas

SELECT
	date_trunc('month', visit_page_date)::date AS "Meses", -- Retorna primeiro dia do mês
	COUNT(*)
FROM sales.funnel
GROUP BY "Meses"
ORDER BY "Meses" DESC;

-- EXTRACT: Extração de unidades de uma data

SELECT
	'2022-01-30'::date,
	EXTRACT('dow' FROM '2022-01-30'::date); -- Day of Week

SELECT
	EXTRACT('dow' FROM visit_page_date) AS "DOW",
	COUNT(*)
FROM sales.funnel
GROUP BY "DOW"
ORDER BY "DOW";

-- Diferença de datas com operador de subtração

SELECT CURRENT_DATE - '2018-06-01'; -- Por dias

SELECT (CURRENT_DATE - '2018-06-01') / 7; -- Por semanas

SELECT (CURRENT_DATE - '2018-06-01') / 30; -- Por meses

SELECT (CURRENT_DATE - '2018-06-01') / 365; -- Por anos