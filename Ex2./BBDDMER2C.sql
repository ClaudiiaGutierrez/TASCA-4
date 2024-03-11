-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`ALUMNE` (
  `Expedient` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) CHARACTER SET 'armscii8' NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Data Naixament` INT(6) NOT NULL,
  PRIMARY KEY (`Expedient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`DEPARTAMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`DEPARTAMENT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`ASSIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`ASSIGNATURA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(10) NOT NULL,
  `Credits` VARCHAR(45) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `EsCapDepartament` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`MATRICULA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `Alumne` VARCHAR(45) NOT NULL,
  `Assignatura` VARCHAR(45) NOT NULL,
  `Nivell` VARCHAR(45) NOT NULL,
  `Curs` VARCHAR(45) NOT NULL,
  `ALUMNE_Expedient` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_MATRICULA_ALUMNE_idx` (`ALUMNE_Expedient` ASC) VISIBLE,
  CONSTRAINT `fk_MATRICULA_ALUMNE`
    FOREIGN KEY (`ALUMNE_Expedient`)
    REFERENCES `MER2C`.`ALUMNE` (`Expedient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`PROFESSOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`PROFESSOR` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NOT NULL,
  `Telefon` INT(9) NOT NULL,
  `Departament` VARCHAR(45) NOT NULL,
  `Titulacio` VARCHAR(45) NULL,
  `DEPARTAMENT_ID` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_PROFESSOR_DEPARTAMENT1_idx` (`DEPARTAMENT_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESSOR_DEPARTAMENT1`
    FOREIGN KEY (`DEPARTAMENT_ID`)
    REFERENCES `MER2C`.`DEPARTAMENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`ASSIGNATURAMATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`ASSIGNATURAMATRICULA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Aula` VARCHAR(45) NOT NULL,
  `Calendari` VARCHAR(45) NOT NULL,
  `MATRICULA_ID` INT NOT NULL,
  `PROFESSOR_NIF` INT NOT NULL,
  `ASSIGNATURA_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_ASSIGNATURAMATRICULA_MATRICULA1_idx` (`MATRICULA_ID` ASC) VISIBLE,
  INDEX `fk_ASSIGNATURAMATRICULA_PROFESSOR1_idx` (`PROFESSOR_NIF` ASC) VISIBLE,
  INDEX `fk_ASSIGNATURAMATRICULA_ASSIGNATURA1_idx` (`ASSIGNATURA_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ASSIGNATURAMATRICULA_MATRICULA1`
    FOREIGN KEY (`MATRICULA_ID`)
    REFERENCES `MER2C`.`MATRICULA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASSIGNATURAMATRICULA_PROFESSOR1`
    FOREIGN KEY (`PROFESSOR_NIF`)
    REFERENCES `MER2C`.`PROFESSOR` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ASSIGNATURAMATRICULA_ASSIGNATURA1`
    FOREIGN KEY (`ASSIGNATURA_ID`)
    REFERENCES `MER2C`.`ASSIGNATURA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
