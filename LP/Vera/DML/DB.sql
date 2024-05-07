CREATE DATABASE DML1;

USE DML1;

CREATE TABLE IF NOT EXISTS SUM (
  pedidoID INT,
  Empresa VARCHAR(20),
  Quantidade INT
);

INSERT INTO SUM VALUES(1,"A", 20), (2,"B", 50), (3,"A", 50);
INSERT INTO SUM (pedidoID, Empresa) VALUES(4,"B");

SELECT sum(quantidade) FROM SUM;

SELECT Empresa AS Nome_Empresa, sum(quantidade) FROM SUM GROUP BY Empresa;

SELECT Count(quantidade) FROM SUM;

CREATE TABLE IF NOT EXISTS avgValues(
  pedidoID INT,
  Cliente VARCHAR(20),
  Quantidade INT
);

INSERT INTO avgValues VALUES(1,"A",30), (2,"A",40), (3,"B",20), (4,"B",60), (5,"C",50), (6,"C",10);

SELECT AVG(quantidade) FROM avgValues;

SELECT AVG(quantidade) FROM avgValues GROUP BY Cliente;


CREATE TABLE IF NOT EXISTS minMax(
  pedidoID INT,
  Cliente VARCHAR(5),
  Data_Pedido date
);

INSERT INTO minMax VALUES(1,"C01","2020-05-06"),(2,"C03","2020-09-05"),(3,"C03","2020-08-01");