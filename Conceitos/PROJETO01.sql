-- Projeto 01: queries

-- Query 01: Receita, leads, conversão e ticket médio mês a mês

WITH leads AS
	(SELECT
		date_trunc('month', visit_page_date)::date  AS visit_page_month,
		COUNT(*) AS visit_page_count
	FROM sales.funnel
	GROUP BY visit_page_month
	ORDER BY visit_page_month
	),

payments AS 
	(SELECT
		date_trunc('month', fun.paid_date)::date AS paid_month,
		COUNT(fun.paid_date) AS paid_count,
		SUM(pro.price * (1 + fun.discount)) AS receita
	FROM sales.funnel AS fun
	LEFT JOIN sales.products AS pro
	ON fun.product_id = pro.product_id
	WHERE fun.paid_date IS NOT NULL
	GROUP BY paid_month
	ORDER BY paid_month
	)


SELECT
	l.visit_page_month AS "Mês",
	l.visit_page_count AS "Leads (#)",
	p.paid_count AS "Vendas (#)",
	(p.receita / 1000) AS "Receita (k, R$)", -- Colocando em milhares
	(p.paid_count::float / l.visit_page_count::float) AS "Conversão (%)",
	(p.receita / p.paid_count / 1000) AS "Ticket médio (k, R$)"
FROM leads l
LEFT JOIN payments p
ON l.visit_page_month = p.paid_month;

-- Query 02: País, estados e vendas

SELECT
	'Brasil' AS "País", -- Para montar o gráfico no Excel
	c.state AS "Estado",
	COUNT(f.paid_date) AS "Vendas (#)"
FROM sales.funnel f
LEFT JOIN sales.customers c
ON f.customer_id = c.customer_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY "País", "Estado"
ORDER BY "Vendas (#)" DESC
LIMIT 5;

-- Query 03: Marca e vendas

SELECT
	p.brand AS "Marca",
	COUNT(f.paid_date) AS "Vendas"
FROM sales.funnel f
LEFT JOIN sales.products p
ON f.product_id = p.product_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY "Marca"
ORDER BY "Vendas" DESC
LIMIT 5;

-- Query 04: Loja e vendas

SELECT
	s.store_name AS "Lojas",
	COUNT(f.paid_date) AS "Vendas"
FROM sales.funnel f
LEFT JOIN sales.stores s
ON f.store_id = s.store_id
WHERE paid_date BETWEEN '2021-08-01' AND '2021-08-31'
GROUP BY "Lojas"
ORDER BY "Vendas" DESC
LIMIT 5;