DELIMITER $$
CREATE TRIGGER tr_update_cliente
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
    INSERT INTO history_cliente (antes, despues, fecha, id_cliente)
    VALUES (
        CONCAT('Nombre: ', OLD.nombre, ', Correo: ', OLD.correo),
        CONCAT('Nombre: ', NEW.nombre, ', Correo: ', NEW.correo),
        CURDATE(),
        OLD.id_cliente
    );
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER tr_before_insert_clientes
BEFORE INSERT ON clientes
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM clientes WHERE correo = NEW.correo) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El correo ya existe en la base de datos.';
    END IF;
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER tr_update_nombre_luis
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
    IF NEW.nombre = 'Luis' AND OLD.nombre <> 'Luis' THEN
        SET NEW.fecha_registro = "2022-12-12";
    END IF;
END$$
DELIMITER $$
CREATE TRIGGER tr_prevent_delete_client_with_orders
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM ordenes WHERE f_cliente = OLD.id_cliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un cliente con órdenes asociadas.';
    END IF;
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER tr_validate_cliente_in_ordenes
BEFORE INSERT ON ordenes
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT * FROM clientes WHERE id_cliente = NEW.f_cliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente especificado no existe.';
    END IF;
END$$
DELIMITER ;