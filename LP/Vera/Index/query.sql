CREATE DATABASE index;
USE index;

CREATE TABLE editoras (
  IdEditora SMALLINT PRIMARY KEY AUTO_INCREMENT,
  NomeEditora VARCHAR(40) NOT NULL
);

INSERT INTO editoras (NomeEditora) VALUES ('João Silva'),
('Maria Oliveira'),('Pedro Souza'),('Ana Pereira'),('José Santos'),('Carlos Lima'),('Paula Fernandes'),('Lucas Costa'),
('Fernanda Alves'),('Marcos Almeida'),('Clara Nascimento'),('Rafael Araújo'),('Juliana Moreira'),('Felipe Correia'),
('Amanda Ribeiro'),('Bruno Barbosa'),('Camila Rocha'),('Thiago Martins'),('Vanessa Monteiro'),('Gabriel Mendes');

SELECT * FROM editoras WHERE NomeEditora = 'Clara Nascimento';
EXPLAIN SELECT * FROM editoras WHERE NomeEditora = 'Clara Nascimento';

CREATE INDEX idx_editoras ON editoras(NomeEditora);

-- 1 --
CREATE TABLE IF NOT EXISTS artigos(
  id INT AUTO_INCREMENT,
  titulo VARCHAR(255),
  conteudo TEXT,
  PRIMARY KEY (id)
);

INSERT INTO artigos (titulo, conteudo) VALUES
('O Futuro da Inteligência Artificial', 'A inteligência artificial está a avançar rapidamente, prometendo revolucionar várias indústrias. Desde a saúde até às finanças, as aplicações de IA estão a tornar-se indispensáveis.'),
('Explorar as Profundezas do Oceano', 'O oceano continua a ser uma das fronteiras menos exploradas da Terra. Expedições recentes descobriram novas espécies e ecossistemas submarinos, revelando os mistérios das profundezas do mar.'),
('A Ascensão dos Veículos Elétricos', 'Os veículos elétricos (VE) estão a transformar a indústria automóvel. Com os avanços na tecnologia de baterias e o aumento das preocupações ambientais, mais consumidores estão a optar pelos VE como uma opção de transporte sustentável.'),
('Avanços na Computação Quântica', 'A computação quântica está prestes a alterar os paradigmas tradicionais da computação. Os investigadores estão a fazer progressos significativos no desenvolvimento de algoritmos quânticos que podem resolver problemas complexos muito mais rapidamente do que os computadores clássicos.'),
('O Impacto das Alterações Climáticas na Vida Selvagem', 'As alterações climáticas estão a ter um impacto profundo na vida selvagem em todo o mundo. O aumento das temperaturas e as mudanças nos padrões climáticos estão a afetar habitats, fontes de alimento e padrões de migração, ameaçando a biodiversidade.');

CREATE FULLTEXT INDEX IDx_conteudo ON artigos(conteudo);

Select * FROM artigos  WHERE MATCH(conteudo) AGAINST('elétricos');

-- 2 --
CREATE TABLE IF NOT EXISTS comentarios(
  id INT AUTO_INCREMENT,
  utilizador VARCHAR(100),
  comentario TEXT,
  PRIMARY KEY (id)
);

INSERT INTO comentarios (utilizador, comentario)
VALUES ('John Doe', 'This is a great product!'),
       ('Jane Smith', 'I found it very user-friendly.'),
       ('Alice Johnson', 'The price was reasonable.'),
       ('Bob Williams', 'I would recommend it to others.'),
       ('Michael Brown', 'It exceeded my expectations.'),
       ('Emily Jones', 'I had a positive experience.'),
       ('David Miller', 'The customer service was excellent.'),
       ('Sarah Davis', 'It was easy to set up.'),
       ('Charles Garcia', 'I am satisfied with my purchase.'),
       ('Elizabeth Clark', 'I would definitely buy it again.');

CREATE FULLTEXT INDEX fu_tex_comen ON comentarios(comentario);

SELECT utilizador, comentario FROM comentarios WHERE MATCH(comentario) AGAINST('excellent');

-- 3 --
CREATE TABLE IF NOT EXISTS funcionarios(
  id INT AUTO_INCREMENT,
  nome VARCHAR(100),
  departamento VARCHAR(100),
  data_contratação date,
  PRIMARY KEY (id)
);

INSERT INTO funcionarios (nome, departamento, data_contratação)
VALUES
  ('Ana Silva', 'Vendas', '2023-10-04'),
  ('João Oliveira', 'Vendas', '2022-05-12'),
  ('Maria Costa', 'RH', '2021-08-20'),
  ('Pedro Souza', 'TI', '2024-02-15'),
  ('Helena Santos', 'Produção', '2020-11-09'),
  ('Bruno Nunes', 'Finanças', '2022-03-07'),
  ('Carla Pereira', 'Diretoria', '2019-07-24'),
  ('Diego Mendes', 'Logística', '2021-04-11'),
  ('Fátima Rocha', 'Jurídico', '2023-01-18'),
  ('André Martins', 'Administração', '2020-12-25');

CREATE INDEX IDx_funcionarios
ON funcionarios(departamento, data_contratação);

EXPLAIN SELECT nome, departamento FROM funcionarios WHERE departamento = 'Vendas' ORDER BY data_contratação;