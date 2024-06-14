-- 1 --
-- CRIAR novo user com uma password
CREATE USER user@localhost IDENTIFIED BY 'senha123';

GRANT SELECT,
      UPDATE
ON DbEmpresa.pedidos
To user@localhost;

-- 2 --
REVOKE SELECT
ON DbEmpresa.pedidos
FROM user@localhost;

-- 3 --

-- CRIAR user
CREATE USER admin@localhost IDENTIFIED BY 'admin123';

-- Dar privilegios
GRANT ALL 
ON DbEmpresa.*
TO admin@localhost;

-- 4 --
REVOKE ALL
ON DbEmpresa.*
FROM admin@localhost;

-- 5 --

--criar user
CREATE USER funionario@localhost IDENTIFIED BY '123456';

-- Dar privilegios
GRANT SELECT,
      UPDATE,
      INSERT
ON DbEmpresa.produtos;
TO funionario@localhost;

-- 6 --
REVOKE UPDATE
ON DbEmpresa.produtos
FROM funionario@localhost;


-- 7 --

CREATE USER funionario_f@192.168.1.255 IDENTIFIED BY '123456';

GRANT CREATE
ON DbEmpresa.*
FROM funionario_f@192.198.1.255;