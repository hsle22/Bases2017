# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.16)
# Database: taekwondo
# Generation Time: 2017-05-05 16:51:56 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Alumno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Alumno`;

CREATE TABLE `Alumno` (
  `idAlumno` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `idEscuela` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `fk_Alumno_Escuela_idx` (`idEscuela`),
  CONSTRAINT `fk_Alumno_Escuela` FOREIGN KEY (`idEscuela`) REFERENCES `Escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;

INSERT INTO `Alumno` (`idAlumno`, `nombre`, `apellido`, `idEscuela`)
VALUES
	(1,'Lucho','Dzuk',1),
	(2,'Lean','Torres',1),
	(3,'Mati','Aria',1),
	(4,'Agus','Y',2),
	(5,'Sofi','Barr',2),
	(6,'Sousuke','Aizen',4),
	(7,'Gohan','Sayan',3),
	(8,'Trunks','Sayan',3),
	(9,'Lin','Lin',5);

/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Arbitro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Arbitro`;

CREATE TABLE `Arbitro` (
  `nroPlacaArbitro` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `graduacion` varchar(10) NOT NULL,
  `idPais` int(11) NOT NULL,
  PRIMARY KEY (`nroPlacaArbitro`),
  KEY `fk_Arbitro_Pais_idx` (`idPais`),
  CONSTRAINT `fk_Arbitro_Pais` FOREIGN KEY (`idPais`) REFERENCES `Pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Arbitro` WRITE;
/*!40000 ALTER TABLE `Arbitro` DISABLE KEYS */;

INSERT INTO `Arbitro` (`nroPlacaArbitro`, `nombre`, `apellido`, `graduacion`, `idPais`)
VALUES
	(1,'Juan','Perea','1',1),
	(2,'Juan','Pereb','2',1),
	(3,'Juan','Perec','2',2),
	(4,'Juan','Pered','30',2),
	(5,'Juan','Peree','2',1);

/*!40000 ALTER TABLE `Arbitro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table arbitrosEnCompetencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `arbitrosEnCompetencias`;

CREATE TABLE `arbitrosEnCompetencias` (
  `nroPlacaArbitro` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  PRIMARY KEY (`nroPlacaArbitro`,`idCompetencia`),
  KEY `fk_arbitrosEnCompetencias_Competencia_idx` (`idCompetencia`),
  CONSTRAINT `fk_arbitrosEnCompetencias_Arbitro` FOREIGN KEY (`nroPlacaArbitro`) REFERENCES `Arbitro` (`nroPlacaArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbitrosEnCompetencias_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `arbitrosEnCompetencias` WRITE;
/*!40000 ALTER TABLE `arbitrosEnCompetencias` DISABLE KEYS */;

INSERT INTO `arbitrosEnCompetencias` (`nroPlacaArbitro`, `idCompetencia`)
VALUES
	(1,1),
	(2,1),
	(1,2),
	(2,2),
	(3,3),
	(4,3),
	(3,4),
	(4,4);

/*!40000 ALTER TABLE `arbitrosEnCompetencias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Coach
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Coach`;

CREATE TABLE `Coach` (
  `dniAlumno` int(11) NOT NULL,
  `nroITF` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `graduacion` varchar(45) NOT NULL,
  PRIMARY KEY (`dniAlumno`),
  CONSTRAINT `fk_Coach_Alumno` FOREIGN KEY (`dniAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;

INSERT INTO `Coach` (`dniAlumno`, `nroITF`, `foto`, `graduacion`)
VALUES
	(3,1,NULL,'1'),
	(7,2,NULL,'3');

/*!40000 ALTER TABLE `Coach` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Competencia
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Competencia`;

CREATE TABLE `Competencia` (
  `idCompetencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `idModalidad` int(11) NOT NULL,
  PRIMARY KEY (`idCompetencia`),
  KEY `fk_Competencia_Modalidad_idx` (`idModalidad`),
  CONSTRAINT `fk_Competencia_Modalidad` FOREIGN KEY (`idModalidad`) REFERENCES `Modalidad` (`idModalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Competencia` WRITE;
/*!40000 ALTER TABLE `Competencia` DISABLE KEYS */;

INSERT INTO `Competencia` (`idCompetencia`, `Descripcion`, `idModalidad`)
VALUES
	(1,'saltarinesChicos',1),
	(2,'saltaronesChicos',2),
	(3,'bardoNenes',13),
	(4,'rotoChicas',11);

/*!40000 ALTER TABLE `Competencia` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Competidor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Competidor`;

CREATE TABLE `Competidor` (
  `dniCompetidor` int(11) NOT NULL,
  `nroITF` int(11) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` varchar(45) NOT NULL,
  `graduacion` varchar(10) NOT NULL,
  `peso` int(11) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `esTitular` tinyint(1) DEFAULT NULL,
  `idEquipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`dniCompetidor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;

INSERT INTO `Competidor` (`dniCompetidor`, `nroITF`, `fechaNacimiento`, `genero`, `graduacion`, `peso`, `foto`, `esTitular`, `idEquipo`)
VALUES
	(1,1,'1991-10-12','M','1',75,'',NULL,1),
	(2,2,'1991-10-12','M','1',75,'',NULL,1),
	(3,3,'2000-10-12','M','1',55,'',NULL,NULL),
	(4,4,'1991-10-12','F','4',75,'',NULL,2),
	(5,5,'2000-10-12','F','4',55,'',NULL,NULL),
	(6,6,'1991-10-12','F','4',55,'',NULL,2);

/*!40000 ALTER TABLE `Competidor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table compiteEnCompetenciaInd
# ------------------------------------------------------------

DROP TABLE IF EXISTS `compiteEnCompetenciaInd`;

CREATE TABLE `compiteEnCompetenciaInd` (
  `dniCompetidor` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `dniCoach` int(11) NOT NULL,
  `puestoCompetidor` int(11) DEFAULT NULL,
  PRIMARY KEY (`dniCompetidor`,`idCompetencia`),
  KEY `fk_compiteEnCompetenciaInd_competencia_idx` (`idCompetencia`),
  KEY `fk_compiteEnCompetenciaInd_coach_idx` (`dniCoach`),
  CONSTRAINT `fk_compiteEnCompetenciaInd_coach` FOREIGN KEY (`dniCoach`) REFERENCES `Coach` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaInd_competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaInd_competidor` FOREIGN KEY (`dniCompetidor`) REFERENCES `Competidor` (`dniCompetidor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `compiteEnCompetenciaInd` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaInd` DISABLE KEYS */;

INSERT INTO `compiteEnCompetenciaInd` (`dniCompetidor`, `idCompetencia`, `dniCoach`, `puestoCompetidor`)
VALUES
	(1,2,3,1),
	(2,2,3,2),
	(3,1,3,3);

/*!40000 ALTER TABLE `compiteEnCompetenciaInd` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table compiteEnCompetenciaTeam
# ------------------------------------------------------------

DROP TABLE IF EXISTS `compiteEnCompetenciaTeam`;

CREATE TABLE `compiteEnCompetenciaTeam` (
  `idEquipo` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `dniCoach` int(11) NOT NULL,
  `puestoTeam` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`,`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_Competencia_idx` (`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_coach_idx` (`dniCoach`),
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Equipo` FOREIGN KEY (`idEquipo`) REFERENCES `Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_coach` FOREIGN KEY (`dniCoach`) REFERENCES `Coach` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `compiteEnCompetenciaTeam` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaTeam` DISABLE KEYS */;

INSERT INTO `compiteEnCompetenciaTeam` (`idEquipo`, `idCompetencia`, `dniCoach`, `puestoTeam`)
VALUES
	(1,1,3,2),
	(1,2,3,1),
	(2,1,3,3);

/*!40000 ALTER TABLE `compiteEnCompetenciaTeam` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Equipo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Equipo`;

CREATE TABLE `Equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;

INSERT INTO `Equipo` (`idEquipo`, `nombre`)
VALUES
	(1,'AdultosTeam'),
	(2,'AdultosTeam2');

/*!40000 ALTER TABLE `Equipo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Escuela
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Escuela`;

CREATE TABLE `Escuela` (
  `idEscuela` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `nombre` varchar(100) DEFAULT NULL,
  `idPais` int(11) NOT NULL,
  `nroPlacaInstructor` int(11) NOT NULL,
  PRIMARY KEY (`idEscuela`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_Escuela_Pais_idx` (`idPais`),
  KEY `fk_Escuela_Maestro_idx` (`nroPlacaInstructor`),
  CONSTRAINT `fk_Escuela_Maestro` FOREIGN KEY (`nroPlacaInstructor`) REFERENCES `Maestro` (`nroPaclaInstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_Pais` FOREIGN KEY (`idPais`) REFERENCES `Pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;

INSERT INTO `Escuela` (`idEscuela`, `nombre`, `idPais`, `nroPlacaInstructor`)
VALUES
	(1,'Meli',1,1),
	(2,'Tired',3,2),
	(3,'Sayan',3,3),
	(4,'Rukia',1,4),
	(5,'Cute',2,5);

/*!40000 ALTER TABLE `Escuela` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Maestro
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Maestro`;

CREATE TABLE `Maestro` (
  `nroPaclaInstructor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `graduacion` varchar(10) NOT NULL,
  PRIMARY KEY (`nroPaclaInstructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Maestro` WRITE;
/*!40000 ALTER TABLE `Maestro` DISABLE KEYS */;

INSERT INTO `Maestro` (`nroPaclaInstructor`, `nombre`, `apellido`, `graduacion`)
VALUES
	(1,'Martin','Stanca','1'),
	(2,'Ian','Sabarros','3'),
	(3,'Kaka','Roto','100'),
	(4,'Ichigo','Kurosaki','4'),
	(5,'Inoe','Orihime','2');

/*!40000 ALTER TABLE `Maestro` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Modalidad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Modalidad`;

CREATE TABLE `Modalidad` (
  `idModalidad` int(11) NOT NULL,
  `Modo` varchar(45) NOT NULL,
  `edadMinima` int(11) DEFAULT NULL,
  `edadMaxima` int(11) DEFAULT NULL,
  `pesoMinimo` int(11) DEFAULT NULL,
  `pesoMaximo` int(11) DEFAULT NULL,
  `graduacion` int(11) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  PRIMARY KEY (`idModalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Modalidad` WRITE;
/*!40000 ALTER TABLE `Modalidad` DISABLE KEYS */;

INSERT INTO `Modalidad` (`idModalidad`, `Modo`, `edadMinima`, `edadMaxima`, `pesoMinimo`, `pesoMaximo`, `graduacion`, `sexo`)
VALUES
	(1,'Salto',14,17,NULL,NULL,1,'M'),
	(2,'Salto',18,35,NULL,NULL,1,'M'),
	(3,'Salto',14,17,NULL,NULL,1,'F'),
	(4,'Salto',18,35,NULL,NULL,1,'F'),
	(5,'Combate',14,17,50,60,1,'M'),
	(6,'Combate',18,35,70,80,1,'M'),
	(7,'Combate',14,17,50,60,1,'F'),
	(8,'Combate',18,35,70,80,1,'F'),
	(9,'Rotura',NULL,NULL,NULL,NULL,1,'M'),
	(10,'Rotura',NULL,NULL,NULL,NULL,1,'M'),
	(11,'Rotura',NULL,NULL,NULL,NULL,1,'F'),
	(12,'Rotura',NULL,NULL,NULL,NULL,1,'F'),
	(13,'CombateEquipos',NULL,NULL,NULL,NULL,NULL,'M'),
	(14,'CombateEquipos',NULL,NULL,NULL,NULL,NULL,'F'),
	(15,'Formas',14,17,NULL,NULL,1,'M'),
	(16,'Formas',18,35,NULL,NULL,1,'M'),
	(17,'Formas',14,17,NULL,NULL,1,'F'),
	(18,'Formas',18,35,NULL,NULL,1,'F'),
	(19,'Formas',14,17,NULL,NULL,4,'M'),
	(20,'Formas',18,35,NULL,NULL,4,'M'),
	(21,'Formas',14,17,NULL,NULL,4,'F'),
	(22,'Formas',18,35,NULL,NULL,4,'F');

/*!40000 ALTER TABLE `Modalidad` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Pais
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Pais`;

CREATE TABLE `Pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;

INSERT INTO `Pais` (`idPais`, `nombre`)
VALUES
	(1,'Argentina'),
	(2,'Peru'),
	(3,'Brasil');

/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table puestoArbitroEnRing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `puestoArbitroEnRing`;

CREATE TABLE `puestoArbitroEnRing` (
  `nroPlacaArbitro` int(11) NOT NULL,
  `idRing` int(11) NOT NULL,
  `puestoArbitroEnRing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nroPlacaArbitro`,`idRing`),
  KEY `fk_puestoArbitroEnRing_Ring` (`idRing`),
  CONSTRAINT `fk_puestoArbitroEnRing_Arbitro` FOREIGN KEY (`nroPlacaArbitro`) REFERENCES `Arbitro` (`nroPlacaArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_puestoArbitroEnRing_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `puestoArbitroEnRing` WRITE;
/*!40000 ALTER TABLE `puestoArbitroEnRing` DISABLE KEYS */;

INSERT INTO `puestoArbitroEnRing` (`nroPlacaArbitro`, `idRing`, `puestoArbitroEnRing`)
VALUES
	(1,1,'JEFE'),
	(1,2,'JEFE'),
	(2,1,'SUBSTITUTO'),
	(2,2,'SUBSTITUTO');

/*!40000 ALTER TABLE `puestoArbitroEnRing` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Ring
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Ring`;

CREATE TABLE `Ring` (
  `idRing` int(11) NOT NULL,
  PRIMARY KEY (`idRing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Ring` WRITE;
/*!40000 ALTER TABLE `Ring` DISABLE KEYS */;

INSERT INTO `Ring` (`idRing`)
VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8);

/*!40000 ALTER TABLE `Ring` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ringsDeCompetencias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ringsDeCompetencias`;

CREATE TABLE `ringsDeCompetencias` (
  `idRing` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  PRIMARY KEY (`idRing`,`idCompetencia`),
  KEY `fk_ringsDeCompetencias_Competencia_idx` (`idCompetencia`),
  CONSTRAINT `fk_ringsDeCompetencias_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ringsDeCompetencias_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ringsDeCompetencias` WRITE;
/*!40000 ALTER TABLE `ringsDeCompetencias` DISABLE KEYS */;

INSERT INTO `ringsDeCompetencias` (`idRing`, `idCompetencia`)
VALUES
	(2,2);

/*!40000 ALTER TABLE `ringsDeCompetencias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table senseiInscribeAlumno
# ------------------------------------------------------------

DROP TABLE IF EXISTS `senseiInscribeAlumno`;

CREATE TABLE `senseiInscribeAlumno` (
  `dniCompetidor` int(11) NOT NULL,
  `dniAlumno` int(11) NOT NULL DEFAULT '0',
  `nroPlacaInstructor` int(11) NOT NULL,
  PRIMARY KEY (`dniCompetidor`,`dniAlumno`),
  KEY `fk_senseiInscribeAlumno_Competidor_idx` (`dniCompetidor`),
  KEY `fk_senseiInscribeAlumno_Alumno_idx` (`dniAlumno`),
  KEY `fk_senseiInscribeAlumno_Maestro_idx` (`nroPlacaInstructor`),
  CONSTRAINT `fk_senseiInscribeAlumno_Alumno` FOREIGN KEY (`dniAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_senseiInscribeAlumno_Competidor` FOREIGN KEY (`dniCompetidor`) REFERENCES `Competidor` (`dniCompetidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_senseiInscribeAlumno_Maestro` FOREIGN KEY (`nroPlacaInstructor`) REFERENCES `Maestro` (`nroPaclaInstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
