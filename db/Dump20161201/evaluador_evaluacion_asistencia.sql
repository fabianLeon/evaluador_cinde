-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: 127.0.0.1    Database: evaluador
-- ------------------------------------------------------
-- Server version	5.5.50-MariaDB

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
-- Table structure for table `evaluacion_asistencia`
--

DROP TABLE IF EXISTS `evaluacion_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_asistencia` (
  `fk_evaluacion` int(2) NOT NULL,
  `fk_estudiante` varchar(13) NOT NULL,
  `fk_sesion` int(11) NOT NULL,
  `estado` enum('PENDIENTE','OK') DEFAULT NULL,
  PRIMARY KEY (`fk_evaluacion`,`fk_estudiante`,`fk_sesion`),
  KEY `fk_evaluacion_has_asistencia_asistencia1_idx` (`fk_estudiante`,`fk_sesion`),
  KEY `fk_evaluacion_has_asistencia_evaluacion2_idx` (`fk_evaluacion`),
  CONSTRAINT `fk_evaluacion_has_asistencia_asistencia1` FOREIGN KEY (`fk_estudiante`, `fk_sesion`) REFERENCES `asistencia` (`fk_estudiante`, `sesion_pk_sesion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_has_asistencia_evaluacion2` FOREIGN KEY (`fk_evaluacion`) REFERENCES `evaluacion` (`pk_evaluacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_asistencia`
--

LOCK TABLES `evaluacion_asistencia` WRITE;
/*!40000 ALTER TABLE `evaluacion_asistencia` DISABLE KEYS */;
INSERT INTO `evaluacion_asistencia` VALUES (1,'10',2,'PENDIENTE'),(1,'2015288013',103,'PENDIENTE'),(1,'2015288054',103,'OK'),(1,'2016188016',103,'PENDIENTE'),(1,'2016188034',103,'PENDIENTE'),(2,'2015288013',103,'PENDIENTE'),(2,'2015288054',103,'PENDIENTE'),(2,'2016188016',103,'PENDIENTE'),(2,'2016188034',103,'PENDIENTE');
/*!40000 ALTER TABLE `evaluacion_asistencia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01 23:02:10
