CREATE USER predo_henriques@localhost IDENTIFIED BY 'qwerty';

-- verificar se o utilizador for criado
  SELECT * FROM mysql.user;

-- verificar permisões atuais
SHOW GRANTS FOR predo_henriques@localhost;

-- adicionar novas permisões
  -- premissão de acesso
GRANT all
ON *.*
to predo_henriques@localhost;

  -- premissão especifica
  GRANT SELECT
  on *.*
  TO predo_henriques@localhost;


-- retirar privilegios
revoke all 
on *.*
FROM predo_henriques@localhost;

FLUSH PRIVILEGES;