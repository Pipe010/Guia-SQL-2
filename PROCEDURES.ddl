USE `sql2`;
DROP procedure IF EXISTS `insertclientes`;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `insertclientes` (

    IN nom VARCHAR(100),
    IN co VARCHAR(100),
    IN freg DATE
)
BEGIN

	INSERT INTO clientes (nombre, correo, fecha_registro)
    VALUES (nom, co, freg);

END$$

DELIMITER ;

USE `sql2`;
DROP procedure IF EXISTS `insertordenes`;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `insertordenes`(
    IN f_cl INT(11),
    IN f_ord DATE
)
BEGIN

	INSERT INTO ordenes (f_cliente, fecha_orden)
    VALUES (f_cl, f_ord);

END$$

DELIMITER ;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `updateclientes`(
    IN u_id_cl INT,
    IN u_nom VARCHAR(100),
    IN u_co VARCHAR(100)
    
)
BEGIN

    UPDATE clientes
    SET nombre = u_nom,
        correo = u_co
    WHERE id_cliente = u_id_cl;
    
END$$

DELIMITER ;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `updateordenes`(

    IN u_id_ord INT,
    IN u_f_ord DATE

)
BEGIN
    UPDATE ordenes
    SET fecha_orden = u_f_ord
    WHERE id_orden = u_id_ord;

END$$

DELIMITER ;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `deleteclientes`(

    IN d_id_cl INT
    
)
BEGIN

    DELETE FROM clientes
    WHERE id_cliente = d_id_cl;

END$$

DELIMITER ;

DELIMITER $$
USE `sql2`$$
CREATE PROCEDURE `deleteordenes`(

    IN d_id_ord INT
    
)
BEGIN

    DELETE FROM ordenes
    WHERE id_orden = d_id_ord;

END$$

DELIMITER ;



