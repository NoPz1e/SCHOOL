--  verificar pares de sapatilhas que têm menos de 5 unidades

SELECT nome, stock
FROM produtos
WHERE stock < 5 order by stock;

-- atualizar as unidades das sapatilhas
UPDATE loja.produtos
SET stock = stock +10 
WHERE stock < 5;

-- criar um procedimento
DELIMITER $$
CREATE PRECEDURE adicionar_stock()
BEGIN
  UPDATE loja.produtos
  SET stock = stock +10 
  WHERE stock < 5;
END$$
DELIMITER;

-- CHAMAR O PROCEDIMENTO
CALL adicionar_stock();