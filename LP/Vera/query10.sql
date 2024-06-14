-- VERIFICAR SAPATILHAS E QUANTIDADES
  SELECT nome, stock
  FROM produtos order by stock;

  -- verificar procedimentos existentes
  SHOW procedure status;

  -- CRIAR o procedimento

DELIMITER $$
CREATE PRECEDURE ver_stock()
BEGIN
  SELECT nome, stock
  FROM produtos order by stock;
END $$
DELIMITER ;