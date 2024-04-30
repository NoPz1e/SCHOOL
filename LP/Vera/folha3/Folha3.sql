-- EX. A
SELECT nome, codigo_postal FROM clientes 
ORDER BY nome;

-- EX. B
SELECT * FROM filmes 
ORDER BY COD_filme DESC;

-- EX. C
SELECT nome, email FROM clientes 
WHERE genero = 'M' 
ORDER BY nome DESC;

-- EX. D
SELECT nome, dataNascimento FROM clientes 
WHERE email LIKE '%@hotmail.com' 
ORDER BY nome;