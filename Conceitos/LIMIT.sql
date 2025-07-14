-- LIMIT

SELECT * FROM sales.funnel
LIMIT 10;

-- 10 produtos mais caros

SELECT * FROM sales.products
ORDER BY price DESC
LIMIT 10;