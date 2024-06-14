SELECT user FROM mysql.sql;

--CRIAR USER
CREATE USER marina_almeida@192.168.1.100 IDENTIFIED BY '123456';

SHOW GRANTS FOR marina_almeida@192.168.1.100;

-- garantir o acesso ao banco de dados 'loja'
GRANT SELECT(nome, preco),
      UPDATE(preco)
ON loja.produtos
TO marina_almeida@192.168.1.100;


revoke UPDATE(preco)
on loja.produtos
FROM marina_almeida@192.168.1.100;