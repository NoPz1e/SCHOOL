CREATE DATABASE EX5;

USE EX5;

CREATE TABLE IF NOT EXISTS filmes (
  ID_filme INT AUTO_INCREMENT,
  titulo VARCHAR(50),
  PRIMARY KEY (ID_filme)
);

CREATE TABLE IF NOT EXISTS categorias (
  ID_filme INT,
  categoria VARCHAR(10),
  FOREIGN KEY (ID_filme) REFERENCES filmes(ID_filme)
);

INSERT INTO filmes (titulo)VALUES('Star wars'),('LA casa de papel'),('Oliver benji');

INSERT INTO categorias VALUES(1, 'ação'),(2,'sport'),(3,'sport');