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

Columnas calculadas:  
Select nombre, precio, cantidad,  precio * cantidad from productos;
//Lo que hace es generar una columna con el resultado de la operación math.
Funciones de cadena (métodos de cadena):
// para concatenar string donde primero se coloca el separador, ej:
SELECT concat_ws(‘-’ , ‘Miguel’, ‘Angel’);
Resultado: Miguel-Angel
//Puedo usar el length tambien
SELECT length(‘hola a todos’);  //Brinda el resultado del length
SELECT left(‘Buenas tardes’, 8; //de izq a derecha imprime 8 caracteres
SELECT right(‘Buenas tardes’, 8 // de derecha a izq imprime 8 caracteres 
SELECT ltrim(‘           Algo              ‘); //elimina todos los espacios en blanco del lado izquierdo porque es ltrim y rtrim hace lo mismo pero desde la derecha
// y trim solo saca los espacios de ambos lados.
SELECT REPLACE(‘xxx.udemy.com’, ‘x’, ‘w’);  //reemplaza el segundo carácter en toda la línea  con el tercer carácter que se coloque
SELECT REPEAT (‘SQL’ , 5); // repite 5 veces seguidas SQL
SELECT REVERSE(‘Hola’); //invierte la palabra Hola  quedando aloH
SELECT LOWER(‘paSA tODo a minusCula’);
SELECT UPPER(‘Pasa todo a MAYUSCula);  (mismo caso con UCASE)


Funciones matemáticas

SELECT ceiling(precio) FROM productos;  //redondea para arriba los precios.
SELECT floor(precio) FROM productos; //redondea para abajo.
SELECT mod(10, 3); // devuelve el resto de la división (en este caso 1) 
SELECT power(2,3); 8  //eleva al segundo parámetro (2 elevado a la 3)
SELECT round(20.60); //redondea hacia arriba o abajo depende el valor.

Clausula Order by!  //ordena alfabeticamente por el campo que requiera.
SELECT nombre, descripción, precio FROM productos ORDER BY nombre;
SELECT nombre, descripción, precio FROM productos ORDER BY nombre DESC; //lo mismo pero descendente.
// Otro requerimiento puede ser que se muestre el nombre desc y el precio asc, como actúa? Si tiene dos nombres que inician con la mismo letra, coloca en forma asc el precio, osea va primero el de menor precio.

Operadores lógicos! AND-OR-NOT-xor
SELECT * FROM productos WHERE (proveedor = ‘HP’) and (precio <= 200);
A | B | A XOR B
--------------
0 | 0 |    0
0 | 1 |    1
1 | 0 |    1
1 | 1 |    0
El XOR solo va a traer el dato, cuando se cumpla una de las dos condiciones. 
El AND si cumple las dos condiciones
El OR si cumple una  o las dos condiciones
Y el not, sino cumple la condición.
// Operadores relacionales  BETWEEN-IN  
SELECT * FROM products WHERE precio between 100 and 160; 
// muestra la info entre el rango deseado.
SELECT * FROM productos WHERE proveedor IN (‘HP’ , ‘otro dato’); // el in es como el or

//Patrones de búsqueda LIKE  not LIKE   like ‘%laptop%’  trae todo lo que contenga laptop
SELECT * FROM productos WHERE descripcion LIKE ‘%laptop%’;
SELECT * FROM productos WHERE descripcion NOT LIKE ‘%laptop%’; //trae todos, menos los que no tengan laptop
// y si quisiera traer solo los que inician con “L”  debería poner LIKE ‘L%’; 

//Patron de búsqueda REGEXP  - NOT REGEXP
//ES igual a LIKE, solo que no lleva los %
SELECT * FROM productos WHERE proveedor  REGEXP ‘logi’;
SELECT * FROM productos WHERE proveedor REGEXP ‘[a,e]’;  //trae lo que contengan a o e
SELECT * FROM productos WHERE proveedor REGEXP ‘[a-d]’; // trae lo que contenga desde la a a la d.
// función COUNT
SELECT COUNT(*) FROM productos;  //devuelve la cantidad de productos que tengo
SELECT COUNT(*) FROM productos WHERE descripcion like ‘%laptop%’;

//Funciones de agrupamiento 
SELECT SUM(cantidad) FROM productos;  //devuelve la suma de la columna cantidad
SELECT MAX(precio) FROM productos; // devuelve el precio mayor de todos (lo mismo con min)
SELECT AVG(precio) FROM productos WHERE nombre LIKE ‘%laptop%’;  //muestra el promedio de los precios que contengan laptop en el nombre.
// el tipo de dato TINYINT representa un valor pequeño
//Para valores que solo pueden ser positivos  TINYINT UNSIGNED  se le agrega unsigned.

//Funcion de agrupamiento GROUP BY
