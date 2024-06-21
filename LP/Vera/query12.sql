DELIMITER //
  CREATE PROCEDURE ver_preco(IN v_produto_id int )
  BEGIN
    SELECT CONCAT('O valor das sapatilhas' , produtos.Nome, ' é ', produtos.preco, '€') AS preco
    FROM produtos
    WHERE produtos.produto_id = v_produto_id;
  END //
DELIMITER ;

CALL ver_preco(2);


DROP PROCEDURE ver_preco();