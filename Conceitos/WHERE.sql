-- WHERE

SELECT email, state FROM sales.customers WHERE state = 'SC'; -- Condição

SELECT email, state FROM sales.customers WHERE state = 'SC' OR state = 'MS'; -- Duas condições

SELECT email, state, birth_date 
FROM sales.customers 
WHERE (state = 'SC' OR state = 'MS')
AND birth_date < '1995-07-14'; -- Mora em SC ou MS e > de 30 anos

SELECT email, state, birth_date 
FROM sales.customers 
WHERE (state = 'SC' OR state = 'MS')
AND birth_date < '19950714'; -- Outra forma de escrever datas