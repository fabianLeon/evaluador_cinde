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
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sesion` (
  `pk_sesion` int(11) NOT NULL AUTO_INCREMENT,
  `d_sesion` date NOT NULL,
  `q_encuentro` varchar(45) DEFAULT NULL,
  `fk_cohorte` varchar(10) NOT NULL,
  `fk_grupo` int(6) NOT NULL,
  `fk_profesor` varchar(13) NOT NULL,
  `ESTADO` enum('LISTA','PENDIENTE','EVALUADA') DEFAULT 'LISTA',
  PRIMARY KEY (`pk_sesion`),
  KEY `fk_sesion_cohorte_grupo1_idx` (`fk_cohorte`,`fk_grupo`,`fk_profesor`),
  CONSTRAINT `fk_sesion_cohorte_grupo1` FOREIGN KEY (`fk_cohorte`, `fk_grupo`, `fk_profesor`) REFERENCES `cohorte_grupo` (`fk_cohorte`, `fk_grupo`, `fk_profesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (2,'2016-01-01','1','3117-0',2,'1010','LISTA'),(87,'2016-10-14','4','38',7,'1018403543','LISTA'),(88,'2016-09-25','4','39',4,'52851400','PENDIENTE'),(89,'2016-10-14','4','40',6,'1018403543','LISTA'),(90,'2016-10-15','4','40',8,'98523926','LISTA'),(91,'2016-11-19','5','40',11,'19101873','LISTA'),(92,'2016-10-07','4','41',5,'20188667','LISTA'),(93,'2016-10-08','4','41',6,'94371028','LISTA'),(94,'2016-11-11','5','41',11,'19101873','LISTA'),(95,'2016-10-21','4','42',9,'53907369','LISTA'),(96,'2016-10-22','4','42',10,'53907369','LISTA'),(97,'2016-11-25','5','42',12,'53907148','LISTA'),(98,'2016-10-29','4','43',9,'53907369','LISTA'),(99,'2016-10-30','4','43',10,'53907369','LISTA'),(100,'2016-12-04','5','43',12,'19101873','LISTA'),(101,'2016-10-28','4','44',9,'53907369','LISTA'),(102,'2016-10-29','4','44',10,'53907369','LISTA'),(103,'2016-12-03','5','44',12,'53907148','LISTA');
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-27  4:46:33
