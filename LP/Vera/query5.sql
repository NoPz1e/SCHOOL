CREATE DATABASE loja;
Use loja;

CREATE TABLE produtos (
	produto_id INT AUTO_INCREMENT,
	nome VARCHAR(255),
	preco DECIMAL(10,2),
	stock INT,
    PRIMARY KEY(produto_id)
);

CREATE TABLE pedidos (
	pedido_id INT AUTO_INCREMENT,
	cliente_id INT,
	data_hora DATETIME,
	status ENUM('pendente', 'confirmado', 'cancelado'),
    PRIMARY KEY(pedido_id)
);

CREATE TABLE itens_pedido (
	item_id INT AUTO_INCREMENT,
	pedido_id int,
	produto_id int,
	quantidade INT,
    PRIMARY KEY(item_id),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
	FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

INSERT INTO produtos (nome, preco, stock) VALUES 
  ('Nike Air Max 270', 150.00, 30), ('Adidas Ultraboost', 180.00, 20),
  ('Puma RS-X', 120.00, 25), ('New Balance 990v5', 175.00, 15),
  ('Asics Gel-Kayano 27', 160.00, 18), ('Reebok Nano X1', 130.00, 22),
  ('Converse Chuck Taylor', 70.00, 50), ('Vans Old Skool', 60.00, 40),
  ('Under Armour HOVR Phantom 2', 140.00, 10), ('Saucony Endorphin Speed', 170.00, 12);

INSERT INTO pedidos (cliente_id, data_hora, status) VALUES 
  (1, '2024-06-01 10:00:00', 'confirmado'), (2, '2024-06-02 14:30:00', 'pendente'),
  (3, '2024-06-03 09:15:00', 'confirmado'), (4, '2024-06-04 11:45:00', 'cancelado'),
  (5, '2024-06-05 16:20:00', 'confirmado');

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade) VALUES 
  (1, 1, 2), (1, 3, 1), (2, 2, 1),(3, 4, 2),
  (3, 5, 1),(4, 6, 1),(5, 7, 3),(5, 8, 2);

-- 2 --
CREATE VIEW validar_stock AS
  SELECT stock
  FROM produtos
  WHERE produto_id = 1;

SAVEPOINT view1;

SELECT stock FROM produtos FOR UPDATE;

-- T1 --
BEGIN;
  UPDATE produtos SET stock = stock- 1
  WHERE produto_id = 1;

  UPDATE pedidos SET status = "pendente"
  WHERE pedido_id = 2; 

-- T2 --
BEGIN;
  UPDATE pedido SET status = "cancelado"
  WHERE pedido_id = 2;

  UPDATE produtos SET stock = stock+ 1
  WHERE produto_id = 1;
COMMIT;

SELECT "Transação concluída com êxito" AS Resultad;

SAVEPOINT T2;

-- 3 --

CREATE VIEW ver_itens_pedidos AS
  SELECT 