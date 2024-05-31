CREATE DATABASE FilmesVIEW;
USE FilmesVIEW

CREATE TABLE Filmes( 
  COD_filme int primary key AUTO_INCREMENT,
  Titulo_filme VARCHAR(50),
  Ano INT,
  Genero_filme VARCHAR(30),
  Avaliação Decimal,
  ControloParental VARCHAR(20) default 'TODOS'
);

INSERT INTO Filmes (Titulo_filme, Ano, Genero_filme, Avaliação, ControloParental) VALUES
('Inception', 2010, 'Sci-Fi', 8.8, '13+'),
('The Godfather', 1972, 'Crime', 9.2, '18+'),
('The Dark Knight', 2008, 'Action', 9.0, '13+'),
('Pulp Fiction', 1994, 'Crime', 8.9, '18+'),
('The Lion King', 1994, 'Animation', 8.5, '0+'),
('Forrest Gump', 1994, 'Drama', 8.8, '13+'),
('The Matrix', 1999, 'Sci-Fi', 8.7, '18+'),
('Fight Club', 1999, 'Drama', 8.8, '18+'),
('Interstellar', 2014, 'Sci-Fi', 8.6, '13+'),
('Transformers', 2007, 'Action', 7.0, '13+'),
('Twilight', 2008, 'Romance', 5.2, '13+'),
('Catwoman', 2004, 'Action', 3.4, '13+'),
('Battlefield Earth', 2000, 'Sci-Fi', 2.5, '13+'),
('The Room', 2003, 'Drama', 3.7, '18+'),
('Gigli', 2003, 'Romance', 2.6, '18+');

CREATE VIEW filmes_bons AS
SELECT Titulo_filme
FROM Filmes
WHERE Genero_filme = 'Action' and Avaliação > '7.5';