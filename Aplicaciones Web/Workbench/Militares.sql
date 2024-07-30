-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cuartel2024
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cuartel2024
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cuartel2024` DEFAULT CHARACTER SET utf8 ;
USE `Cuartel2024` ;

-- -----------------------------------------------------
-- Table `Cuartel2024`.`Cuerpos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`Cuerpos` (
  `idCuerpos` INT NOT NULL AUTO_INCREMENT,
  `denominacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCuerpos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cuartel2024`.`cuarteles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`cuarteles` (
  `idcuarteles` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `ubicacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcuarteles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cuartel2024`.`compañia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`compañia` (
  `idcompañia` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `actividad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcompañia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cuartel2024`.`Soldado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`Soldado` (
  `idSoldado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `grado` VARCHAR(45) NOT NULL,
  `Cuerpos_idCuerpos` INT NOT NULL,
  `cuarteles_idcuarteles` INT NOT NULL,
  `compañia_idcompañia` INT NOT NULL,
  PRIMARY KEY (`idSoldado`),
  INDEX `fk_Soldado_Cuerpos_idx` (`Cuerpos_idCuerpos` ASC) VISIBLE,
  INDEX `fk_Soldado_cuarteles1_idx` (`cuarteles_idcuarteles` ASC) VISIBLE,
  INDEX `fk_Soldado_compañia1_idx` (`compañia_idcompañia` ASC) VISIBLE,
  CONSTRAINT `fk_Soldado_Cuerpos`
    FOREIGN KEY (`Cuerpos_idCuerpos`)
    REFERENCES `Cuartel2024`.`Cuerpos` (`idCuerpos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Soldado_cuarteles1`
    FOREIGN KEY (`cuarteles_idcuarteles`)
    REFERENCES `Cuartel2024`.`cuarteles` (`idcuarteles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Soldado_compañia1`
    FOREIGN KEY (`compañia_idcompañia`)
    REFERENCES `Cuartel2024`.`compañia` (`idcompañia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cuartel2024`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`servicios` (
  `idservicios` INT NOT NULL AUTO_INCREMENT,
  `actividad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idservicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cuartel2024`.`Soldado_has_servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cuartel2024`.`Soldado_has_servicios` (
  `Soldado_idSoldado` INT NOT NULL,
  `servicios_idservicios` INT NOT NULL,
  INDEX `fk_Soldado_has_servicios_servicios1_idx` (`servicios_idservicios` ASC) VISIBLE,
  INDEX `fk_Soldado_has_servicios_Soldado1_idx` (`Soldado_idSoldado` ASC) VISIBLE,
  CONSTRAINT `fk_Soldado_has_servicios_Soldado1`
    FOREIGN KEY (`Soldado_idSoldado`)
    REFERENCES `Cuartel2024`.`Soldado` (`idSoldado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Soldado_has_servicios_servicios1`
    FOREIGN KEY (`servicios_idservicios`)
    REFERENCES `Cuartel2024`.`servicios` (`idservicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into soldado (nombre,apellido,grado,Cuerpos_idCuerpos,cuarteles_idcuarteles,compañia_idcompañia) values 
(3,2);

delete from soldado where idsoldado =7;



INSERT INTO soldado (nombre, apellido, grado, Cuerpos_idCuerpos, cuarteles_idcuarteles, compañia_idcompañia)
SELECT '$nombre', '$apellido', '$rango', '$cuerpo', '$cuarteles', '$compania'
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM soldado
    WHERE nombre = '$nombre'
);

SELECT * FROM soldado;

UPDATE soldado SET nombre = 'Albertano', apellido = 'Mariano', grado = 'kamikaze', Cuerpos_idCuerpos = 3, cuarteles_idcuarteles = 3, compañia_idcompañia = 3 WHERE idSoldado = 5;




