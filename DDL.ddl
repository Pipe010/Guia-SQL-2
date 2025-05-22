DROP DATABASE if exists SQL2;
CREATE DATABASE SQL2;
USE SQL2;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) ,
    correo VARCHAR(100) UNIQUE,
    fecha_registro DATE
);


CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY AUTO_INCREMENT,
    f_cliente INT,
    fecha_orden DATE
	
);
CREATE TABLE history_cliente(
	id_h_cli int PRIMARY KEY AUTO_INCREMENT,
    antes varchar(80),
    despues varchar(80),
    fecha date,
    id_cliente int
);

ALTER TABLE ordenes ADD CONSTRAINT FKCli_Ord FOREIGN KEY (f_cliente) REFERENCES clientes(id_cliente);
ALTER TABLE history_cliente ADD CONSTRAINT FKCli_H_Cli FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);