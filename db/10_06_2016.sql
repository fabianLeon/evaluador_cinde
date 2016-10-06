-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema evaluador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema evaluador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `evaluador` DEFAULT CHARACTER SET utf8 ;
USE `evaluador` ;

-- -----------------------------------------------------
-- Table `evaluador`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`estudiante` (
  `pk_estudiante` VARCHAR(13) NOT NULL,
  `n_nombres` VARCHAR(100) NULL DEFAULT NULL,
  `n_apellido1` VARCHAR(50) NULL DEFAULT NULL,
  `n_apellido2` VARCHAR(50) NULL DEFAULT NULL,
  `n_correo` VARCHAR(200) NULL DEFAULT NULL,
  `p_contrasena` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_estudiante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`profesor` (
  `pk_profesor` VARCHAR(13) NOT NULL,
  `n_nombres` VARCHAR(100) NULL DEFAULT NULL,
  `n_apellido1` VARCHAR(50) NULL DEFAULT NULL,
  `n_apellido2` VARCHAR(50) NULL DEFAULT NULL,
  `n_correo` VARCHAR(70) NULL DEFAULT NULL,
  `p_contrasena` VARCHAR(20) NULL,
  PRIMARY KEY (`pk_profesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`postgrado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`postgrado` (
  `pk_postgrado` INT(5) NOT NULL,
  `n_postgrado` VARCHAR(100) NULL DEFAULT NULL,
  `n_descripcion` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`pk_postgrado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`cohorte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`cohorte` (
  `pk_cohorte` VARCHAR(10) NOT NULL,
  `n_cohorte` VARCHAR(45) NULL DEFAULT NULL,
  `fk_postgrado` INT(5) NOT NULL,
  PRIMARY KEY (`pk_cohorte`, `fk_postgrado`),
  INDEX `fk_cohorte_postgrado1_idx` (`fk_postgrado` ASC),
  CONSTRAINT `fk_cohorte_postgrado1`
    FOREIGN KEY (`fk_postgrado`)
    REFERENCES `evaluador`.`postgrado` (`pk_postgrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`tipo_grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`tipo_grupo` (
  `pk_tipo_grupo` INT(2) NOT NULL,
  `n_tipo_grupo` VARCHAR(100) NULL DEFAULT NULL,
  `n_descripcion_tipo` VARCHAR(120) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_tipo_grupo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`grupo` (
  `pk_grupo` INT(6) NOT NULL,
  `n_grupo` VARCHAR(200) NULL DEFAULT NULL,
  `q_nivel` INT(2) NULL DEFAULT NULL,
  `q_creditos` INT(1) NULL DEFAULT NULL,
  `fk_tipo_grupo` INT(2) NOT NULL,
  PRIMARY KEY (`pk_grupo`, `fk_tipo_grupo`),
  INDEX `fk_grupo_tipo_grupo1_idx` (`fk_tipo_grupo` ASC),
  CONSTRAINT `fk_grupo_tipo_grupo1`
    FOREIGN KEY (`fk_tipo_grupo`)
    REFERENCES `evaluador`.`tipo_grupo` (`pk_tipo_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`cohorte_grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`cohorte_grupo` (
  `fk_cohorte` VARCHAR(10) NOT NULL,
  `fk_grupo` INT(6) NOT NULL,
  `fk_profesor` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`fk_cohorte`, `fk_grupo`, `fk_profesor`),
  INDEX `fk_cohorte_has_grupo_grupo1_idx` (`fk_grupo` ASC),
  INDEX `fk_cohorte_has_grupo_cohorte_idx` (`fk_cohorte` ASC),
  INDEX `fk_cohorte_grupo_profesor1_idx` (`fk_profesor` ASC),
  CONSTRAINT `fk_cohorte_grupo_profesor1`
    FOREIGN KEY (`fk_profesor`)
    REFERENCES `evaluador`.`profesor` (`pk_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cohorte_has_grupo_cohorte`
    FOREIGN KEY (`fk_cohorte`)
    REFERENCES `evaluador`.`cohorte` (`pk_cohorte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cohorte_has_grupo_grupo1`
    FOREIGN KEY (`fk_grupo`)
    REFERENCES `evaluador`.`grupo` (`pk_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`sesion` (
  `pk_sesion` INT NOT NULL AUTO_INCREMENT,
  `d_sesion` DATE NOT NULL,
  `q_encuentro` VARCHAR(45) NULL DEFAULT NULL,
  `fk_cohorte` VARCHAR(10) NOT NULL,
  `fk_grupo` INT(6) NOT NULL,
  `fk_profesor` VARCHAR(13) NOT NULL,
  `ESTADO` ENUM('LISTA','PENDIENTE','EVALUADA') NULL DEFAULT 'LISTA',
  PRIMARY KEY (`pk_sesion`),
  INDEX `fk_sesion_cohorte_grupo1_idx` (`fk_cohorte` ASC, `fk_grupo` ASC, `fk_profesor` ASC),
  CONSTRAINT `fk_sesion_cohorte_grupo1`
    FOREIGN KEY (`fk_cohorte` , `fk_grupo` , `fk_profesor`)
    REFERENCES `evaluador`.`cohorte_grupo` (`fk_cohorte` , `fk_grupo` , `fk_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`asistencia` (
  `h_llegada` TIME NULL DEFAULT NULL,
  `h_salida` TIME NULL DEFAULT NULL,
  `fk_estudiante` VARCHAR(13) NOT NULL,
  `sesion_pk_sesion` INT NOT NULL,
  PRIMARY KEY (`fk_estudiante`, `sesion_pk_sesion`),
  INDEX `fk_asistencia_sesion1_idx` (`sesion_pk_sesion` ASC),
  CONSTRAINT `fk_asistencia_estudiante1`
    FOREIGN KEY (`fk_estudiante`)
    REFERENCES `evaluador`.`estudiante` (`pk_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asistencia_sesion1`
    FOREIGN KEY (`sesion_pk_sesion`)
    REFERENCES `evaluador`.`sesion` (`pk_sesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`respuesta` (
  `pk_descripcion` VARCHAR(100) NOT NULL,
  `d_creacion` DATE NULL DEFAULT NULL,
  `estado` ENUM('VIVO', 'MUERTO') NULL DEFAULT 'VIVO',
  `tipo` ENUM('OPCION', 'CONCEPTO') NULL,
  `orden` INT NULL,
  PRIMARY KEY (`pk_descripcion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`estado_estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`estado_estudiante` (
  `pk_estado` INT NOT NULL,
  `n_estado` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluador`.`estudiante_cohorte_grupo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`estudiante_cohorte_grupo` (
  `fk_estudiante` VARCHAR(13) NOT NULL,
  `fk_grupo_cohorte` VARCHAR(10) NOT NULL,
  `fk_grupo` INT(6) NOT NULL,
  `fk_profesor` VARCHAR(13) NOT NULL,
  `fk_estado` INT NOT NULL,
  PRIMARY KEY (`fk_estudiante`, `fk_grupo_cohorte`, `fk_grupo`, `fk_profesor`, `fk_estado`),
  INDEX `fk_estudiante_has_cohorte_grupo_cohorte_grupo1_idx` (`fk_grupo_cohorte` ASC, `fk_grupo` ASC, `fk_profesor` ASC),
  INDEX `fk_estudiante_has_cohorte_grupo_estudiante1_idx` (`fk_estudiante` ASC),
  INDEX `fk_estudiante_cohorte_grupo_estado_estudiante1_idx` (`fk_estado` ASC),
  CONSTRAINT `fk_estudiante_has_cohorte_grupo_cohorte_grupo1`
    FOREIGN KEY (`fk_grupo_cohorte` , `fk_grupo` , `fk_profesor`)
    REFERENCES `evaluador`.`cohorte_grupo` (`fk_cohorte` , `fk_grupo` , `fk_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_has_cohorte_grupo_estudiante1`
    FOREIGN KEY (`fk_estudiante`)
    REFERENCES `evaluador`.`estudiante` (`pk_estudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estudiante_cohorte_grupo_estado_estudiante1`
    FOREIGN KEY (`fk_estado`)
    REFERENCES `evaluador`.`estado_estudiante` (`pk_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`evaluacion` (
  `pk_evaluacion` INT(2) NOT NULL,
  `n_evaluacion` VARCHAR(200) NULL DEFAULT NULL,
  `ln_introduccion` VARCHAR(800) NULL DEFAULT NULL,
  `estado` ENUM('A','I') CHARACTER SET 'utf8' NULL DEFAULT 'A',
  PRIMARY KEY (`pk_evaluacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `evaluador`.`pregunta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`pregunta` (
  `pk_pregunta` INT(11) NOT NULL AUTO_INCREMENT,
  `n_enunciado` VARCHAR(1000) NULL DEFAULT NULL,
  `q_orden` INT(2) NULL DEFAULT NULL,
  `tipo` ENUM('A', 'C') NULL,
  PRIMARY KEY (`pk_pregunta`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`pregunta_evaluacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`pregunta_evaluacion` (
  `fk_pregunta` INT(11) NOT NULL,
  `fk_evaluacion` INT(11) NOT NULL,
  PRIMARY KEY (`fk_pregunta`, `fk_evaluacion`),
  INDEX `fk_pregunta_abierta_has_evaluacion_evaluacion1_idx` (`fk_evaluacion` ASC),
  INDEX `fk_pregunta_abierta_has_evaluacion_pregunta_abierta1_idx` (`fk_pregunta` ASC),
  CONSTRAINT `fk_pregunta_abierta_has_evaluacion_evaluacion1`
    FOREIGN KEY (`fk_evaluacion`)
    REFERENCES `evaluador`.`evaluacion` (`pk_evaluacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pregunta_abierta_has_evaluacion_pregunta_abierta1`
    FOREIGN KEY (`fk_pregunta`)
    REFERENCES `evaluador`.`pregunta` (`pk_pregunta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`tipo_profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`tipo_profesor` (
  `pk_tipo_profesor` INT(2) NOT NULL,
  `n_tipo` VARCHAR(45) NULL DEFAULT NULL,
  `n_descripcion_tipo` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_tipo_profesor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`evaluacion_asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`evaluacion_asistencia` (
  `fk_evaluacion` INT(2) NOT NULL,
  `fk_estudiante` VARCHAR(13) NOT NULL,
  `fk_sesion` INT NOT NULL,
  `estado` ENUM('PENDIENTE', 'OK') NULL,
  PRIMARY KEY (`fk_evaluacion`, `fk_estudiante`, `fk_sesion`),
  INDEX `fk_evaluacion_has_asistencia_asistencia1_idx` (`fk_estudiante` ASC, `fk_sesion` ASC),
  INDEX `fk_evaluacion_has_asistencia_evaluacion2_idx` (`fk_evaluacion` ASC),
  CONSTRAINT `fk_evaluacion_has_asistencia_asistencia1`
    FOREIGN KEY (`fk_estudiante` , `fk_sesion`)
    REFERENCES `evaluador`.`asistencia` (`fk_estudiante` , `sesion_pk_sesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_has_asistencia_evaluacion2`
    FOREIGN KEY (`fk_evaluacion`)
    REFERENCES `evaluador`.`evaluacion` (`pk_evaluacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`evaluacion_respuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`evaluacion_respuesta` (
  `fk_estudiante` VARCHAR(13) NOT NULL,
  `fk_sesion` INT NOT NULL,
  `fk_descripcion` VARCHAR(100) NOT NULL,
  `fk_pregunta` INT(11) NOT NULL,
  `fk_evaluacion` INT(11) NOT NULL,
  `v_respuesta` ENUM('LIKE', 'UNLIKE', 'SELECT', '') NULL,
  PRIMARY KEY (`fk_estudiante`, `fk_sesion`, `fk_descripcion`, `fk_pregunta`, `fk_evaluacion`),
  INDEX `fk_evaluacion_asistencia_has_respuesta_respuesta1_idx` (`fk_descripcion` ASC),
  INDEX `fk_evaluacion_asistencia_has_respuesta_evaluacion_asistenci_idx` (`fk_estudiante` ASC, `fk_sesion` ASC),
  INDEX `fk_evaluacion_respuesta_pregunta_evaluacion1_idx` (`fk_pregunta` ASC, `fk_evaluacion` ASC),
  CONSTRAINT `fk_evaluacion_asistencia_has_respuesta_evaluacion_asistencia1`
    FOREIGN KEY (`fk_estudiante` , `fk_sesion`)
    REFERENCES `evaluador`.`evaluacion_asistencia` (`fk_estudiante` , `fk_sesion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_asistencia_has_respuesta_respuesta1`
    FOREIGN KEY (`fk_descripcion`)
    REFERENCES `evaluador`.`respuesta` (`pk_descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_evaluacion_respuesta_pregunta_evaluacion1`
    FOREIGN KEY (`fk_pregunta` , `fk_evaluacion`)
    REFERENCES `evaluador`.`pregunta_evaluacion` (`fk_pregunta` , `fk_evaluacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `evaluador`.`administrativo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`administrativo` (
  `pk_administrativo` VARCHAR(13) NOT NULL,
  `n_nombres` VARCHAR(100) NULL,
  `n_apellido1` VARCHAR(50) NULL,
  `n_apellido2` VARCHAR(50) NULL,
  `n_correo` VARCHAR(70) NULL,
  `p_contrasena` VARCHAR(20) NULL,
  `cargo` VARCHAR(100) NULL,
  PRIMARY KEY (`pk_administrativo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `evaluador`.`tipo_profesor_profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `evaluador`.`tipo_profesor_profesor` (
  `fk_tipo_profesor` INT(2) NOT NULL,
  `fk_profesor` VARCHAR(13) CHARACTER SET 'big5' NOT NULL,
  PRIMARY KEY (`fk_tipo_profesor`, `fk_profesor`),
  INDEX `fk_tipo_profesor_has_profesor_profesor1_idx` (`fk_profesor` ASC),
  INDEX `fk_tipo_profesor_has_profesor_tipo_profesor1_idx` (`fk_tipo_profesor` ASC),
  CONSTRAINT `fk_tipo_profesor_has_profesor_tipo_profesor1`
    FOREIGN KEY (`fk_tipo_profesor`)
    REFERENCES `evaluador`.`tipo_profesor` (`pk_tipo_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_profesor_has_profesor_profesor1`
    FOREIGN KEY (`fk_profesor`)
    REFERENCES `evaluador`.`profesor` (`pk_profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `evaluador` ;

-- -----------------------------------------------------
-- function new_concepto
-- -----------------------------------------------------

DELIMITER $$
USE `evaluador`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function new_evaluacion
-- -----------------------------------------------------

DELIMITER $$
USE `evaluador`$$
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
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function new_evaluacion_auto
-- -----------------------------------------------------

DELIMITER $$
USE `evaluador`$$
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
	RETURN K_EVALUACION;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
