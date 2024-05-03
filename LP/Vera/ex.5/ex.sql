-- ----EX1----
SELECT titulo FROM filmes 
LEFT OUTER JOIN categorias 
ON filmes.ID_filme = categorias.ID_filme 
WHERE categoria = 'sport' ORDER BY titulo;

