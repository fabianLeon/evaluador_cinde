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
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesor` (
  `pk_profesor` varchar(13) NOT NULL,
  `n_nombres` varchar(100) DEFAULT NULL,
  `n_apellido1` varchar(50) DEFAULT NULL,
  `n_apellido2` varchar(50) DEFAULT NULL,
  `n_correo` varchar(70) DEFAULT NULL,
  `p_contrasena` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('1010','PRUEBA','PRUEBA','PRUEBA','PRUEBA@PRUEBA.COM','PRUEBA'),('1018403543','Jaime Rafael','Vizcaino','Pulido','jrvizcainop@gmail.com','03543'),('17593352','Víctor Elicio','Espinosa','Galan','','93352'),('18002223','Diogenes Carvajal','Llamas','','diogenescarvajal@mac.com','02223'),('19101873','Alfonso Sánchez','Pilonieta','','asanchez@cinde.org.co','01873'),('19383025','Jorge Jairo','Posada','Escobar','jorge.jjpossada@gmail.com','83025'),('19437937','Alfonso Torres','Carrillo','','alfonsitorres@gmail.com','37937'),('20188667','Teresa León','Pereira','','telepereira@yahoo.com','88667'),('41652027','Patricia del Pilar','Briceño','Alvarado','pbriceno@cinde.org.co','52027'),('41705261','Elsa Castañeda','Bernal','','elsa.castaneda.b@gmail.com','05261'),('41756362','Martha Cecilia','Lozano','Ardila','marthalo2001@gmail.com','56362'),('51747434','Disney Barragán','Cordero','','disneybarragan@gmail.com','47434'),('51769320','Blanca Yaneth','Gonzalez','Pinzón','','69320'),('51842066','Marcela Villegas','Patiño','','marcelavillegaspatino@gmail.com','42066'),('51999590','Alba Lucy','Guerrero','Díaz','baluguerrero@gmail.com','99590'),('52072281','Maria Alexandra','Arias','Reyes','','72281'),('52078293','Yolanda Gómez','Mendoza','','yogomen@yahoo.es','78293'),('52487515','Andrea Mireya','Jiménez','Pinzón','ajimenez@cinde.org.co','87515'),('52799344','Juanita Alfort','','','ispiratore11@gmail.com','99344'),('52851400','Violetta ','Vega','','tamiajvp@gmail.com','51400'),('53907148','Juanita Bernal','López','','jbernal@cinde.org.co','07148'),('53907369','Yazmin Andrea','Patiño','Castañeda','Yazmin Andrea Patiño','07369'),('79042919','Gabriel Antonio','Lara','Guzmán','gabolara@gmail.com','42919'),('79112307','Oscar José','Useche','Aldana','oscarusal@gmail.com','12307'),('79140325','Alejandro Álvarez','Gallego','','rizoma.alejandro@gmail.com','40325'),('7931195','Edgar Vesga','Villamizar','','edgar.vesga@gmail.com','31195'),('79442728','Jose Manuel','Gonzalez','Cruz','','42728'),('79635158','Jorge Eliécer','Martínez','Posada','jmartinezp2@gmail.com','35158'),('79658048','Luis Enrique','Quiroga','Sinchacá','auditoriovirtual@yahoo.com','58048'),('79779830','Juan Carlos','Garzón','Rodríguez','jgarzon@cinde.org.co','79830'),('79944688','Camilo Andrés','Diagama','Briceño','camilodiagama@gmail.com','44688'),('94371028','Daniel Eduardo','Cabezas','Murillo',NULL,'71028'),('98523926','Jaime Alberto','Rendón','Acevedo','rendon.jaime@gmail.com;jrendon@unisalle.edu.co','23926');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
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
