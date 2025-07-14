-- Operadores lógicos

-- BETWEEN

SELECT * 
FROM sales.products
WHERE price >= 100000 AND price <= 200000;

SELECT * 
FROM sales.products
WHERE price BETWEEN 100000 AND 200000;

-- NOT

SELECT *
FROM sales.products
WHERE price < 100000 OR price > 200000;

SELECT *
FROM sales.products
WHERE price NOT BETWEEN 100000 AND 200000;

-- IN e NOT IN

SELECT *
FROM sales.products
WHERE brand = 'HONDA' OR brand = 'TOYOTA' OR brand = 'RENAULT';

SELECT *
FROM sales.products
WHERE brand IN ('HONDA', 'TOYOTA', 'RENAULT');

SELECT *
FROM sales.products
WHERE brand NOT IN ('HONDA', 'TOYOTA', 'RENAULT');

-- LIKE

SELECT DISTINCT first_name
FROM sales.customers
WHERE first_name LIKE 'GUI%' -- Começa com GUI

SELECT DISTINCT first_name
FROM sales.customers
WHERE first_name LIKE '%ANA' -- Termina com ANA

-- ILIKE (Ignora letras MAIÚSCULAS e minúsculas)

SELECT DISTINCT first_name
FROM sales.customers
WHERE first_name ILIKE 'ana%'

-- IS NULL

SELECT *
FROM temp_tables.regions
WHERE population IS NULL