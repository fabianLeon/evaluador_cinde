-- MySQL dump 10.13  Distrib 5.7.13, for linux-glibc2.5 (x86_64)
--
-- Host: localhost    Database: evaluador
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `pk_grupo` int(6) NOT NULL,
  `n_grupo` varchar(200) DEFAULT NULL,
  `q_nivel` int(2) DEFAULT NULL,
  `q_creditos` int(1) DEFAULT NULL,
  `fk_tipo_grupo` int(2) NOT NULL,
  PRIMARY KEY (`pk_grupo`,`fk_tipo_grupo`),
  KEY `fk_grupo_tipo_grupo1_idx` (`fk_tipo_grupo`),
  CONSTRAINT `fk_grupo_tipo_grupo1` FOREIGN KEY (`fk_tipo_grupo`) REFERENCES `tipo_grupo` (`pk_tipo_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (2,'PRUEBA',0,0,3),(4,'Enfoques y tendencias pedagógicas',4,NULL,1),(5,'Educación y desarrollo humano y social',3,NULL,1),(6,'Planeación de proyectos I',3,NULL,1),(7,'Desarrollo, seguimiento y evaluación de proyectos',4,NULL,1),(8,'Contexto local',3,NULL,1),(9,'Neurodesarrollo y  Desarrollo cognitivo',2,NULL,1),(10,'Educación inicial',2,NULL,1),(11,'Técnicas e instrumentos cuantitativos',3,NULL,1),(12,'Modelo causal y diseño cuasi-experimental ',2,NULL,1);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-26 11:45:36
