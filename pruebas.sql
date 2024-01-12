CREATE DATABASE IF NOT EXISTS curso;

use curso;
CREATE TABLE if NOT exists productos(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50),
    proveedor VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(5,2) UNSIGNED,
    cantidad SMALLINT UNSIGNED,
    PRIMARY KEY(id)
);

INSERT INTO productos (nombre, proveedor, descripcion, precio, cantidad) 
VALUES
    ('Laptop', 'Air Computers', 'Una buena laptop', 155.34, 50),
    ('Smartphone', 'Tech Galaxy', 'Teléfono inteligente de última generación', 599.99, 30),
    ('Tablet', 'Gadget World', 'Tableta con pantalla HD de 10 pulgadas', 249.95, 20),
    ('Auriculares Inalámbricos', 'Sound Innovations', 'Auriculares con cancelación de ruido', 129.99, 40),
    ('Monitor Curvo', 'Visual Tech', 'Monitor LED curvo de 27 pulgadas', 349.99, 15),
    ('Impresora Multifunción', 'Print Solutions', 'Impresora láser multifunción', 199.95, 25),
    ('Teclado Mecánico', 'KeyMaster', 'Teclado mecánico RGB para gamers', 89.99, 35),
    ('Cámara DSLR', 'PhotoPro', 'Cámara réflex digital de 24MP', 799.00, 10),
    ('Disco Duro Externo', 'Storage Solutions', 'Disco duro externo de 1TB USB 3.0', 79.99, 30),
    ('Altavoces Bluetooth', 'SoundWave', 'Altavoces portátiles con conectividad Bluetooth', 49.99, 50);

CREATE Table visitantes(
    nombre VARCHAR(30),
    edad TINYINT UNSIGNED,
    sexo CHAR(1),
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    telefono VARCHAR(11),
    montoCompra DECIMAL(6,2) UNSIGNED
);

INSERT INTO visitantes (nombre, edad, sexo, domicilio, ciudad, telefono, montoCompra) 
VALUES
    ('Juan Pérez', 25, 'M', 'Calle Alegre 123', 'Ciudad A', '555-1234', 120.45),
    ('María Gómez', 30, 'F', 'Avenida Principal 567', 'Ciudad B', '555-5678', 75.80),
    ('Carlos Rodríguez', 22, 'M', 'Calle Central 789', 'Ciudad C', '555-9876', 200.00),
    ('Laura Martínez', 28, 'F', 'Boulevard Norte 234', 'Ciudad A', '555-4321', 150.30),
    ('Alejandro García', 35, 'M', 'Avenida Sur 876', 'Ciudad B', '555-8765', 90.60),
    ('Sofía López', 26, 'F', 'Calle Este 345', 'Ciudad C', '555-2345', 180.75),
    ('Pedro Hernández', 29, 'M', 'Avenida Oeste 678', 'Ciudad A', '555-7654', 110.25),
    ('Ana Ramírez', 32, 'F', 'Calle Tranquila 901', 'Ciudad B', '555-3456', 95.40),
    ('Gabriel Sánchez', 27, 'M', 'Boulevard Central 123', 'Ciudad C', '555-6789', 160.90),
    ('Isabel Torres', 31, 'F', 'Calle Movida 456', 'Ciudad A', '555-8765', 130.15);

SELECT COUNT(*) FROM visitantes WHERE ciudad = 'Ciudad A';

-- aparece 4

--La forma correcta es agrupar con group BY

SELECT ciudad, COUNT(*) FROM visitantes GROUP BY ciudad;
-- aparece la descripcion de la ciudad + la cantidad por cada uno.

SELECT * from visitantes;
SELECT sexo, SUM(`montoCompra`) FROM visitantes GROUP BY sexo;
--me da el monto que gasto en total por sexo.ADD
SELECT sexo, MAX(`montoCompra`), MIN(`montoCompra`) FROM visitantes GROUP BY sexo;
-- importante que esta dento de bactics montoCompra

SELECT ciudad, sexo, COUNT(*) FROM visitantes GROUP BY ciudad, sexo;

SELECT domicilio, COUNT(*) FROM visitantes GROUP BY domicilio ASC;
SELECT * FROM visitantes;

--Registros duplicados, se pueden obviar con DISTINCT

SELECT DISTINCT proveedor FROM productos;
SELECT * FROM productos;

SELECT ciudad, COUNT(`ciudad`) from visitantes GROUP BY ciudad ;
SELECT * FROM visitantes;

SHOW INDEX FROM productos;
SHOW INDEX FROM visitantes;

SELECT * FROM productos;

CREATE INDEX i_proveedor ON productos (proveedor);
-- crea un index que puede ser NO unico, 
SHOW INDEX from productos;

DESC productos;

ALTER Table productos add stock INT(8);
-- con ALTER nos permite agregar un nuevo campo en la tabla.

ALTER TABLE productos DROP stock;
--Para eliminar un campo de la tabla

ALTER Table productos MODIFY stock INT(9) ;
-- permite modificar un campo de la TABLA

ALTER Table productos CHANGE stock campoLoco int;
--change sirve para modificar un campo de la TABLESPACE

ALTER TABLE productos DROP id;
DESC productos;

ALTER Table productos add id INT(4);
ALTER TABLE productos MODIFY id INT(11);

INSERT INTO productos (nombre, proveedor, descripcion, precio, cantidad, campoLoco) VALUES ('Producto1', 'Proveedor1', 'Descripción1', 10.99, 100, 123);

ALTER TABLE productos MODIFY id int(8) UNIQUE;

ALTER Table productos add PRIMARY KEY(id);
ALTER Table productos DROP PRIMARY key;

ALTER TABLE productos RENAME clientes;
ALTER TABLE clientes TO productos;
--Son dos formas de cambiar el nombre de las tablas.ADD

select * from productos;
ALTER TABLE productos
MODIFY COLUMN id INT(8) AUTO_INCREMENT PRIMARY KEY;
--MODIFICO el id y lo asigno como PK y autoincremento

SELECT proveedor, COUNT(proveedor) FROM productos GROUP BY proveedor ;

SELECT AVG(precio) FROM productos;
-- AVG es para sacar el promedio del campo especifico () de la tabla productos.ADDALTER TABLE productos
ALTER TABLE productos
CHANGE COLUMN cantidad stock INT(5) UNSIGNED;
--Cambiamos el nombre de la columna cantidad por stock
SELECT * FROM productos;

SELECT SUM(stock) FROM productos WHERE nombre = "Laptop";

--INNER JOIN !!  Hay dos formas de hacerlo, una explicita y otra implicita
SELECT * FROM empleado INNER JOIN departamento ON empleado.id_departamento = departamento.id_departamento;
--Esta es la forma explicita con el INNER JOIN
SELECT * FROM empleado, departamento WHERE empleado.id_departamento = departamento.id_departamento;
--Esta es la forma implicita sin el INNER JOIN
SHOW DATABASES;
SELECT * FROM productos;
SELECT * FROM visitantes;
CREATE DATABASE francesco;
SHOW DATABASES;
use francesco;
CREATE TABLE persona (
    id INT(6) AUTO_INCREMENT UNIQUE, 
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    edad INT(3),
    domicilio VARCHAR(20)
);
SELECT * FROM persona;
INSERT INTO persona 