-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: evaluador
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `evaluacion_respuesta`
--

DROP TABLE IF EXISTS `evaluacion_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evaluacion_respuesta` (
  `fk_estudiante` varchar(13) NOT NULL,
  `fk_sesion` int(11) NOT NULL,
  `fk_descripcion` varchar(100) NOT NULL,
  `fk_pregunta` int(11) NOT NULL,
  `fk_evaluacion` int(11) NOT NULL,
  `v_respuesta` enum('LIKE','UNLIKE','SELECT','') DEFAULT NULL,
  PRIMARY KEY (`fk_estudiante`,`fk_sesion`,`fk_descripcion`,`fk_pregunta`,`fk_evaluacion`),
  KEY `fk_evaluacion_asistencia_has_respuesta_respuesta1_idx` (`fk_descripcion`),
  KEY `fk_evaluacion_asistencia_has_respuesta_evaluacion_asistenci_idx` (`fk_estudiante`,`fk_sesion`),
  KEY `fk_evaluacion_respuesta_pregunta_evaluacion1_idx` (`fk_pregunta`,`fk_evaluacion`),
  CONSTRAINT `fk_evaluacion_asistencia_has_respuesta_evaluacion_asistencia1` FOREIGN KEY (`fk_estudiante`, `fk_sesion`) REFERENCES `evaluacion_asistencia` (`fk_estudiante`, `fk_sesion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_asistencia_has_respuesta_respuesta1` FOREIGN KEY (`fk_descripcion`) REFERENCES `respuesta` (`pk_descripcion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_respuesta_pregunta_evaluacion1` FOREIGN KEY (`fk_pregunta`, `fk_evaluacion`) REFERENCES `pregunta_evaluacion` (`fk_pregunta`, `fk_evaluacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion_respuesta`
--

LOCK TABLES `evaluacion_respuesta` WRITE;
/*!40000 ALTER TABLE `evaluacion_respuesta` DISABLE KEYS */;
INSERT INTO `evaluacion_respuesta` VALUES ('10',2,'Completamente de acuerdo',2,1,NULL),('10 ',2,'De acuerdo',2,1,NULL),('10',2,'En desacuerdo',2,1,NULL),('10',2,'Grupo Reflexivo',1,1,NULL),('10',2,'Ni de acuerdo ni en desacuerdo',2,1,NULL),('2015188039',88,'Completamente de acuerdo',2,1,'SELECT'),('2015188039',88,'Grupo Reflexivo',1,1,'LIKE');
/*!40000 ALTER TABLE `evaluacion_respuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27  4:46:31
