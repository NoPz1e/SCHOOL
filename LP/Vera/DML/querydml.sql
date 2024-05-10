CREATE DATABASE Loja;

USE Loja;

CREATE TABLE IF NOT EXISTS pedidos(
  id_pedido INT AUTO_INCREMENT,
  id_cliente INT,
  data_pedido DATE,
  PRIMARY KEY (id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE IF NOT EXISTS clientes(
  id_cliente INT AUTO_INCREMENT,
  nome_cliente VARCHAR(20),
  PRIMARY KEY (id_cliente)
);

INSERT INTO clientes(nome_cliente) VALUES('A A'),('B B'),('C C');
INSERT INTO pedidos(id_cliente, data_pedido) VALUES(1,"2020-12-01"),(2,"2020-12-02"),(3,"2020-12-03");

SELECT nome_cliente, data_pedido, id_pedido FROM clientes 
INNER JOIN pedidos 
ON clientes.id_cliente = pedidos.id_cliente;

INSERT INTO clientes(nome_cliente) VALUES('D D'),('E E'),('F F');
SELECT * FROM clientes;

SELECT nome_cliente, data_pedido, id_pedido FROM clientes 
LEFT OUTER JOIN pedidos 
ON clientes.id_cliente = pedidos.id_cliente;

INSERT INTO pedidos(data_pedido) VALUES("2020-12-04"),("2020-12-05"),("2020-12-06");

SELECT nome_cliente, data_pedido, id_pedido FROM clientes 
RIGHT OUTER JOIN pedidos 
ON clientes.id_cliente = pedidos.id_cliente;