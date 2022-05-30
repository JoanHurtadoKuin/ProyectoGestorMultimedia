SET auto_increment_increment = 1; 

DROP TABLE IF EXISTS `usuario` ;
CREATE TABLE IF NOT EXISTS `usuario`  (
	`id` INT AUTO_INCREMENT  PRIMARY KEY,
    `nombre` VARCHAR(100) UNIQUE NOT NULL,
    `contrasenya` VARCHAR(255) NOT NULL,
    `superusuario` BOOLEAN NOT NULL DEFAULT 0
);
ALTER TABLE `usuario` AUTO_INCREMENT = 1;
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Administrador', '$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.',true);
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Usuario', '$2a$10$IqzFRoerTGsJakv2DuLL6eLzI3qYMSSZ7bRjVZX134E59wbWfi2v2', false);
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Daniel', '$2a$10$IqzFRoerTGsJakv2DuLL6eLzI3qYMSSZ7bRjVZX134E59wbWfi2v2', false);
INSERT INTO `usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Jose', '$2a$10$IqzFRoerTGsJakv2DuLL6eLzI3qYMSSZ7bRjVZX134E59wbWfi2v2', false);

DROP TABLE IF EXISTS `categoria` ;
CREATE TABLE IF NOT EXISTS `categoria` (
    `id` INT AUTO_INCREMENT  PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `descripcion` VARCHAR(255),
    `id_supercategoria` INT NOT NULL, 
    `id_usuario` INT NOT NULL,
     KEY(`id_supercategoria`), FOREIGN KEY(`id_supercategoria`) REFERENCES `categoria`(`id`)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(`id_usuario`), FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id`)
     ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE `categoria` AUTO_INCREMENT = 1;
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `id_usuario`) VALUES (1, 'patos', 'carpeta de patos', 1, 3);
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `id_usuario`) VALUES (default, 'gatos', 'carpeta de gatos', 1, 1);
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `id_usuario`) VALUES (default, 'perros', 'carpeta de perros', 1, 2);
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `id_usuario`) VALUES (default, 'personas', 'carpeta de personas', LAST_INSERT_ID(), 2);
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `id_usuario`) VALUES (default, 'casas', 'carpeta de casas', LAST_INSERT_ID(), 2);

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
	`id_usuario` INT NOT NULL,
	 KEY(`id_categoria`), FOREIGN KEY(`id_categoria`) REFERENCES `categoria`(`id`)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 KEY(`id_usuario`), FOREIGN KEY(`id_usuario`) REFERENCES `usuario`(`id`)
     ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE `archivo` AUTO_INCREMENT = 1;
INSERT INTO `archivo` (`nombre`, `tamanyo`, `path_publico`, `tipo`, `detalle`, `descripcion`, `id_categoria`, `id_usuario`)
VALUES
	('gato_hilo','5','/c/gatos','png','Gato hilo','Gato con un hilo','1',3),
	('pato_estanque','10','/c/patos','png','Pato en un estanque','Pato en un estanque antiguo',1,3),
	('perro_parque','4','/c/perro','png','perro en un parque','perro en un parque para perros',3,2),
	('hombre_banco','1','/c/personas','png','hombre en un banco','hombre en un banco blanco',3,2),
	('casa_fachada','15','/c/casa','png','fachada grande','fachada grande de casa de pueblo',1,3);
