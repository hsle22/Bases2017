# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: TK_TORNEO
# Generation Time: 2017-05-04 02:14:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ALUMNO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ALUMNO`;

CREATE TABLE `ALUMNO` (
  `dni` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `apellido` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ARBITRO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ARBITRO`;

CREATE TABLE `ARBITRO` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `apellido` varchar(255) NOT NULL DEFAULT '',
  `graduacion` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table COMPETENCIA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMPETENCIA`;

CREATE TABLE `COMPETENCIA` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `oro` int(11) DEFAULT NULL,
  `plata` int(11) DEFAULT NULL,
  `bronce` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table COMPETIDOR
# ------------------------------------------------------------

DROP TABLE IF EXISTS `COMPETIDOR`;

CREATE TABLE `COMPETIDOR` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `foto` blob,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `graduacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table EQUIPO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EQUIPO`;

CREATE TABLE `EQUIPO` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table ESCUELA
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ESCUELA`;

CREATE TABLE `ESCUELA` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `idPais` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPais` (`idPais`),
  CONSTRAINT `escuela_ibfk_1` FOREIGN KEY (`idPais`) REFERENCES `PAIS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table MAESTRO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MAESTRO`;

CREATE TABLE `MAESTRO` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '',
  `apellido` varchar(255) NOT NULL DEFAULT '',
  `graduacion` int(11) NOT NULL,
  `idEscuela` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idEscuela` (`idEscuela`),
  CONSTRAINT `maestro_ibfk_1` FOREIGN KEY (`idEscuela`) REFERENCES `ESCUELA` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table MODALIDAD
# ------------------------------------------------------------

DROP TABLE IF EXISTS `MODALIDAD`;

CREATE TABLE `MODALIDAD` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `edad` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `graduacion` int(11) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `modo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table PAIS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PAIS`;

CREATE TABLE `PAIS` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
