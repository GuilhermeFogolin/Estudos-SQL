-- Desafio 04

-- Questão 01

SELECT
	COUNT(fun.product_id) AS "Visitas",
	pro.brand AS "Marcas"
FROM
	sales.funnel AS fun
	LEFT JOIN sales.products AS pro
	ON fun.product_id = pro.product_id
GROUP BY "Marcas"
ORDER BY "Visitas" DESC;

-- Questão 02

SELECT
	COUNT(fun.store_id) AS "Visitas",
	str.store_name AS "Lojas"
FROM
	sales.funnel AS fun
	LEFT JOIN sales.stores AS str
	ON fun.store_id = str.store_id
GROUP BY "Lojas"
ORDER BY "Visitas" DESC;

-- Questão 03

SELECT
	COUNT(cus.customer_id) AS "Clientes",
	reg.size AS "Tamanhos"
FROM
	sales.customers AS cus
	LEFT JOIN temp_tables.regions AS reg
	ON LOWER(cus.city) = LOWER(reg.city)
	AND LOWER(cus.state) = LOWER(reg.state) -- Diferenciar cidades com mesmo nome
GROUP BY "Tamanhos"
ORDER BY "Clientes" DESC;