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
-- Dumping routines for database 'evaluador'
--
/*!50003 DROP FUNCTION IF EXISTS `new_concepto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_concepto`(concepto VARCHAR(100)) RETURNS varchar(100) CHARSET utf8
BEGIN
IF NOT EXISTS ( SELECT r.pk_descripcion FROM evaluador.respuesta r WHERE r.pk_descripcion like concepto) THEN
	INSERT INTO evaluador.respuesta(pk_descripcion, d_creacion, estado,tipo)
	VALUES (concepto,now(),'MUERTO','CONCEPTO');
else
	UPDATE evaluador.respuesta r 
	SET r.estado = 'VIVO'
	WHERE r.pk_descripcion like concepto; 
END IF;
RETURN concepto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_evaluacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_evaluacion`(estudiante VARCHAR(13), sesion INT) RETURNS varchar(13) CHARSET utf8
BEGIN
INSERT INTO evaluador.asistencia(fk_estudiante,sesion_pk_sesion) VALUES (estudiante,sesion);
#evaluacion docente
INSERT INTO evaluador.evaluacion_asistencia(fk_evaluacion, fk_estudiante, fk_sesion, estado) 
	VALUES (1, estudiante, sesion, 'PENDIENTE');

#evaluacion a las guias
INSERT INTO evaluador.evaluacion_asistencia(fk_evaluacion, fk_estudiante, fk_sesion, estado) 
	VALUES (2, estudiante, sesion, 'PENDIENTE');
    
RETURN 'ingreso_exito';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `new_evaluacion_auto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `new_evaluacion_auto`(estudiante VARCHAR(13), sesion INT) RETURNS int(2)
BEGIN

	DECLARE K_EVALUACION INT;

	DECLARE EVALUACIONES_CURSOR CURSOR FOR 
		SELECT e.pk_evaluacion FROM evaluador.evaluacion e 
		WHERE e.estado LIKE 'A' 
		ORDER BY e.pk_evaluacion;

	-- Declaración de un manejador de error tipo NOT FOUND
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET @hecho = TRUE;
	-- Apertura del cursor.

	INSERT INTO evaluador.asistencia(fk_estudiante,sesion_pk_sesion) VALUES (estudiante,sesion);

	-- Abrimos el cursor
	OPEN EVALUACIONES_CURSOR;


	loop1: LOOP
		-- Guardamos el pk_evaluacion en la variable k_evaluacion, para ser usada
		FETCH EVALUACIONES_CURSOR INTO K_EVALUACION;
		
		IF @hecho THEN
		LEAVE loop1;
		END IF;

		-- Asignación de las evaluaciones activas
		INSERT INTO evaluador.evaluacion_asistencia(fk_evaluacion, fk_estudiante, fk_sesion, estado) 
			VALUES (K_EVALUACION, estudiante, sesion, 'PENDIENTE');
		
	END LOOP loop1;
    close EVALUACIONES_CURSOR;
	RETURN K_EVALUACION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-01 23:02:11
