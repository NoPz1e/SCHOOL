CREATE DATABASE folha3;

USE folha3;

CREATE TABLE IF NOT EXISTS clientes (
  COD_cliente INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  codigo_postal int(7),
  email VARCHAR(40),
  genero ENUM('F','M') NOT NULL,
  dataNascimento date -- AAAA-MM-DD
);

CREATE TABLE IF NOT EXISTS filmes (
  COD_filme INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50)  NOT NULL
);
 
INSERT INTO clientes VALUES (default, 'Cristiano Neto', 8339, 'Cristiano@gmail.com', 'M', '2006-06-08'), 
(default, 'Maria Albertina', 9203, 'Maria@hotmail.com', 'F', '1976-04-28'),
(default, 'David', 0202, 'david@hotmail.com', 'M', '1985-07-12'),
(default, 'Fred', 3459, 'fred@hotmail.com', 'M', '2003-05-16');

INSERT INTO filmes VALUES (default, 'Como estrelas na Terra'), 
(default, 'La casa de papel'), 
(default, 'Star wars'), 
(default, 'OUTER BANKS');