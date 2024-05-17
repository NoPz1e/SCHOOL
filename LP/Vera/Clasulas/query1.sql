CREATE DATABASE SubQueries;
USE SubQueries;

CREATE TABLE IF NOT EXISTS orquestra(
  id_orquestra INT AUTO_INCREMENT,
  nome VARCHAR(15),
  rating DECIMAL(3,1),
  cidade VARCHAR(15),
  pais VARCHAR(15),
  PRIMARY KEY(id_orquestra)
);

CREATE TABLE IF NOT EXISTS membros(
  id_membro INT AUTO_INCREMENT,
  nome VARCHAR(15),
  função VARCHAR(30),
  anos_experiencia INT,
  salario DECIMAL(6,2),
  id_orquestra INT,
  PRIMARY KEY(id_membro),
  FOREIGN KEY (id_orquestra) REFERENCES orquestra(id_orquestra)
);

CREATE TABLE IF NOT EXISTS concertos(
  id_concerto INT AUTO_INCREMENT,
  cidade VARCHAR(15),
  pais VARCHAR(15),
  ano year,
  rating DECIMAL(3,1),
  id_orquestra INT,
  PRIMARY KEY(id_concerto),
  FOREIGN KEY (id_orquestra) REFERENCES orquestra(id_orquestra)
);

INSERT INTO orquestra(nome, rating, cidade, pais)
VALUES('FQuiaense', 1.2, 'Quiaios','Portugal'),
('Spaiao', 99.8, 'paiao','Portugal'),
('opera', 88.6, 'New your','USA'),
('FRMira', 72.8, 'Mira','Portugal');

INSERT INTO membros(nome, função, anos_experiencia, salario, id_orquestra) 
VALUES('Simao','Clarinete',10, 20.0,1),
('Fred','Trompete',16, 2000, 3),
('David','Bombo',5, 250, 2),
('Alexandre', 'Bateria',18, 150, 4),
('Alberto','Flauta',12, 2150,3),
('Ana','Tuba',1, 1550, 3),
('Joao','Trombone',4, 250, 4),
('Andre', 'Oboe',2, 150, 2);

INSERT INTO concertos(cidade, pais, ano,rating, id_orquestra)
VALUES('Coimbra', 'Portugal', '2024',9.2, 2),
('Porto', 'Portugal', '2024',6.5, 4),
('Orlando', 'USA', '2024',8.7,3),
('Fig da Foz', 'Portugal', '2024',4.7,1),
('lisboa', 'Portugal', '2024',9.7,3),
('Sevilha', 'Espanha', '2023',6.9,4);

-- ---A---
SELECT nome FROM orquestra
WHERE pais IN (
  SELECT DISTINCT pais 
  FROM concertos WHERE ano = '2024'
);

-- ---B---
SELECT nome, função 
FROM membros
WHERE id_orquestra IN (
  SELECT id_orquestra 
  FROM orquestra
  WHERE rating > 8
) 
AND anos_experiencia > 10;


-- ---C---
SELECT nome, função
FROM membros
WHERE 