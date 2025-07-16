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