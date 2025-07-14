-- Desafio 01

-- Questão 01

SELECT DISTINCT city AS "Cidade"
FROM sales.customers
WHERE state = 'MG'
ORDER BY city;

-- Questão 02

SELECT visit_id
FROM sales.funnel
WHERE paid_date IS NOT NULL
ORDER BY paid_date DESC
LIMIT 10;

-- Questão 03

SELECT *
FROM sales.customers
WHERE birth_date >= '01-01-2000'
ORDER BY score DESC
LIMIT 10;