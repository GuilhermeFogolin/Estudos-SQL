-- Manipulação de colunas

-- Inserção

ALTER TABLE sales.customers
ADD customer_age int;

UPDATE sales.customers
SET customer_age = datediff('y', birth_date, CURRENT_DATE)
WHERE true; -- Todas as linhas

-- Alteração do tipo da coluna

ALTER TABLE sales.customers
ALTER COLUMN customer_age TYPE varchar;

-- Alteração do nome da coluna

ALTER TABLE sales.customers
RENAME COLUMN customer_age TO age;

-- Deleção de coluna

ALTER TABLE sales.customers
DROP COLUMN age;