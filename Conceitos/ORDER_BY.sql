-- ORDER BY

-- Valores numéricos

SELECT * FROM sales.products
ORDER BY price;

-- Decrescente

SELECT * FROM sales.products
ORDER BY price DESC;

-- Texto (Ordenar estados distintos em ordem crescente: alfabética)

SELECT DISTINCT state
FROM sales.customers
ORDER BY state;