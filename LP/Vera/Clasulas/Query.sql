CREATE DATABASE Clasulas;

USE Clasulas;

CREATE TABLE IF NOT EXISTS pedidos(
  id_pedido INT,
  id_cliente INT,
  data_pedido DATE,
  nome_cliente VARCHAR(10),
  quantidade INT  
);

INSERT INTO pedidos VAlUES (1, 1,"2020-05-09", 'A A', 1000), 
(2, 3,"2020-05-10", 'B B', 1500),
(3, 4,"2020-05-11", 'C C', 2000);

INSERT INTO pedidos (id_pedido, data_pedido, nome_cliente, quantidade)VAlUES 
(4,"2020-05-14", 'D D', 3000), 
(5,"2020-05-13", 'A A', 1500),
(6,"2020-05-12", 'E E', 1000);

ALTER TABLE pedidos
ADD UNIQUE (data_pedido);

INSERT INTO pedidos (data_pedido)VAlUES 
("2020-05-14");

ALTER TABLE pedidos
DROP CONSTRAINT data_pedido;


CREATE TABLE IF NOT EXISTS perguntas(
  id_pergunta INT,
  texto_pergunta VARCHAR(10),
  resposta_pergunta VARCHAR(10),
  PRIMARY KEY (id_pergunta)
);