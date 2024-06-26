CREATE DATABASE loja;


USE loja;

CREATE TABLE IF NOT EXISTS funcionarios(
  ID_funcionario INT AUTO_INCREMENT,
  nome VARCHAR(30),
  morada VARCHAR(40),
  contacto INT(9),
  PRIMARY KEY(ID_funcionario)
);

CREATE TABLE IF NOT EXISTS clientes(
  ID_Cliente INT AUTO_INCREMENT,
  nome VARCHAR(30),
  morada VARCHAR(40),
  contacto INT(9),
  criado_por_IDFunc INT,
  PRIMARY KEY (ID_Cliente),
  FOREIGN KEY (criado_por_IDFunc) REFERENCES funcionarios(ID_funcionario)
);

INSERT INTO funcionarios VALUES(default, 'Alberto', 'Fig da foz', 987654321),
(default, 'Maria', 'Lisboa', 946095094),
(default, 'Alberto', 'Coimbra', 153836737);

INSERt INTO clientes VALUES(default, 'Fernando', 'faro', 635764664, 2),
(default, 'Ana', 'viseu', 635764664, 3),
(default, 'Rodrigo', 'Cantanhede', 635764664, 1);

INSERt INTO clientes (nome, morada, contacto)VALUES( 'Joao', 'espanha', 635764664),
('Andreia', 'madrid', 635764664),
('Lucas', 'Mira', 635764664);

-- ----CROS JOIN----

SELECT * FROM clientes CROSS JOIN funcionarios ORDER BY ID_funcionario;

-- ----INNER JOIN----
SELECT *  FROM clientes INNER JOIN funcionarios on ID_funcionario = criado_por_IDFunc;

SELECT clientes.contacto, funcionarios.nome, funcionarios.contacto FROM clientes INNER JOIN funcionarios on ID_funcionario = criado_por_IDFunc;

SELECT clientes.contacto AS contacto_cliente, funcionarios.nome AS nome_funcionario, funcionarios.contacto FROM clientes INNER JOIN funcionarios on ID_funcionario = criado_por_IDFunc;

-- ---- OUTER JOIN----
SELECT * FROM funcionarios RIGHT outer JOIN clientes on funcionarios.ID_funcionario = clientes.criado_por_IDFunc; 