-- Projeto 02: queries

-- Query 01: Gênero e leads

SELECT
	CASE
		WHEN i.gender = 'male' THEN 'Homens'
		WHEN i.gender = 'female' THEN 'Mulheres'
		END AS "Gênero",
	COUNT(*) AS "Leads (#)"	
FROM sales.customers c
LEFT JOIN temp_tables.ibge_genders i
ON LOWER(c.first_name) = LOWER(i.first_name)
GROUP BY i.gender;

-- Query 02: Status profissional e leads

SELECT
	CASE
		WHEN c.professional_status = 'freelancer' THEN 'freelancer'
		WHEN c.professional_status = 'retired' THEN 'aposentado(a)'
		WHEN c.professional_status = 'clt' THEN 'clt'
		WHEN c.professional_status = 'self_employed' THEN 'autônomo(a)'
		WHEN c.professional_status = 'other' THEN 'outro'
		WHEN c.professional_status = 'businessman' THEN 'empresário(a)'
		WHEN c.professional_status = 'civil_servant' THEN 'funcionário(o) público(a)'
		WHEN c.professional_status = 'student' THEN 'estudante'
		END AS "Status profissional",
	(COUNT(*)::float) / (SELECT COUNT(*) FROM sales.customers) AS "Leads (%)"
FROM sales.customers c
GROUP BY professional_status
ORDER BY "Leads (%)";

-- Query 03: Faixa etária e leads

SELECT
	CASE
		WHEN datediff('y', birth_date, CURRENT_DATE) < 20 THEN '0-20'
		WHEN datediff('y', birth_date, CURRENT_DATE) < 40 THEN '20-40'
		WHEN datediff('y', birth_date, CURRENT_DATE) < 60 THEN '40-60'
		WHEN datediff('y', birth_date, CURRENT_DATE) < 80 THEN '60-80'
		ELSE '80+'
		END AS "Faixa etária",
	COUNT(*)::float / (SELECT COUNT(*) FROM sales.customers) AS "Leads (%)"
FROM sales.customers
GROUP BY "Faixa etária"
ORDER BY "Faixa etária" DESC

-- Query 04: Faixa salarial, leads e ordem

SELECT
	CASE
		WHEN income < 5000 THEN '0-5000'
		WHEN income < 10000 THEN '5000-10000'
		WHEN income < 15000 THEN '10000-15000'
		WHEN income < 20000 THEN '15000-20000'
		ELSE '20000+'
		END AS "Faixa salarial",
	COUNT(*)::float / (SELECT COUNT(*) FROM sales.customers) AS "Leads (%)",
		CASE
		WHEN income < 5000 THEN 1
		WHEN income < 10000 THEN 2
		WHEN income < 15000 THEN 3
		WHEN income < 20000 THEN 4
		ELSE 5
		END AS "Ordem"
FROM sales.customers
GROUP BY "Faixa salarial", "Ordem"
ORDER BY "Ordem" DESC

-- Query 05: Classificação dos veículos

WITH classificacao AS (
	SELECT
		f.visit_page_date,
		p.model_year,
		EXTRACT('y' FROM visit_page_date) - p.model_year::int AS idade,
		CASE
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 2 THEN 'Novo'
			ELSE 'Seminovo'
			END AS "Classificação"
	FROM sales.funnel f
	LEFT JOIN sales.products p
	ON f.product_id = p.product_id
)

SELECT
	"Classificação",
	COUNT(*) AS "Veículos visitados"
FROM classificacao
GROUP BY "Classificação";

-- Query 06: Idade dos veículos visitados

WITH faixa_idade AS (
	SELECT
		f.visit_page_date,
		p.model_year,
		EXTRACT('y' FROM visit_page_date) - p.model_year::int AS idade,
		CASE
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 2 THEN 'Até 2 anos'
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 4 THEN 'Até 2 à 4 anos'
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 6 THEN 'Até 4 à 6 anos'
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 8 THEN 'Até 6 à 8 anos'
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 10 THEN 'Até 8 à 10 anos'
			ELSE 'Acima de 10 anos'
			END AS "Idade do veículo",
		CASE
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 2 THEN 1
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 4 THEN 2
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 6 THEN 3
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 8 THEN 4
			WHEN (EXTRACT('y' FROM visit_page_date) - p.model_year::int) <= 10 THEN 5
			ELSE 6
			END AS "Ordem"
	FROM sales.funnel f
	LEFT JOIN sales.products p
	ON f.product_id = p.product_id
)

SELECT
	"Idade do veículo",
	COUNT(*)::float / (SELECT COUNT(*) FROM sales.funnel) AS "Veículos visitados (%)",
	"Ordem"
FROM faixa_idade
GROUP BY "Idade do veículo", "Ordem"
ORDER BY "Ordem";

-- Query 07: Marca, modelo e visitas

SELECT
	p.brand AS "Marca",
	p.model AS "Modelo",
	COUNT(*) AS "Visitas (#)"
FROM sales.funnel f
LEFT JOIN sales.products p
ON f.product_id = p.product_id
GROUP BY p.brand, p.model
ORDER BY p.brand, p.model, "Visitas (#)";