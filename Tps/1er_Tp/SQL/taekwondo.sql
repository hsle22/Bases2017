CREATE DATABASE  IF NOT EXISTS `TAEKWONDO` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TAEKWONDO`;
-- MySQL dump 10.13  Distrib 5.5.55, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: TAEKWONDO
-- ------------------------------------------------------
-- Server version	5.5.55-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Alumno`
--

DROP TABLE IF EXISTS `Alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Alumno` (
  `dniAlumno` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `idEscuela` int(11) NOT NULL,
  PRIMARY KEY (`dniAlumno`),
  KEY `fk_Alumno_Escuela_idx` (`idEscuela`),
  CONSTRAINT `fk_Alumno_Escuela` FOREIGN KEY (`idEscuela`) REFERENCES `Escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
INSERT INTO `Alumno` VALUES (1,'Lucho','Dzuk',1),(2,'Lean','Torres',1),(3,'Mati','Aria',1),(4,'Agus','Y',2),(5,'Sofi','Barr',2),(6,'Sousuke','Aizen',4),(7,'Gohan','Sayan',3),(8,'Trunks','Sayan',3),(9,'Lin','Lin',5),(10,'Jose','Aria',1),(11,'Pedro','Porto',1),(12,'Mario','Benitez',1),(13,'Karina','Foo',2),(14,'Pedro','Rivera',3),(15,'Orlando','Barron',3),(16,'Ian','Noble',3),(17,'noelia','mendoza',3),(18,'nabiki','otaku',4),(19,'Jorge','Lo',6),(20,'Mia','lo',6),(21,'Peter','lu',6),(22,'Marina','lo',6),(23,'Bere','ki',6),(24,'Teresa','ko',6),(25,'Carlos','loMejor',5),(26,'Daniel','no',5),(27,'Fabricio','no',5),(28,'Sergio','no',5),(29,'Pedro','tabarez',5);
/*!40000 ALTER TABLE `Alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Arbitro`
--

DROP TABLE IF EXISTS `Arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Arbitro`
--

LOCK TABLES `Arbitro` WRITE;
/*!40000 ALTER TABLE `Arbitro` DISABLE KEYS */;
INSERT INTO `Arbitro` VALUES (1,'Juan','Perea','1',1),(2,'Juan','Pereb','2',1),(3,'Juan','Perec','2',2),(4,'Juan','Pered','30',2),(5,'Juan','Peree','2',1);
/*!40000 ALTER TABLE `Arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coach`
--

DROP TABLE IF EXISTS `Coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coach` (
  `dniAlumno` int(11) NOT NULL,
  `nroITF` int(11) NOT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `graduacion` varchar(45) NOT NULL,
  PRIMARY KEY (`dniAlumno`),
  CONSTRAINT `fk_Coach_Alumno` FOREIGN KEY (`dniAlumno`) REFERENCES `Alumno` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coach`
--

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;
INSERT INTO `Coach` VALUES (3,1,NULL,'1'),(6,0,'','5'),(7,2,NULL,'3'),(8,0,'','5'),(13,3,'','5'),(17,4,'','3'),(18,7,'','5'),(20,5,'','5'),(24,6,'','5'),(25,5,'','5');
/*!40000 ALTER TABLE `Coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competencia`
--

DROP TABLE IF EXISTS `Competencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competencia` (
  `idCompetencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `idModalidad` int(11) NOT NULL,
  PRIMARY KEY (`idCompetencia`),
  KEY `fk_Competencia_Modalidad_idx` (`idModalidad`),
  CONSTRAINT `fk_Competencia_Modalidad` FOREIGN KEY (`idModalidad`) REFERENCES `Modalidad` (`idModalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competencia`
--

LOCK TABLES `Competencia` WRITE;
/*!40000 ALTER TABLE `Competencia` DISABLE KEYS */;
INSERT INTO `Competencia` VALUES (1,'saltarinesChicos',1),(2,'saltaronesChicos',2),(3,'bardoNenes',13),(4,'rotoChicas',11);
/*!40000 ALTER TABLE `Competencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competidor`
--

DROP TABLE IF EXISTS `Competidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competidor`
--

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;
INSERT INTO `Competidor` VALUES (1,1,'1991-10-12','M','1',75,'',1,1),(2,2,'1991-10-12','M','1',75,'',1,1),(3,3,'2000-10-12','M','1',55,'',NULL,NULL),(4,4,'1991-10-12','F','4',75,'',NULL,0),(5,5,'2000-10-12','F','4',55,'',NULL,NULL),(6,6,'1991-10-12','F','4',55,'',NULL,0),(7,8,'1985-10-14','M','3',70,'',1,3),(9,12,'1988-11-14','M','3',72,'',1,2),(10,5,'1985-10-15','M','3',72,'',1,1),(11,4,'1989-12-01','M','4',71,'',1,1),(12,5,'1988-04-05','M','2',58,'',1,1),(14,8,'1987-01-01','M','3',80,'',1,3),(15,9,'1985-01-15','M','3',75,'',1,3),(16,10,'1986-02-15','M','3',70,'',1,3),(17,7,'1985-10-15','M','3',70,'',1,3),(18,11,'1885-10-18','M','3',60,'',NULL,NULL),(19,17,'1987-05-08','M','3',70,'',1,4),(20,18,'1985-05-06','M','3',70,'',1,4),(21,19,'1980-01-05','M','3',70,'',1,4),(22,20,'1987-04-08','M','3',70,'',1,4),(23,21,'1985-08-07','M','3',70,'',1,4),(26,13,'1987-05-02','M','3',71,'',1,2),(27,14,'1988-04-01','M','3',70,'',1,2),(28,15,'1986-02-05','M','3',70,'',1,2),(29,16,'1985-02-03','M','3',70,'',1,2);
/*!40000 ALTER TABLE `Competidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipo`
--

DROP TABLE IF EXISTS `Equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idEquipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo`
--

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;
INSERT INTO `Equipo` VALUES (1,'AdultosTeam'),(2,'AdultosTeam2'),(3,'Adulto esc3'),(4,'adulto esc 6');
/*!40000 ALTER TABLE `Equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escuela`
--

DROP TABLE IF EXISTS `Escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuela`
--

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;
INSERT INTO `Escuela` VALUES (1,'Meli',1,1),(2,'Tired',3,2),(3,'Sayan',3,3),(4,'Rukia',1,4),(5,'Cute',2,5),(6,'Liceo 9',2,6);
/*!40000 ALTER TABLE `Escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maestro`
--

DROP TABLE IF EXISTS `Maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maestro` (
  `nroPaclaInstructor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `graduacion` varchar(10) NOT NULL,
  PRIMARY KEY (`nroPaclaInstructor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maestro`
--

LOCK TABLES `Maestro` WRITE;
/*!40000 ALTER TABLE `Maestro` DISABLE KEYS */;
INSERT INTO `Maestro` VALUES (1,'Martin','Stanca','1'),(2,'Ian','Sabarros','3'),(3,'Kaka','Roto','100'),(4,'Ichigo','Kurosaki','4'),(5,'Inoe','Orihime','2'),(6,'Miyashi','Sensei','6');
/*!40000 ALTER TABLE `Maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modalidad`
--

DROP TABLE IF EXISTS `Modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modalidad`
--

LOCK TABLES `Modalidad` WRITE;
/*!40000 ALTER TABLE `Modalidad` DISABLE KEYS */;
INSERT INTO `Modalidad` VALUES (1,'Combate',14,17,0,0,1,'M'),(2,'Salto',18,35,NULL,NULL,1,'M'),(3,'Salto',14,17,NULL,NULL,1,'F'),(4,'Salto',18,35,NULL,NULL,1,'F'),(5,'Combate',14,17,50,60,1,'M'),(6,'Combate',18,35,70,80,1,'M'),(7,'Combate',14,17,50,60,1,'F'),(8,'Combate',18,35,70,80,1,'F'),(9,'Rotura',NULL,NULL,NULL,NULL,1,'M'),(10,'Rotura',NULL,NULL,NULL,NULL,1,'M'),(11,'Rotura',NULL,NULL,NULL,NULL,1,'F'),(12,'Rotura',NULL,NULL,NULL,NULL,1,'F'),(13,'CombateEquipos',NULL,NULL,NULL,NULL,NULL,'M'),(14,'CombateEquipos',NULL,NULL,NULL,NULL,NULL,'F'),(15,'Formas',14,17,NULL,NULL,1,'M'),(16,'Formas',18,35,NULL,NULL,1,'M'),(17,'Formas',14,17,NULL,NULL,1,'F'),(18,'Formas',18,35,NULL,NULL,1,'F'),(19,'Formas',14,17,NULL,NULL,4,'M'),(20,'Formas',18,35,NULL,NULL,4,'M'),(21,'Formas',14,17,NULL,NULL,4,'F'),(22,'Formas',18,35,NULL,NULL,4,'F');
/*!40000 ALTER TABLE `Modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pais`
--

DROP TABLE IF EXISTS `Pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pais` (
  `idPais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
INSERT INTO `Pais` VALUES (1,'Argentina'),(2,'Peru'),(3,'Brasil');
/*!40000 ALTER TABLE `Pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ring`
--

DROP TABLE IF EXISTS `Ring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ring` (
  `idRing` int(11) NOT NULL,
  PRIMARY KEY (`idRing`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ring`
--

LOCK TABLES `Ring` WRITE;
/*!40000 ALTER TABLE `Ring` DISABLE KEYS */;
INSERT INTO `Ring` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `Ring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arbitrosEnCompetencias`
--

DROP TABLE IF EXISTS `arbitrosEnCompetencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arbitrosEnCompetencias` (
  `nroPlacaArbitro` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  PRIMARY KEY (`nroPlacaArbitro`,`idCompetencia`),
  KEY `fk_arbitrosEnCompetencias_Competencia_idx` (`idCompetencia`),
  CONSTRAINT `fk_arbitrosEnCompetencias_Arbitro` FOREIGN KEY (`nroPlacaArbitro`) REFERENCES `Arbitro` (`nroPlacaArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_arbitrosEnCompetencias_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitrosEnCompetencias`
--

LOCK TABLES `arbitrosEnCompetencias` WRITE;
/*!40000 ALTER TABLE `arbitrosEnCompetencias` DISABLE KEYS */;
INSERT INTO `arbitrosEnCompetencias` VALUES (1,1),(2,1),(1,2),(2,2),(3,3),(4,3),(3,4),(4,4);
/*!40000 ALTER TABLE `arbitrosEnCompetencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compiteEnCompetenciaInd`
--

DROP TABLE IF EXISTS `compiteEnCompetenciaInd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compiteEnCompetenciaInd`
--

LOCK TABLES `compiteEnCompetenciaInd` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaInd` DISABLE KEYS */;
INSERT INTO `compiteEnCompetenciaInd` VALUES (1,2,3,1),(2,2,3,2),(4,1,13,1),(9,1,25,4),(10,2,3,3),(12,1,3,3),(19,1,20,2),(22,2,24,0);
/*!40000 ALTER TABLE `compiteEnCompetenciaInd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compiteEnCompetenciaTeam`
--

DROP TABLE IF EXISTS `compiteEnCompetenciaTeam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compiteEnCompetenciaTeam` (
  `idEquipo` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  `dniCoach` int(11) NOT NULL,
  `puestoTeam` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`,`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_Competencia_idx` (`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_coach_idx` (`dniCoach`),
  CONSTRAINT `fk_compiteEnCompetenciaTeam_coach` FOREIGN KEY (`dniCoach`) REFERENCES `Coach` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Equipo` FOREIGN KEY (`idEquipo`) REFERENCES `Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compiteEnCompetenciaTeam`
--

LOCK TABLES `compiteEnCompetenciaTeam` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaTeam` DISABLE KEYS */;
INSERT INTO `compiteEnCompetenciaTeam` VALUES (1,1,3,2),(1,2,3,1),(2,1,3,3),(2,2,25,3),(3,2,8,2),(4,2,24,NULL);
/*!40000 ALTER TABLE `compiteEnCompetenciaTeam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puestoArbitroEnRing`
--

DROP TABLE IF EXISTS `puestoArbitroEnRing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puestoArbitroEnRing` (
  `nroPlacaArbitro` int(11) NOT NULL,
  `idRing` int(11) NOT NULL,
  `puesto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nroPlacaArbitro`,`idRing`),
  KEY `fk_puestoArbitroEnRing_Ring` (`idRing`),
  CONSTRAINT `fk_puestoArbitroEnRing_Arbitro` FOREIGN KEY (`nroPlacaArbitro`) REFERENCES `Arbitro` (`nroPlacaArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_puestoArbitroEnRing_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestoArbitroEnRing`
--

LOCK TABLES `puestoArbitroEnRing` WRITE;
/*!40000 ALTER TABLE `puestoArbitroEnRing` DISABLE KEYS */;
INSERT INTO `puestoArbitroEnRing` VALUES (1,1,'JEFE'),(1,2,'JEFE'),(2,1,'SUBSTITUTO'),(2,2,'SUBSTITUTO');
/*!40000 ALTER TABLE `puestoArbitroEnRing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ringsDeCompetencias`
--

DROP TABLE IF EXISTS `ringsDeCompetencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ringsDeCompetencias` (
  `idRing` int(11) NOT NULL,
  `idCompetencia` int(11) NOT NULL,
  PRIMARY KEY (`idRing`,`idCompetencia`),
  KEY `fk_ringsDeCompetencias_Competencia_idx` (`idCompetencia`),
  CONSTRAINT `fk_ringsDeCompetencias_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ringsDeCompetencias_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringsDeCompetencias`
--

LOCK TABLES `ringsDeCompetencias` WRITE;
/*!40000 ALTER TABLE `ringsDeCompetencias` DISABLE KEYS */;
INSERT INTO `ringsDeCompetencias` VALUES (2,2);
/*!40000 ALTER TABLE `ringsDeCompetencias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-09  1:00:22
