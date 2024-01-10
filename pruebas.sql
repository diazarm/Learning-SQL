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
