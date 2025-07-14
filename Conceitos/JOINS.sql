-- JOINS

-- LEFT JOIN

SELECT
	t1.cpf AS "CPF",
	t1.name AS "Nome",
	t2.state AS "Estado"
FROM
	temp_tables.tabela_1 AS t1 
	LEFT JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;	

-- INNER JOIN

SELECT
	t1.cpf AS "CPF",
	t1.name AS "Nome",
	t2.state AS "Estado"
FROM
	temp_tables.tabela_1 AS t1 
	INNER JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;	

-- RIGHT JOIN

SELECT
	t2.cpf AS "CPF",
	t1.name AS "Nome",
	t2.state AS "Estado"
FROM
	temp_tables.tabela_1 AS t1 
	RIGHT JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;	

-- FULL JOIN

SELECT
	t1.cpf AS "CPF",
	t1.name AS "Nome",
	t2.state AS "Estado"
FROM
	temp_tables.tabela_1 AS t1 
	FULL JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;