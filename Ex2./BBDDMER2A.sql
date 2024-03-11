-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2A` ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `MER2A` ;

-- -----------------------------------------------------
-- Table `MER2A`.`Pacient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Pacient` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Telefon` INT(9) NULL,
  `Dir` VARCHAR(200) NULL,
  `Num_SS` INT(9) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2A`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Metge` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(50) NOT NULL,
  `Telefon` INT(9) NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Carrec` VARCHAR(45) NOT NULL,
  `Especialitat` VARCHAR(45) NOT NULL,
  `Num_colegiat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2A`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2A`.`Consulta` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Lloc` VARCHAR(45) NOT NULL,
  `Edifici` VARCHAR(45) NOT NULL,
  `Planta` VARCHAR(45) NOT NULL,
  `Data_Inici` DATE NOT NULL,
  `Data_fi` DATE NOT NULL,
  `Diagnostic` VARCHAR(200) NULL,
  `Pacient_ID` INT NOT NULL,
  `Metge_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Consulta_Pacient_idx` (`Pacient_ID` ASC) VISIBLE,
  INDEX `fk_Consulta_Metge1_idx` (`Metge_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Pacient`
    FOREIGN KEY (`Pacient_ID`)
    REFERENCES `MER2A`.`Pacient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_ID`)
    REFERENCES `MER2A`.`Metge` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
