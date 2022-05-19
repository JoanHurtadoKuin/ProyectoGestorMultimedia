DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario`  (
    `nombre` VARCHAR(50)  PRIMARY KEY,
    `contrasenya` VARCHAR(50) NOT NULL
);

INSERT INTO `usuario` (nombre, contrasenya)
VALUES
	('Daniel', '745258424'),
	('Jose', '745258423');

DROP TABLE IF EXISTS `categoria` ;
CREATE TABLE IF NOT EXISTS `categoria` (
    `id` INT auto_increment  PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `descripcion` VARCHAR(255),
    `id_supercategoria` INT, 
    `nombre_usuario` VARCHAR(50),
     KEY(id_supercategoria), FOREIGN KEY(id_supercategoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'patos', 'carpeta de patos', null, 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'gatos', 'carpeta de gatos', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'perros', 'carpeta de perros', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'personas', 'carpeta de personas', LAST_INSERT_ID(), 'Jose');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'casas', 'carpeta de casas', LAST_INSERT_ID(), 'Jose');

/* Inserts de testeo

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'cosas', 'carpeta de cosas', 1, 'Javier');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'casas', 'carpeta de casas', 1, 'Daniel');
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES (default, 'categoría', 'carpeta de categorías', 1, 'Daniel');

*/


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
	`nombre_usuario` VARCHAR(255),
	 KEY(id_categoria), FOREIGN KEY(id_categoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO `archivo` (nombre, tamanyo, path_publico, tipo, detalle, descripcion, id_categoria, nombre_usuario)
VALUES
	('gato_hilo','5','/c/gatos','png','Gato hilo','Gato con un hilo','1','Daniel'),
	('pato_estanque','10','/c/patos','png','Pato en un estanque','Pato en un estanque antiguo',1,'Daniel'),
	('perro_parque','4','/c/perro','png','perro en un parque','perro en un parque para perros',11,'Daniel'),
	('hombre_banco','1','/c/personas','png','hombre en un banco','hombre en un banco blanco',21,'Daniel'),
	('casa_fachada','15','/c/casa','png','fachada grande','fachada grande de casa de pueblo',31,'Daniel');