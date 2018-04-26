SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema okaimono_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema okaimono_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `okaimono_db` DEFAULT CHARACTER SET utf8 ;
USE `okaimono_db` ;

-- -----------------------------------------------------
-- Table `okaimono_db`.`db_schema`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `okaimono_db`.`db_schema` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `tag` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
