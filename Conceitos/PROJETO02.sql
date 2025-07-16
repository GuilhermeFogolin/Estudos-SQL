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