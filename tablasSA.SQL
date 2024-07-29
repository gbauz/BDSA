CREATE DATABASE IF NOT EXISTS `p_verificacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p_verificacion`;

-- Table structure for table `nivel`
DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `nivel`
INSERT INTO `nivel` VALUES (1,'Nivel 1'),(2,'Nivel 2'),(3,'Nivel 3');

-- Table structure for table `cursos`
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id_Curso` int NOT NULL AUTO_INCREMENT,
  `Curso` varchar(255) NOT NULL,
  `Materia` varchar(255) NOT NULL,
  `Docente` varchar(255) NOT NULL,
  `Horario` varchar(255) NOT NULL,
  `id_nivel` int DEFAULT NULL,
  PRIMARY KEY (`id_Curso`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `cursos`
INSERT INTO `cursos` VALUES 
(1,'1-1','Grammar','Ana Torres','Lunes 10:00-12:00',1),
(2,'2-1','Listening','Carlos Méndez','Martes 14:00-16:00',1),
(3,'3-1','Speaking','Laura Fernández','Miércoles 09:00-11:00',2),
(4,'1-2','Grammar','Jorge López','Jueves 11:00-13:00',2),
(5,'2-2','Listening','Marta García','Viernes 15:00-17:00',3),
(6,'3-2','Speaking','Luis Pérez','Sábado 10:00-12:00',3);

-- Table structure for table `insumos`
DROP TABLE IF EXISTS `insumos`;
CREATE TABLE `insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` varchar(50) DEFAULT NULL,
  `insumo1` int DEFAULT '0',
  `insumo2` int DEFAULT '0',
  `insumo3` int DEFAULT '0',
  `id_curso` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `fk_curso` (`id_curso`),
  CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_Curso`),
  CONSTRAINT `insumos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `insumos`
INSERT INTO `insumos` VALUES 
(1,'2233445566',15,25,35,1),
(2,'3344556677',20,30,40,2),
(3,'0955308374',9,10,5,2),
(4,'0951995240',10,5,10,3),
(5,'87654321',1,5,6,3),
(6,'12345678',14,16,89,5),
(7,'12345678',17,18,19,6),
(8,'0950741306',12,6,17,3),
(9,'0950741306',16,18,40,4);

-- Table structure for table `matricula`
DROP TABLE IF EXISTS `matricula`;
CREATE TABLE `matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `cedula_usuario` varchar(50) DEFAULT NULL,
  `id_cursos` int DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `cedula_usuario` (`cedula_usuario`),
  KEY `id_cursos` (`id_cursos`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuario` (`cedula`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_Curso`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `matricula`
INSERT INTO `matricula` VALUES 
(1,'0955308374',2),
(2,'0951995240',3),
(3,'5060481213',5),
(4,'1213443355445',NULL),
(5,'12345678',5),
(6,'12345678',6),
(7,'0950741306',3),
(8,'0950741306',4);

-- Table structure for table `permisos`
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(255) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `permisos`
INSERT INTO `permisos` VALUES 
(1,'Ver Calificaciones'),
(2,'Ingresar Calificaciones'),
(3,'Ver Asistencia');

-- Table structure for table `rol`
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `rol`
INSERT INTO `rol` VALUES 
(1,'Estudiante'),
(2,'Docente'),
(3,'Secretario');

-- Table structure for table `roles_permisos`
DROP TABLE IF EXISTS `roles_permisos`;
CREATE TABLE `roles_permisos` (
  `id_rol` int DEFAULT NULL,
  `id_permiso` int DEFAULT NULL,
  KEY `id_rol` (`id_rol`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `roles_permisos`
INSERT INTO `roles_permisos` VALUES 
(1,2),
(1,1),
(2,3);

-- Table structure for table `usuario`
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `cedula` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol_id` int DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Insert data for table `usuario`
INSERT INTO `usuario` VALUES 
('0950741306','Bruno BAQUE','BRUNO@baque.com','12345',3),
('0951995240','Paul Rizo','paul@gmail.com','123',3),
('0955308374','Josue','josue@gmail.com','123',3),
('1213443355445','josue','jose69@gmail.com','123',3),
('12345678','Juan Pérez','juan@example.com','contraseña',1),
('2233445566','Ana Gómez','ana@example.com','passwordabc',3),
('3344556677','Pedro Martínez','pedro@example.com','passworddef',3),
('5060481213','pelusa','pelusa_45@gamil.com','123',3),
('87654321','Ana Gómez','ana@example.com','contraseña',2);
