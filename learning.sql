SHOW DATABASES;   //muestra todas las bases de datos actuales
CREATE DATABASE alumnos;  //crea una base de datos
Use alumnos;   //cambia a la base de datos alumnos;
CREATE TABLE alumno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    curso VARCHAR(10)
);  //crea una tabla con el contenido, el tipo de dato y los espacios de cada campo.

INSERT INTO alumno (nombre, edad, curso) VALUES ('Marcelo', 46, '4A');   //inserta un dato a la tabla creada.
Otra forma: INSERT INTO alumno VALUES (‘Agostina’, 29, ‘1B’) ;  //tambien es valido.
Y otra forma:  INSERT INTO alumno (nombre, curso) VALUES (‘Fran’, ‘0A’)

ALTER TABLE alumno MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY;  //Para modificar una columna de la tabla alumno.
DESC alumno;  //para ver el contenido de la tabla alumno (veo como esta conformada)
SELECT * FROM alumno;  // permite ver el contenido de la tabla alumno.
SELECT id, nombre FROM alumno; // permite ver el contenido especifico de la tabla.
DROP DATABASE alumnos;  //borra la base de datos.
SELECT * FROM alumno WHERE edad >= 29; //muestra la info de la tabla siempre que cumpla con la condición.
DELETE FROM alumno WHERE nombre = ‘Fran’; //borra de la tabla el requerido
UPDATE alumno SET edad = 33;  //me actualiza la edad a todos los elementos de la tabla.
UPDATE alumno SET edad = 33 WHERE nombre = ‘Marcelo’;
UPDATE alumno SET edad = 25, curso = ‘5’ WHERE nombre = ‘Marcelo’;

CREATE TABLE IF NOT EXISTS producto(
    -> id INT(11) auto_increment,
    -> producto VARCHAR(20),
    -> descripcion VARCHAR(25),
    -> precio FLOAT(11,2),
    -> PRIMARY KEY(id)
    -> );  // Crea una tabla, si es que no existe.

// muestra para insertar productos
INSERT INTO producto VALUES
(null, 'Mouse Gamer', 'Mouse Pavilion Usada', 23.58),
(null, 'Teclado Mecánico', 'Teclado RGB mecánico para gamers', 89.99),
(null, 'Auriculares Inalámbricos', 'Auriculares con cancelación de ruido', 129.99),
(null, 'Monitor Curvo', 'Monitor LED curvo de 27 pulgadas', 249.99),
(null, 'Impresora Multifunción', 'Impresora láser multifunción', 179.95),
(null, 'Disco Duro Externo', 'Disco duro externo de 1TB USB 3.0', 69.99),
(null, 'Tablet Android', 'Tablet con pantalla HD de 10 pulgadas', 159.00),
(null, 'Cámara DSLR', 'Cámara réflex digital de 24MP', 599.00),
(null, 'Licuadora Profesional', 'Licuadora de alto rendimiento', 49.95),
(null, 'Batería Externa', 'Batería portátil de 10000mAh', 29.99);

//Para borrar toda una tabla y que el ID comience desde 0 se utiliza el : 
TRUNCATE TABLE producto;
// sino se utiliza :   DELETE FROM producto;

UNSIGNED : es un tipo de dato numérico positivo.
