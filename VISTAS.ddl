CALL insertclientes('Carlos Gómez', 'carlos.gomez@example.com', '2022-05-30');
CALL insertclientes('Ana Martínez', 'ana.martinez@example.com', '2019-10-06');
CALL insertclientes('Luis Pérez', 'luis.perez@example.com', '2025-09-26');
CALL insertclientes('María López', 'maria.lopez@example.com', '2015-02-07');
CALL insertclientes('José Rodríguez', 'jose.rodriguez@example.com', '2017-11-20');
CALL insertclientes('jimmy', 'jose.rodriguez@example.com', '2017-11-20');
CALL insertordenes(3, '2025-05-20');
CALL insertordenes(1, '2025-05-19');
CALL insertordenes(5, '2025-05-18');
CALL insertordenes(2, '2025-05-17');
CALL insertordenes(8, '2025-05-16');
CALL updateclientes(5,"Luis","prueba2025@hotmail.com");
DELETE FROM clientes where id_cliente=1;
USE `sql2`;
CREATE  OR REPLACE VIEW `clientes_inscritos` AS
SELECT nombre, correo, fecha_registro as fecha_del_registro 
FROM clientes;


SELECT * FROM clientes_inscritos;


USE `sql2`;
CREATE  OR REPLACE VIEW `clientes_inscritos1` AS
SELECT nombre
FROM clientes
WHERE nombre = "Luis Pérez";


SELECT * FROM clientes_inscritos1;


USE `sql2`;
CREATE  OR REPLACE VIEW `clientes_inscritos2` AS
SELECT fecha_registro
FROM clientes
WHERE id_cliente = 4;


SELECT * FROM clientes_inscritos2;


USE `sql2`;
CREATE  OR REPLACE VIEW `clientes_inscritos3` AS
SELECT clientes.nombre, clientes.id_cliente, ordenes.id_orden
FROM clientes JOIN ordenes ON f_cliente = id_cliente;


SELECT * FROM clientes_inscritos3;


USE `sql2`;
CREATE  OR REPLACE VIEW `clientes_inscritos4` AS
SELECT clientes.fecha_registro, ordenes.fecha_orden
FROM clientes JOIN ordenes ON f_cliente = id_cliente;

SELECT * FROM clientes_inscritos4; 
