/* 1 */
USE DATABASE Northwind;
SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName asc;


/* 2 */
SELECT CustomerID, CompanyName, ContactName, Region
FROM Customers
WHERE Country = 'Mexico'
ORDER BY Region asc;


/* 3 */

SELECT ProductID, ProductName, SupplierID, UnitsInStock
FROM Products
WHERE CategoryID = 1 AND UnitsInStock > 0
ORDER BY UnitsInStock DESC;


/* 4 */

SELECT OrderID, ProductID, Quantity
FROM OrderDetails
WHERE OrderID IN ('10812', '10296', '10251');


/* --------Correção---------- */
-- Cria a Base de dabos
CREATE DATABASE Northwind;

-- Usa a base de dados
USE Northwind;

-- Cria uma tabela
CREATE TABLE Customers (
  CustomerID int,
  CompanyName VARCHAR(25)
);

-- Insere valores na tabela
INSERT INTO Customers Values (123,'Coca-cola'),(124,'Pepsi'),(126,'Airbus')

-- ---Pergunta 1.1--- 
-- seleciona todos os valores da tabela
SELECT * FROM Customers;

-- ---Pergunta 1.2---
-- seleciona todos valores da tabela ordenada por
SELECT * FROM Customers ORDER BY CompanyName;

-- ---Pergunta 2.1---
--adiciona colunas á tabela existente
ALTER TABLE Customers ADD ContactName VARCHAR(15);
ALTER TABLE Customers ADD Region VARCHAR(10);
ALTER TABLE Customers ADD Country VARCHAR(20);
DESC Customers;

INSERT INTO Customers VALUES (127,'NIKE','Jorge','Alta','Portugal'),(128,'Adidas','Niss','baixo','suiça'),(129,'Toyata','frederico','Alta','Mexico');
-- seleciona as caracteristicas especificas de uma tabela consoante um caracteristica especifica
SELECT ContactName,Region FROM Customers where Country = 'Mexico';

-- ---Pergunta 2.2---

SELECT ContactName,CustomerID,CompanyName,Region FROM Customers ORDER BY Region;

-- ---Pergunta 3.1---
CREATE  TABLE Products (
  CategoryID int,
  UnitsInStock int
);

INSERT INTO Products Values (1,10),(2,0),(3,15),(1,20);

SELECT * FROM Products WHERE CategoryID = 1 and UnitsInStock > 0;

-- ---Pergunta 3.2---

ALTER TABLE Products ADD ProductID int;
ALTER TABLE Products ADD ProductName VARCHAR(20);
ALTER TABLE Products ADD SupplierID int;

SELECT ProductID,ProductName,SupplierID,UnitsInStock FROM Products ORDER BY UnitsInStock DESC;

-- ---Pergunta 4.1---

CREATE TABLE orders (
  orderID int,
  ProductID int,
  Quantity int
);

INSERT INTO orders VALUES (1,123,20),(2,234,12),(3,345,20),(10812,262,20),(10296,098,356),(10251,782,53);

SELECT ProductID, Quantity, FROM orders WHERE OrderID IN ('10812', '10296', '10251');

SELECT * FROM orders;
DESC Products;