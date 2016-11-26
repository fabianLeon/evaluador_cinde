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
-- Table structure for table `cohorte_grupo`
--

DROP TABLE IF EXISTS `cohorte_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohorte_grupo` (
  `fk_cohorte` varchar(10) DEFAULT NULL,
  `fk_grupo` int(6) DEFAULT NULL,
  `fk_profesor` varchar(13) DEFAULT NULL,
  `pk_cohorte_grupo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pk_cohorte_grupo`),
  KEY `fk_cohorte_has_grupo_grupo1_idx` (`fk_grupo`),
  KEY `fk_cohorte_has_grupo_cohorte_idx` (`fk_cohorte`),
  KEY `fk_cohorte_grupo_profesor1_idx` (`fk_profesor`),
  CONSTRAINT `fk_cohorte_grupo_1` FOREIGN KEY (`fk_cohorte`) REFERENCES `cohorte` (`pk_cohorte`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cohorte_grupo_2` FOREIGN KEY (`fk_grupo`) REFERENCES `grupo` (`pk_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cohorte_grupo_3` FOREIGN KEY (`fk_profesor`) REFERENCES `profesor` (`pk_profesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohorte_grupo`
--

LOCK TABLES `cohorte_grupo` WRITE;
/*!40000 ALTER TABLE `cohorte_grupo` DISABLE KEYS */;
INSERT INTO `cohorte_grupo` VALUES ('3117-0',2,'1010',1),('38',7,'1018403543',2),('39',4,'52851400',3),('40',6,'1018403543',4),('40',8,'98523926',5),('40',11,'19101873',6),('41',5,'20188667',7),('41',6,'94371028',8),('41',11,'19101873',9),('42',9,'53907369',10),('42',10,'53907369',11),('42',12,'53907148',12),('43',9,'53907369',13),('43',10,'53907369',14),('43',12,'19101873',15),('44',9,'53907369',16),('44',10,'53907369',17),('44',12,'53907148',18);
/*!40000 ALTER TABLE `cohorte_grupo` ENABLE KEYS */;
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
