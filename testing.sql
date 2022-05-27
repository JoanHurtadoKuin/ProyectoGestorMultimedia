
/*Query Test Insert*/

/*Usuarios*/
/*Error en el superusuario (0 , 1) acepta 2,3,4... Porque es un tinyint*/
INSERT INTO `heroku_33ebd3405aec3c7`.`usuario` (`nombre`, `contrasenya`, `superusuario`) VALUES ('Superman', '1234', '3');


/*Categoria*/
/*Error en nombre_usuario*/
INSERT INTO `heroku_33ebd3405aec3c7`.`categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES ('6', 'coche', 'carpeta de coches', '6', 'Batman');
/*Error en la super_categoria*/
INSERT INTO `heroku_33ebd3405aec3c7`.`categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES ('6', 'fantasma', 'carpeta de fantasmas', '7', 'Superman');
/*Id duplicada*/
INSERT INTO `heroku_33ebd3405aec3c7`.`categoria` (`id`, `nombre`, `descripcion`, `id_supercategoria`, `nombre_usuario`) VALUES ('6', 'ratas', 'carpeta de ratones', '6', 'Superman');


/*Archivo*/
INSERT INTO `heroku_33ebd3405aec3c7`.`archivo` (`id`, `nombre`, `tamanyo`, `path_publico`, `tipo`, `detalle`, `descripcion`, `id_categoria`, `nombre_usuario`) VALUES ('6', 'foto_casa', '10', '/c/casa', 'png', 'detalle', 'detalle largo', '5', 'Superman');
/*Id duplicada*/
INSERT INTO `heroku_33ebd3405aec3c7`.`archivo` (`id`, `nombre`, `tamanyo`, `path_publico`, `tipo`, `detalle`, `descripcion`, `id_categoria`, `nombre_usuario`) VALUES ('6', 'moviles', '10', '/c/moviles', 'png', 'detalle moviles', 'detalle largo', '5', 'Superman');
/*Usuario inexistente*/
INSERT INTO `heroku_33ebd3405aec3c7`.`archivo` (`id`, `nombre`, `tamanyo`, `path_publico`, `tipo`, `detalle`, `descripcion`, `id_categoria`, `nombre_usuario`) VALUES ('7', 'foto_francisco', '10', '/c/fran', 'png', 'detalle', 'detalle largo', '7', 'Francisco');
/*SuperCategoria inexistente*/
INSERT INTO `heroku_33ebd3405aec3c7`.`archivo` (`id`, `nombre`, `tamanyo`, `path_publico`, `tipo`, `detalle`, `descripcion`, `id_categoria`, `nombre_usuario`) VALUES ('7', 'foto_prueba', '10', '/c/prueba', 'png', 'detalle', 'detalle largo', '8', 'Superman');
