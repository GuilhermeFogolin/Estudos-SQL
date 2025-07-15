-- Manipulação de tabelas

-- Criação a partir de uma query

SELECT
	customer_id,
	datediff('y', birth_date, CURRENT_DATE) AS "Idade do cliente"
	INTO temp_tables.customers_age -- Inserindo os dados em uma tabela nova
FROM sales.customers;

SELECT * FROM temp_tables.customers_age; -- Tabela criada

-- Criação a patir do zero

CREATE TABLE temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
);

INSERT INTO temp_tables.profissoes(professional_status, status_profissional) -- Inserindo valores
VALUES
('freelancer', 'freelancer'),
('retired', 'aposentado(a)'),
('clt', 'clt'),
('self_employed', 'autônomo(a)'),
('other', 'outro'),
('businessman', 'empresário(a)'),
('civil_servant', 'servidor(a) público(a)'),
('student', 'estudante');

-- Deleção de tabelas

DROP TABLE temp_tables.profissoes;