DELIMITER $$
USE `sql2`$$
CREATE FUNCTION `nombre_fecha_registro`(nombre VARCHAR(100),fecha_registro DATE)
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    RETURN CONCAT(nombre, ' / ', DATE_FORMAT(fecha_registro, '%Y-%m-%d'));
END $$

DELIMITER ;
;

DELIMITER $$
USE `sql2`$$
CREATE FUNCTION `MAYUS`(nombre1 VARCHAR(100))
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    RETURN upper(nombre1);
END $$

DELIMITER ;
;

SELECT MAYUS('Juan Pérez');

DELIMITER $$
USE `sql2`$$
CREATE FUNCTION `cantidad_caracteres_correo`(correo VARCHAR(100))
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    RETURN CHARACTER_LENGTH(correo);
END $$

DELIMITER ;
;

SELECT cantidad_caracteres_correo ('feliponderadOo777@gmail.com');


DELIMITER $$
USE `sql2`$$
CREATE FUNCTION `formato_fecha`(fecha DATE) 
RETURNS varchar(10) 
    DETERMINISTIC
BEGIN
    RETURN DATE_FORMAT(fecha, '%d/%m/%Y');
END$$

DELIMITER ;
;

SELECT formato_fecha('2025-05-21');

DELIMITER $$
USE `sql2`$$
CREATE FUNCTION `LOWER`(ciudad VARCHAR(100))
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    RETURN lower(ciudad);
END $$

DELIMITER ;
;

SELECT LOWER('MEDELLIN');









