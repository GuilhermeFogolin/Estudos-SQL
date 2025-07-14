-- Operadores de comparação

SELECT
	customer_id,
	first_name,
	professional_status,
	(professional_status = 'clt') AS "Cliente CLT?"
FROM sales.customers;