CREATE DATABASE  IF NOT EXISTS `TAEKWONDO` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `TAEKWONDO`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: TAEKWONDO
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
  `idAlumno` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `idEscuela` int(11) NOT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `fk_Alumno_Escuela_idx` (`idEscuela`),
  CONSTRAINT `fk_Alumno_Escuela` FOREIGN KEY (`idEscuela`) REFERENCES `Escuela` (`idEscuela`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumno`
--

LOCK TABLES `Alumno` WRITE;
/*!40000 ALTER TABLE `Alumno` DISABLE KEYS */;
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
  CONSTRAINT `fk_Coach_Alumno` FOREIGN KEY (`dniAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coach`
--

LOCK TABLES `Coach` WRITE;
/*!40000 ALTER TABLE `Coach` DISABLE KEYS */;
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
  `oro` int(11) DEFAULT NULL,
  `plata` int(11) DEFAULT NULL,
  `bronce` int(11) DEFAULT NULL,
  `idModalidad` int(11) NOT NULL,
  PRIMARY KEY (`idCompetencia`),
  KEY `fk_Competencia_Modalidad_idx` (`idModalidad`),
  CONSTRAINT `fk_Competencia_Modalidad` FOREIGN KEY (`idModalidad`) REFERENCES `Modalidad` (`idModalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competencia`
--

LOCK TABLES `Competencia` WRITE;
/*!40000 ALTER TABLE `Competencia` DISABLE KEYS */;
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
  `idEquipoTitular` int(11) DEFAULT NULL,
  `idEquipoSuplente` int(11) DEFAULT NULL,
  PRIMARY KEY (`dniCompetidor`),
  KEY `fk_Competidor_EqTitular_idx` (`idEquipoTitular`),
  KEY `fk_Competidor_EqSuplente_idx` (`idEquipoSuplente`),
  CONSTRAINT `fk_Competidor_EqTitular` FOREIGN KEY (`idEquipoTitular`) REFERENCES `Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Competidor_EqSuplente` FOREIGN KEY (`idEquipoSuplente`) REFERENCES `Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competidor`
--

LOCK TABLES `Competidor` WRITE;
/*!40000 ALTER TABLE `Competidor` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipo`
--

LOCK TABLES `Equipo` WRITE;
/*!40000 ALTER TABLE `Equipo` DISABLE KEYS */;
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
  CONSTRAINT `fk_Escuela_Pais` FOREIGN KEY (`idPais`) REFERENCES `Pais` (`idPais`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Escuela_Maestro` FOREIGN KEY (`nroPlacaInstructor`) REFERENCES `Maestro` (`nroPaclaInstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escuela`
--

LOCK TABLES `Escuela` WRITE;
/*!40000 ALTER TABLE `Escuela` DISABLE KEYS */;
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
  `edad` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `graduacion` varchar(10) NOT NULL,
  PRIMARY KEY (`idModalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modalidad`
--

LOCK TABLES `Modalidad` WRITE;
/*!40000 ALTER TABLE `Modalidad` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pais`
--

LOCK TABLES `Pais` WRITE;
/*!40000 ALTER TABLE `Pais` DISABLE KEYS */;
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
  `idCompetencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`nroPlacaArbitro`),
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
  PRIMARY KEY (`dniCompetidor`,`idCompetencia`),
  KEY `fk_compiteEnCompetenciaInd_competencia_idx` (`idCompetencia`),
  KEY `fk_compiteEnCompetenciaInd_coach_idx` (`dniCoach`),
  CONSTRAINT `fk_compiteEnCompetenciaInd_competidor` FOREIGN KEY (`dniCompetidor`) REFERENCES `Competidor` (`dniCompetidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaInd_competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaInd_coach` FOREIGN KEY (`dniCoach`) REFERENCES `Coach` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compiteEnCompetenciaInd`
--

LOCK TABLES `compiteEnCompetenciaInd` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaInd` DISABLE KEYS */;
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
  PRIMARY KEY (`idEquipo`,`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_Competencia_idx` (`idCompetencia`),
  KEY `fk_compiteEnCompetenciaTeam_coach_idx` (`dniCoach`),
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Equipo` FOREIGN KEY (`idEquipo`) REFERENCES `Equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compiteEnCompetenciaTeam_coach` FOREIGN KEY (`dniCoach`) REFERENCES `Coach` (`dniAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compiteEnCompetenciaTeam`
--

LOCK TABLES `compiteEnCompetenciaTeam` WRITE;
/*!40000 ALTER TABLE `compiteEnCompetenciaTeam` DISABLE KEYS */;
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
  `idRing` int(11) DEFAULT NULL,
  PRIMARY KEY (`nroPlacaArbitro`),
  KEY `fk_puestoArbitroEnRing_Ring_idx` (`idRing`),
  CONSTRAINT `fk_puestoArbitroEnRing_Arbitro` FOREIGN KEY (`nroPlacaArbitro`) REFERENCES `Arbitro` (`nroPlacaArbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_puestoArbitroEnRing_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puestoArbitroEnRing`
--

LOCK TABLES `puestoArbitroEnRing` WRITE;
/*!40000 ALTER TABLE `puestoArbitroEnRing` DISABLE KEYS */;
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
  CONSTRAINT `fk_ringsDeCompetencias_Ring` FOREIGN KEY (`idRing`) REFERENCES `Ring` (`idRing`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ringsDeCompetencias_Competencia` FOREIGN KEY (`idCompetencia`) REFERENCES `Competencia` (`idCompetencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ringsDeCompetencias`
--

LOCK TABLES `ringsDeCompetencias` WRITE;
/*!40000 ALTER TABLE `ringsDeCompetencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `ringsDeCompetencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `senseiInscribeAlumno`
--

DROP TABLE IF EXISTS `senseiInscribeAlumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `senseiInscribeAlumno` (
  `dniCompetidor` int(11) NOT NULL,
  `dniAlumno` int(11) NOT NULL DEFAULT '0',
  `nroPlacaInstructor` int(11) NOT NULL,
  PRIMARY KEY (`dniCompetidor`,`dniAlumno`),
  KEY `fk_senseiInscribeAlumno_Competidor_idx` (`dniCompetidor`),
  KEY `fk_senseiInscribeAlumno_Alumno_idx` (`dniAlumno`),
  KEY `fk_senseiInscribeAlumno_Maestro_idx` (`nroPlacaInstructor`),
  CONSTRAINT `fk_senseiInscribeAlumno_Competidor` FOREIGN KEY (`dniCompetidor`) REFERENCES `Competidor` (`dniCompetidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_senseiInscribeAlumno_Alumno` FOREIGN KEY (`dniAlumno`) REFERENCES `Alumno` (`idAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_senseiInscribeAlumno_Maestro` FOREIGN KEY (`nroPlacaInstructor`) REFERENCES `Maestro` (`nroPaclaInstructor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `senseiInscribeAlumno`
--

LOCK TABLES `senseiInscribeAlumno` WRITE;
/*!40000 ALTER TABLE `senseiInscribeAlumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `senseiInscribeAlumno` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 17:35:13
