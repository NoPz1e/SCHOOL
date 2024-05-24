CREATE DATABASE concetenacao;
USE concetenacao;

CREATE TABLE IF NOT EXISTS clientes(
  Nome VARCHAR(15),
  Apelido VARCHAR(15),
  Indicativo VARCHAR(15),
  Contacto VARCHAR(15)
);

INSERT INTO clientes VALUES('Cristiano','Neto','+351','969706613');
SELECT CONCAT_WS('',Nome,', ', Apelido )AS Nome_completo, CONCAT_WS(' ',Indicativo,' ' Contacto) AS Contacto_final FROM clientes;

SELECT LENGTH(Apelido) AS Tamanho_ Apelido FROM clientes;