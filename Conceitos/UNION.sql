-- UNION

SELECT * FROM sales.products
UNION ALL
SELECT * FROM temp_tables.products_2;