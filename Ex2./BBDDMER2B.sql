-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`TARIFA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`TARIFA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(45) NULL,
  `Preu` INT(4) NULL,
  `Descripció` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`CINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`CINE` (
  `NIF` INT(9) NOT NULL,
  `NOM` VARCHAR(100) NULL,
  `Ubicació` VARCHAR(10) NULL,
  `Nª sales` VARCHAR(45) NULL,
  `Horari` INT(4) NULL,
  `Telefon` INT(9) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`PELIS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`PELIS` (
  `ISBN` INT(20) NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor secundari` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`PROJECCIÓ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`PROJECCIÓ` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Sala` TIME NULL,
  `Hora inici` TIME NULL,
  `Hora Fi` VARCHAR(45) NULL,
  `Pelicula_ISBN` VARCHAR(45) NULL,
  `CINE_NIF` INT(9) NULL,
  `PELIS_ISBN` INT(20) NULL,
  `TARIFA_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_PROJECCIÓ_CINE_idx` (`CINE_NIF` ASC) VISIBLE,
  INDEX `fk_PROJECCIÓ_PELIS1_idx` (`PELIS_ISBN` ASC) VISIBLE,
  INDEX `fk_PROJECCIÓ_TARIFA1_idx` (`TARIFA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PROJECCIÓ_CINE`
    FOREIGN KEY (`CINE_NIF`)
    REFERENCES `MER2B`.`CINE` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROJECCIÓ_PELIS1`
    FOREIGN KEY (`PELIS_ISBN`)
    REFERENCES `MER2B`.`PELIS` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROJECCIÓ_TARIFA1`
    FOREIGN KEY (`TARIFA_ID`)
    REFERENCES `MER2B`.`TARIFA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
