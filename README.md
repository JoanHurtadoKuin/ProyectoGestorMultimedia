# ProyectoGestorMultimedia
C6 - Projecte final


Requerimientos


RF.1
Los administradores se han de poder registrar en la aplicación web, estableciendo un usuari/contrasenya.

RF.2
Los administradores han autenticarse a la aplicación web haciendo login.

RF.3
Los administradores han de poder hacer todo el CRUD de contenidos, usuarios y categorías a la web.

RF.4
Los administradores han de poder subir contenidos a la web.

RF.5
Los usuarios se han de poder registrar en la aplicación web, estableciendo un usuari/contrasenya.

RF.6
Los usuarios han autenticarse a la aplicación web haciendo login.

RF.7
Els administradores han de poder generar categorías de varios niveles a partir de su supercategoría.

RF.8
Los usuarios han de poder subir contenidos a la web en sus propias categorías.

RF.9
Cada contenido debe pertenecer a una de estas categorías.

RF.10
Cada contenido de cualquier tipo y se deben almacenar en la carpeta public/multimedia categoría de usuario.

RF.11
Cada contenido debera mostrar el nombre, tamaño del fichero y la ruta pública.

RF.12
Los administradores deben de poder mediante un botón copiar al portapapeles el path completo
público del contenido.

RF.13
En caso de que el contenido sea imagen o video los administradores deben poder visualizar una vista previa en el detalle del fichero.

RF.14
Si el contenido es de tipo imagen debe de poder redimensionarse automáticamente en caso que las medidas de la imagen sean superiores a los valores definidos en el fichero de configuración.

RF.15
Los administradores han de poder hacer logout de la aplicación web.

RF.16
Los usuarios han de poder hacer logout de la aplicación web.


![image](https://github.com/JoanHurtadoKuin/ProyectoGestorMultimedia/blob/master/diagramaProyectoMultimedia.jpg)


<details>
  <summary> DDL Gestror proyectos y primeros DML inserts de testeo </summary>
<br>
 
 <br>
<p align="justify">SQL </p>
  
``` sql
Drop Database if exists `heroku_33ebd3405aec3c7`;
Create Database if not exists `heroku_33ebd3405aec3c7`;
Use `heroku_33ebd3405aec3c7`;

DROP TABLE IF EXISTS `usuario` ;
CREATE TABLE IF NOT EXISTS `usuario`  (
    `nombre` VARCHAR(100)  PRIMARY KEY,
    `contrasenya` VARCHAR(255) NOT NULL,
	`superusuario` VARCHAR(100) NOT NULL,
     KEY(superusuario), FOREIGN KEY(superusuario) REFERENCES usuario(nombre)
     ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Administrador', '4321','Administrador');
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Usuario', '4321','Administrador');
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Daniel', '4321', 'Administrador');
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Jose', '4321', 'Usuario');

/*INSERT INTO `usuario` (nombre, contrasenya,tipo_superusuario)
VALUES
	('Administrador', '745258424'),
	('Usuario', '745258423'),
    ('Daniel', '745258424','Administrador'),
	('Jose', '745258423','Usuario');*/

SET auto_increment_increment = 1;
DROP TABLE IF EXISTS `categoria` ;
CREATE TABLE IF NOT EXISTS `categoria` (
    `id` INT auto_increment  PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `descripcion` VARCHAR(255),
    `id_supercategoria` INT NOT NULL, 
    `nombre_usuario` VARCHAR(100) NOT NULL,
     KEY(id_supercategoria), FOREIGN KEY(id_supercategoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'patos', 'carpeta de patos', 1 , 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'gatos', 'carpeta de gatos', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'perros', 'carpeta de perros', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'personas', 'carpeta de personas', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'casas', 'carpeta de casas', LAST_INSERT_ID(), 'Jose');

/* Inserts de testeo
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'cosas', 'carpeta de cosas', 1, 'Javier');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'casas', 'carpeta de casas', 1, 'Daniel');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'categoría', 'carpeta de categorías', 1, 'Daniel');
*/

SET auto_increment_increment = 1;
DROP TABLE IF EXISTS `archivo` ;
CREATE TABLE IF NOT EXISTS `archivo` (
    `id` INT auto_increment PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL,
	`tamanyo` INT NOT NULL,
	`path_publico` VARCHAR(255) NOT NULL,
	`tipo` VARCHAR(100) NOT NULL,
    `detalle` VARCHAR(255),
    `descripcion` VARCHAR(255),
    `id_categoria` INT NOT NULL,
	`nombre_usuario` VARCHAR(100) NOT NULL,
	 KEY(id_categoria), FOREIGN KEY(id_categoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `archivo` (nombre, tamanyo, path_publico, tipo, detalle, descripcion, id_categoria, nombre_usuario)
VALUES
	('gato_hilo','5','/c/gatos','png','Gato hilo','Gato con un hilo',1,'Daniel'),
	('pato_estanque','10','/c/patos','png','Pato en un estanque','Pato en un estanque antiguo',1,'Daniel'),
	('perro_parque','4','/c/perro','png','perro en un parque','perro en un parque para perros',3,'Daniel'),
	('hombre_banco','1','/c/personas','png','hombre en un banco','hombre en un banco blanco',4,'Daniel'),
	('casa_fachada','15','/c/casa','png','fachada grande','fachada grande de casa de pueblo',1,'Daniel');
```
  </details>
<br>


![image](https://user-images.githubusercontent.com/65864090/170564569-b9d6a0ae-3de0-428a-aa4b-963606de83a9.png)

Trello 

https://trello.com/b/68dtorAP/proyecto-7-gestor-multimedia
