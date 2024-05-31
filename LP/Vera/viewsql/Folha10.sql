-- A --
CREATE VIEW Simples AS
SELECT * 
FROM filmes;

-- B --
CREATE VIEW Fil_dados AS
SELECT *
FROM Estacionamento
WHERE andar = 1;

-- C --
CREATE VIEW Ju_tab AS
SELECT * 
FROM tabela1, tabela2; 

-- D --
CREATE VIEW Agre_dados AS
SELECT SUM(Avaliação)
FROM filmes;

-- E --
CREATE VIEW Trans_dados AS
SELECT concat(coluna1, coluna2)
FROM tabela1

-- F --
CREATE VIEW Seg_dados AS
SELECT nome, idade
FROM CLIENTE;

-- G --
CREATE VIEW FilmeRelatorio AS
SELECT Filmes.Titulo_filme, 
Diretores.Nome_diretor
FROM Filmes
JOIN Filmes_Diretores ON Filmes.COD_filme = Filmes_Diretores.COD_filme
JOIN Diretores  ON Filmes_Diretores.COD_diretor = Diretores.COD_diretor;

-- H --
CREATE VIEW Filmes_Med AS
SELECT Titulo_filme
FROM Filmes
WHERE Avaliação < '5.0';

CREATE OR REPLACE Filmes_Med AS
SELECT *
FROM Filmes
WHERE Avaliação < '3.0';

-- I --
DROP VIEW Filmes_Med;
DROP VIEW FilmeRelatorio;
DROP VIEW Seg_dados;

-- J --
DROP VIEW Alguma_coisa;
-- MariaDB [FilmesVIEW]> DROP VIEW Alguma_coisa;
-- ERROR 4092 (42S02): Unknown VIEW: 'FilmesVIEW.Alguma_coisa'
