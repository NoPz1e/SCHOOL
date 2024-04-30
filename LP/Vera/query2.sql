-- Pergunta 1

CREATE DATABASE CinemaOnline;

use CinemaOnline;

CREATE TABLE Cinema (
  COD_cinema integer primary key, 
  Nome_cinema VARCHAR(20), 
  Sala_cinema TINYINT, 
  Capacidade_cinema SMALLINT, 
  Cidade_cinema VARCHAR(20)
);

CREATE TABLE Filmes( 
  COD_filme int primary key,
  Titulo_filme VARCHAR(100),
  Genero_filme VARCHAR(30),
  ControloParental VARCHAR(5) default 'TODOS'
;

CREATE TABLE Sessao (
  COD_sessao INT PRIMARY KEY,
  DATAHORA_sessao DATE,
  PREÇO_sessa FLOAT,
  CODFilme_sessao INT,
  FOREIGN KEY (CODFilme_sessao) REFERENCES Filmes (COD_filme),
  CODCinema_sessao INT,
  FOREIGN KEY (CODCinema_sessao) REFERENCES Cinema (COD_cinema)
);

CREATE TABLE Clientes (
  COD_cliente int primary key, 
  Nome VARCHAR(30), 
  Codigo_postal integer, 
  Genero ENUM('M','F','O'), 
  Data_nascimento DATE
);

CREATE TABLE Compras (COD_compras int primary key,
  CODcliente_compras INTEGER NOT NULL,
  CODsessao_compras INTEGER NOT NULL,
);