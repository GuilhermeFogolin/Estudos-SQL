-- Exemplos com JOINS

-- Exemplo 01

SELECT
	cus.professional_status "Status profissional",
	COUNT(fun.paid_date) "Pagamentos"
FROM
	sales.funnel AS fun
	LEFT JOIN sales.customers AS cus
ON fun.customer_id = cus.customer_id
GROUP BY "Status profissional"
ORDER BY "Pagamentos" DESC;

-- Exemplo 02

SELECT
	ibge.gender AS "Gênero",
	COUNT(fun.paid_date)
FROM
	sales.funnel AS fun
	LEFT JOIN sales.customers AS cus
	ON fun.customer_id = cus.customer_id
	LEFT JOIN temp_tables.ibge_genders AS ibge
	ON LOWER(cus.first_name) = ibge.first_name
GROUP BY "Gênero";

-- Exemplos 03

SELECT
	reg.region AS "Região",
	COUNT(fun.visit_page_date) AS "Visitas"
FROM
	sales.funnel AS fun
	LEFT JOIN sales.customers AS cus
	ON fun.customer_id = cus.customer_id
	LEFT JOIN temp_tables.regions AS reg
	ON LOWER(cus.city) = LOWER(reg.city) 
	AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY "Região"
ORDER BY "Visitas" DESC;