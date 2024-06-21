USE loja;

-- 1 --
CREATE TABLE IF NOT EXISTS cliente(
  id_cliente INT AUTO_INCREMENT,
  nome_cliente VARCHAR(20),
  email VARCHAR(30),
  PRIMARY KEY (id_cliente)
);

INSERT INTO cliente (nome_cliente) VALUES
  ('João Silva'),
  ('Maria Santos'),
  ('Carlos Oliveira'),
  ('Ana Costa'),
  ('Pedro Almeida'),
  ('Mariana Lima'),
  ('Felipe Rocha'),
  ('Beatriz Souza'),
  ('Rafael Torres'),
  ('Fernanda Duarte');

-- 2 --
-- a -- 
DELIMITER //
  CREATE PROCEDURE adicionar_produto(IN v_nome VARCHAR(255), IN v_preco decimal(10,2), IN v_quantidade int)
  BEGIN 
    INSERT INTO produtos(nome, preco, stock) VALUES(v_nome, v_preco, v_quantidade);
  END //
DELIMITER ;

CALL adicionar_produto('adidas', 12.44,120);

-- b --
DELIMITER //
  CREATE PROCEDURE adicionar_cliente(IN V_nome VARCHAR(20), IN V_email VARCHAR(30))
  BEGIN
    INSERT INTO cliente(nome_cliente, email) VALUES(V_nome, V_email);
  END //
DELIMITER ; 

CALL adicionar_cliente('Alberto', 'alberto@gmail.com');

-- c --
ALTER TABLE pedidos
ADD produto_id INT,
ADD quantidade INT;

DELIMITER //
  CREATE PROCEDURE registar_pedido(IN v_cliente_id int, IN v_produto_id int, IN v_date_pedido datetime, IN v_quantidade int)
  BEGIN
    INSERT INTO pedidos(cliente_id, data_hora, status, produto_id, quantidade) 
    VALUES (v_cliente_id, v_date_pedido, 'pendente', v_produto_id, v_quantidade);
  END //
DELIMITER ;

CALL registar_pedido(3, 2,'2024-12-31 23:59:59', 3);

-- d --
DELIMITER //
  CREATE PROCEDURE total_pedidos_cliente(IN v_cliente_id int)
  BEGIN
    SELECT v_cliente_id AS ID_cliente, COUNT(v_cliente_id) AS n_pedidos FROM pedidos;
  END //
DELIMITER ;

CALL total_pedidos_cliente(3)