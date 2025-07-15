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
ORDER BY "Meses" DESC