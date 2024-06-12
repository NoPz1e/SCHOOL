SELECT @@autocommit;
SET @@autocommit = off;

CREATE DATABASE loja;
USE loja;
CREATE TABLE IF NOT EXISTS movimentos_bancarios(
  id_cliente int,
  fundos int
);

insert into movimentos_bancarios VALUES(1,200),(2,400),(3,500),(4,600),(5,700);

CREATE VIEW verifica_fundos AS
  SELECT fundos FROM movimentos_bancarios
  WHERE id_cliente=4;

SELECT * FROM verifica_fundos;

### Criar primeira transação
BEGIN;
  SELECT * FROM verifica_fundos FOR UPDATE; 
  SAVEPOINT update1;
  
  UPDATE movimentos_bancarios SET fundos = fundos - 200
  WHERE id_cliente = 4; 

COMMIT;
SAVEPOINT T1;

BEGIN;
  UPDATE movimentos_bancarios
  SET fundos = fundos +200
  WHERE id_cliente;
COMMIT;

SAVEPOINT T2;