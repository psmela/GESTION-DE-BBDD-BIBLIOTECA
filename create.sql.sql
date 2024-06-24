CREATE DATABASE IF NOT exists Biblioteca;
CREATE TABLE `libro` (
  `id_libro` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `titulo` varchar(50),
  `autor` varchar(50),
  `isbn` varchar(50),
  `categoria` varchar(50),
  `editorial` varchar(50),
  `fecha_de_publicacion` date,
  `estado` varchar(50)
);

CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(50),
  `apellido` varchar(50),
  `direccion` varchar(50),
  `telefono` int,
  `email` varchar(50)
);

CREATE TABLE `bibliotecario` (
  `id_bibliotecario` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nombre` varchar(50),
  `apellido` varchar(50),
  `direccion` varchar(50),
  `telefono` int
);

CREATE TABLE `prestamo` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_usuario` int NOT NULL,
  `id_libro` int NOT NULL,
  `id_bibliotecario` int NOT NULL,
  `fecha_prestamo` date,
  `fecha_vencimiento` date,
  `fecha_devolucion` date
);

CREATE TABLE `auditoriaPrestamo` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `id_prestamo` int NOT NULL,
  `accion` varchar(50),
  `fecha` date
);

ALTER TABLE `prestamo` ADD FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

ALTER TABLE `prestamo` ADD FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id_libro`);

ALTER TABLE `prestamo` ADD FOREIGN KEY (`id_bibliotecario`) REFERENCES `bibliotecario` (`id_bibliotecario`);

ALTER TABLE `auditoriaPrestamo` ADD FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id_prestamo`);

