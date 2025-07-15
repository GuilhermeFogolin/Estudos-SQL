-- Tratamento de texto

-- UPPER

SELECT UPPER('São Paulo') = 'SÃO PAULO'

-- LOWER

SELECT LOWER('São Paulo') = 'são paulo'

-- TRIM: Remover espaços das extremidades

SELECT TRIM('SÃO PAULO     ') = 'SÃO PAULO'

-- REPLACE: Substituir algum caractere

SELECT REPLACE('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO'