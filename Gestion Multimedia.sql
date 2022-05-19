Drop Database if exists `gestion_multimedia`;
Create Database if not exists `gestion_multimedia`;
Use `gestion_multimedia`;
Drop table if exists `gestion_multimedia`.`usuario` ;
CREATE TABLE if not exists `gestion_multimedia`.`usuario`  (
    `nombre` CHAR(50)  PRIMARY KEY,
    `contrasenya` CHAR(50) NOT NULL
);
Drop table if exists `gestion_multimedia`.`categoria` ;
CREATE TABLE if not exists `gestion_multimedia`.`categoria` (
    `id` int auto_increment  PRIMARY KEY,
    `nombre` CHAR(100) NOT NULL UNIQUE,
    `descripcion` CHAR(255),
    `id_subcategoria` int, 
    `nombre_usuario` CHAR(255) NOT NULL,
     key(id_subcategoria), FOREIGN KEY(id_subcategoria) REFERENCES categoria(id)
     ON delete restrict ON update cascade,
	 key(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON delete restrict ON update cascade
);
Drop table if exists `gestion_multimedia`.`archivo` ;
CREATE TABLE if not exists `gestion_multimedia`.`archivo` (
    `id` int auto_increment PRIMARY KEY,
    `nombre` CHAR(100) NOT NULL,
	`tamaño` CHAR(20) NOT NULL,
	`pathPublico` CHAR(255) NOT NULL,
	`tipo` CHAR(100) NOT NULL,
    `detalle` CHAR(255),
    `descripcion` CHAR(255),
    `id_categoria` int NOT NULL,
	`nombre_usuario` CHAR(255) NOT NULL,
	 key(id_categoria), FOREIGN KEY(id_categoria) REFERENCES categoria(id)
     ON delete restrict ON update cascade,
	 key(nombre_usuario), FOREIGN KEY(nombre_usuario) REFERENCES usuario(nombre)
     ON delete restrict ON update cascade
);
