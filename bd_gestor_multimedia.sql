
DROP TABLE IF EXISTS `usuario` ;
CREATE TABLE IF NOT EXISTS `usuario`  (
    `nombre` VARCHAR(50)  PRIMARY KEY,
    `contrasenya` VARCHAR(50) NOT NULL
);
DROP TABLE IF EXISTS `categoria` ;
CREATE TABLE IF NOT EXISTS `categoria` (
    `id` INT auto_increment  PRIMARY KEY,
    `nombre` VARCHAR(100) NOT NULL UNIQUE,
    `descripcion` VARCHAR(255),
    `id_supercategoria` INT, 
    `nombre_usuario` VARCHAR(255),
     key(id_supercategoria), FOREIGN KEY(id_supercategoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 key(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE SET NULL ON UPDATE CASCADE
);
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
	 key(id_categoria), FOREIGN KEY(id_categoria) REFERENCES categoria(id)
     ON DELETE CASCADE ON UPDATE CASCADE,
	 key(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON DELETE SET NULL ON UPDATE CASCADE
);