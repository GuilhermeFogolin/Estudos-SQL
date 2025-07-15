-- Manipulação de linhas

-- Inserção

 INSERT INTO temp_tables.profissoes(professional_status, status_profissional)
 VALUES('unemployed', 'desempregado(a)'),
 ('trainee', 'estagiario(a)');

-- Atualização de linhas

UPDATE temp_tables.profissoes
SET professional_status = 'intern'
WHERE status_profissional = 'estagiario(a)';

-- Deleção de linhas

DELETE FROM temp_tables.profissoes
WHERE status_profissional = 'desempregado(a)' 
OR status_profissional = 'estagiario(a)';