-- Pergunta 1

CREATE DATABASE CinemaOnline;
USE CinemaOnline;

CREATE TABLE IF NOT EXISTS Cinema (
  COD_cinema integer primary key AUTO_INCREMENT, 
  Nome_cinema VARCHAR(20), 
  Sala_cinema TINYINT, 
  Capacidade_cinema SMALLINT, 
  Cidade_cinema VARCHAR(20)
);

INSERT INTO Cinema VALUES (1, "AAA", 1, 24, "Fig da Foz"), (2, "BBB", 2, 30, "Lisboa"),(2, "CCC", 3, 24, "Porto");

CREATE TABLE Filmes( 
  COD_filme int primary key AUTO_INCREMENT,
  Titulo_filme VARCHAR(50),
  Genero_filme VARCHAR(30),
  ControloParental VARCHAR(5) default 'TODOS'
);

INSERT INTO Filmes VALUES (default,"A","a1",default), (default,"B","b1", default), (default,"C","C1","TRR");

CREATE TABLE IF NOT EXISTS Sessao (
  COD_sessao INT PRIMARY KEY AUTO_INCREMENT,
  DATAHORA_sessao DATETIME default current_timestamp(),
  PREÇO_sessa FLOAT,
  CODFilme_sessao INT,
  FOREIGN KEY (CODFilme_sessao) REFERENCES Filmes (COD_filme),
  CODCinema_sessao INT,
  FOREIGN KEY (CODCinema_sessao) REFERENCES Cinema (COD_cinema)
);

INSERT INTO sessao(CODFilme_sessao, CODCinema_sessao, PREÇO_sessa) VALUES

CREATE TABLE if not EXISTS Clientes (
  COD_cliente int primary key AUTO_INCREMENT, 
  Nome VARCHAR(30), 
  Codigo_postal int(7), 
  Genero ENUM('M','F','O'), 
  Data_nascimento DATE --AAAA-MM-DD
)

INSERT INTO Clientes VALUES (default,"a",3080, "M", '1984-12-20'), (default,"B",9138, "F", '1993-03-14'),(default,"C",8323, "0", '1986-2-12');

CREATE TABLE iF NOT EXISTS Compras (
  COD_compras int primary key AUTO_INCREMENT,
  QUANTIDADE TINYINT NOT NULL,
  FORMAPAGAMENTO ENUM('DINHEIRO','DEBITO','CREDITO') NOT NULL,
  CODcliente_compras INT NOT NULL,
  CODsessao_compras INT NOT NULL,
  FOREIGN KEY (CODcliente_compras) REFERENCES Clientes (COD_cliente),
  FOREIGN KEY (CODsessao_compras) REFERENCES Sessao (COD_sessao)
);

INSERT INTO compras VALUES (default,4,"DINHEIRO", 1, 1), (default,5,"DEBITO", 2, 2),(default,6,"CREDITO", 3, 3);


