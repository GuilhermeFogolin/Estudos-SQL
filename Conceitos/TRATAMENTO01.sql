-- Conversão de unidades

-- Texto em data

SELECT '2021-10-01' - '2021-02-01'; -- Necessária conversão

SELECT '2021-10-01'::date - '2021-02-01'::date AS "Dias";

-- Texto em número

SELECT '100' - '10';

SELECT '100'::numeric - '10'::numeric;

-- Número em texto

SELECT REPLACE(121212::text, '1', 'A') -- Função para substituir

-- Texto em data com CAST

SELECT CAST('2021-10-01' AS date) - CAST('2021-02-01' AS date);