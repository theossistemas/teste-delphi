-- MySQL Workbench Synchronization
-- Generated: 2020-12-21 19:22
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Boaz

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `theos` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `theos`.`funcionario` (
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `salario` DECIMAL(12,2) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `theos`.`funcionario_dependente` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `funcionario_cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `iscalculair` TINYINT(4) NOT NULL DEFAULT 0,
  `iscalculainss` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_dependente_funcionario_idx` (`funcionario_cpf` ASC) VISIBLE,
  CONSTRAINT `fk_dependente_funcionario`
    FOREIGN KEY (`funcionario_cpf`)
    REFERENCES `theos`.`funcionario` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;