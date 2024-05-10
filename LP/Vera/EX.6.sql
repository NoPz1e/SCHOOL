CREATE DATABASE EX6;

USE EX6;

CREATE TABLE IF NOT EXISTS modelo(
  codMod INT AUTO_INCREMENT,
  Nome varchar(10),
  Marca VARCHAR(10),
  PRIMARY KEY (codMod)
);

CREATE TABLE IF NOT EXISTS estacionamento(
  Num INT,
  Piso INT,
  Capacidade INT,
  PRIMARY KEY (Num)
);

CREATE TABLE IF NOT EXISTS cliente(
  NIF INT,
  Nome VARCHAR(20),
  dtNasc DATE,
  PRIMARY KEY (NIF)
);

CREATE TABLE IF NOT EXISTS veiculo(
  Matricula VARCHAR(8),
  ano YEAR,
  Modelo_codMod INT,
  Cliente_NIF INT,
  cor VARCHAR(10),
  PRIMARY KEY (Matricula),
  FOREIGN KEY (Modelo_codMod) REFERENCES modelo(codMod),
  FOREIGN KEY (Cliente_NIF) REFERENCES cliente(NIF)
);

CREATE TABLE IF NOT EXISTS estaciona(
  cod INT AUTO_INCREMENT,
  estacionamento_Num INT,
  veiculo_Matricula VARCHAR(8),
  dataEntrada DATE,
  dataSaida DATE,
  horaEntrada TIME,
  horaSaida TIME,
  PRIMARY KEY (cod),
  FOREIGN KEY (estacionamento_Num) REFERENCES estacionamento(Num),
  FOREIGN KEY (veiculo_Matricula) REFERENCES veiculo(Matricula)
);

INSERT INTO modelo(nome, Marca) VALUES('GTR-34', 'Nissa'), ('GTR-35', 'Nissa'),('Corsa', 'Opel'), ('Ibiza', 'Seat'), ('feista', 'Ford');
INSERT INTO estacionamento VALUES(1,1,19),(21,2,19),(3,1,19),(50,3,19),(30,2,19);
INSERT INTO cliente VALUES(123456,'Frederico', '2007-04-27'),(234567,'Critiano', '2006-06-08'),(345678,'Alexandre', '2000-07-22'),(456789,'Ana', '2007-08-06'),(567890,'David', '2005-11-14');
INSERT INTO veiculo VALUES('AD-23-43','1999',2,123456,'azul'), ('39-JF-76','1997',3,345678,'verde'),('44-BS-34','2001',5,567890,'branco'),('GS-53-FE','2012',1,234567,'verde'),('43-HR-87','2024',4,456789,'preto');
INSERT INTO estaciona(estacionamento_Num, veiculo_Matricula, dataEntrada, dataSaida,horaEntrada,horaSaida)
VALUES(50,'39-JF-76', '2024-05-01','2024-05-01','10:55:49','23:44:54'),(21,'GS-53-FE', '2024-05-01','2024-05-03','10:31:14','10:42:58'),
(1,'43-HR-87', '2024-04-26','2024-04-26','15:14:24','17:58:42'),(30,'AD-23-43', '2024-03-13','2024-04-13','08:24:44','18:55:34'),
(3,'44-BS-34', '2024-05-05','2024-05-05','07:35:52','11:24:23');
INSERT INTO cliente VALUES(098765,'Vera', '1997-06-16');
INSERT INTO veiculo VALUES('AS-75-23','2000',1,098765,'Cinza');

-- ---EX.A---
SELECT Matricula, Nome FROM veiculo 
INNER JOIN cliente
ON cliente.NIF = veiculo.Cliente_NIF;

-- ---EX.B---
SELECT NIF ,nome FROM cliente
INNER JOIN veiculo
ON cliente.NIF = veiculo.Cliente_NIF
WHERE matricula = '43-HR-87';

-- ---EX.C---
SELECT matricula, cor FROM veiculo
INNER JOIN estaciona 
ON veiculo.Matricula = estaciona.veiculo_Matricula
WHERE estaciona.cod = 1;

-- ---EX.D---
SELECT matricula, ano FROM veiculo
INNER JOIN estaciona 
ON veiculo.Matricula = estaciona.veiculo_Matricula
WHERE estaciona.cod = 1;

-- ---EX.E---
SELECT dataEntrada, dataSaida FROM estaciona
INNER JOIN veiculo
ON veiculo.Matricula = estaciona.veiculo_Matricula
WHERE Matricula = '44-BS-34';

-- ---EX.F---
SELECT Nome FROM cliente
INNER JOIN veiculo
ON cliente.NIF = veiculo.Cliente_NIF
WHERE Modelo_codMod = 1;

-- ---EX.G---
SELECT Matricula,horaEntrada,horaSaida FROM veiculo
INNER JOIN estaciona
ON veiculo.Matricula = estaciona.veiculo_Matricula
WHERE Matricula LIKE '%S%' AND cor = 'verde';

-- ---EX.H---
SELECT Nome FROM cliente
INNER JOIN estaciona, veiculo
ON cliente.NIF = veiculo.Cliente_NIF and veiculo.Matricula = estaciona.veiculo_Matricula
WHERE estaciona.cod = 2;