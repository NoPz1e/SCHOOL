CREATE DATABASE loja;


USE loja;

CREATE TABLE IF NOT EXISTS funcionarios(
  ID_funcionario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30),
  morada VARCHAR(40),
  contacto INT
);

CREATE TABLE IF NOT EXISTS clientes(
  ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30),
  morada VARCHAR(40),
  contacto INT,
  criado_por_IDFunc INT,
  FOREIGN KEY (criado_por_IDFunc) REFERENCES funcionarios(ID_funcionario)
);