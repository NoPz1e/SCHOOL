-- ----EX1----
SELECT titulo FROM filmes 
LEFT OUTER JOIN categorias 
ON filmes.ID_filme = categorias.ID_filme 
WHERE categoria = 'sport' ORDER BY titulo;

-- -----EX2----
SELECT primeiro_nome, ultimo_nome FROM atores
LEFT OUTER JOIN filmes 
ON filmes.ID_filme = atores.ID_filme
WHERE titulo = 'wyoming strom' 
ORDER BY primeiro_nome, ultimo_nome;

-- ----EX3----
SELECT primeiro_nome, ultimo_nome FROM atores
LEFT OUTER JOIN categorias 
ON atores.ID_filme = categorias.ID_filme
WHERE categoria = 'drama' 
ORDER BY primeiro_nome, ultimo_nome;