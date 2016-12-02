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
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `pk_descripcion` varchar(100) NOT NULL,
  `d_creacion` date DEFAULT NULL,
  `estado` enum('VIVO','MUERTO') DEFAULT 'VIVO',
  `tipo` enum('OPCION','CONCEPTO') DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
INSERT INTO `respuesta` VALUES ('adf','2016-08-19','MUERTO','CONCEPTO',NULL),('asdfadf','2016-08-19','MUERTO','CONCEPTO',NULL),('asdfaf','2016-08-19','MUERTO','CONCEPTO',NULL),('asdfasdf','2016-08-19','MUERTO','CONCEPTO',NULL),('Completamente de acuerdo',NULL,'VIVO','OPCION',1),('Concepto 2','2016-08-14','MUERTO','CONCEPTO',NULL),('concepto 3','2016-09-11','MUERTO','CONCEPTO',NULL),('concepto 5','2016-08-14','VIVO','CONCEPTO',NULL),('concepto1','2016-08-22','VIVO','CONCEPTO',NULL),('Concepto2','2016-08-14','VIVO','CONCEPTO',NULL),('De acuerdo',NULL,'VIVO','OPCION',2),('En desacuerdo',NULL,'VIVO','OPCION',4),('fghjmk,','2016-08-16','MUERTO','CONCEPTO',NULL),('ghjklñ','2016-08-16','MUERTO','CONCEPTO',NULL),('Grupo Focal',NULL,'VIVO','CONCEPTO',2),('GRUPO FOCAL INTERESANTE','2016-08-16','MUERTO','CONCEPTO',NULL),('Grupo Reflexivo',NULL,'VIVO','CONCEPTO',1),('Meller','2016-12-01','MUERTO','CONCEPTO',NULL),('Ni de acuerdo ni en desacuerdo',NULL,'VIVO','OPCION',3),('niñez','2016-08-22','MUERTO','CONCEPTO',NULL),('OPCION A','0000-00-00','VIVO','OPCION',1),('OPCION B','0000-00-00','VIVO','OPCION',2),('politica','2016-08-22','MUERTO','CONCEPTO',NULL),('prueba2','2016-08-14','VIVO','CONCEPTO',NULL),('respuesta abierta','2016-12-01','MUERTO','CONCEPTO',NULL),('sdfghjkl','2016-08-16','MUERTO','CONCEPTO',NULL);
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01 23:02:11
