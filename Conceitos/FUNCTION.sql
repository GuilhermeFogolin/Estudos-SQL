-- Funções

-- Exemplo: Criar uma função para calcular a diferença entre duas datas em dias, semanas, meses e anos!

CREATE FUNCTION datediff(unidade varchar, dataInicial date, dataFinal date)
RETURNS integer
LANGUAGE SQL
AS
$$
	SELECT
		CASE
			WHEN unidade IN ('d', 'day', 'days') THEN (dataFinal - dataInicial)
			WHEN unidade IN ('w', 'week', 'weeks') THEN (dataFinal - dataInicial) / 7
			WHEN unidade IN ('m', 'month', 'months') THEN (dataFinal - dataInicial) / 30
			WHEN unidade IN ('y', 'year', 'years') THEN (dataFinal - dataInicial) / 365
			END AS "Diferença"
$$

-- Testando a função

SELECT datediff('y', '2024-07-15', CURRENT_DATE);

-- Deletando a função

DROP FUNCTION datediff;