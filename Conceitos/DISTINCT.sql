-- DISTINCT

SELECT brand FROM sales.products; -- Selecionar tudo

SELECT DISTINCT brand FROM sales.products; -- Selecionar sem duplicação

SELECT DISTINCT brand, model_year FROM sales.products; -- Mais de uma coluna