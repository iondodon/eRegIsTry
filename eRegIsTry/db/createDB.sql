-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
                                              `id` INT NOT NULL AUTO_INCREMENT,
                                              `username` VARCHAR(45) NOT NULL,
                                              `password` VARCHAR(100) NOT NULL,
                                              `first_name` VARCHAR(45) NOT NULL,
                                              `last_name` VARCHAR(45) NOT NULL,
                                              `email` VARCHAR(100) NOT NULL,
                                              `active` TINYINT(1) NOT NULL,
                                              PRIMARY KEY (`id`),
                                              UNIQUE INDEX `username_UNIQUE` (`username` ASC))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`roles` (
                                              `id` INT NOT NULL AUTO_INCREMENT,
                                              `role` VARCHAR(45) NOT NULL,
                                              PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_roles` (
                                                    `id_user` INT NOT NULL,
                                                    `id_role` INT NOT NULL,
                                                    PRIMARY KEY (`id_user`, `id_role`),
                                                    INDEX `fk_users_roles_role_idx` (`id_role` ASC),
                                                    CONSTRAINT `fk_users_roles_user`
                                                        FOREIGN KEY (`id_user`)
                                                            REFERENCES `mydb`.`users` (`id`)
                                                            ON DELETE NO ACTION
                                                            ON UPDATE NO ACTION,
                                                    CONSTRAINT `fk_users_roles_role`
                                                        FOREIGN KEY (`id_role`)
                                                            REFERENCES `mydb`.`roles` (`id`)
                                                            ON DELETE NO ACTION
                                                            ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`administrators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`administrators` (
                                                       `id` INT NOT NULL AUTO_INCREMENT,
                                                       `department` VARCHAR(45) NULL,
                                                       `id_user` INT NOT NULL,
                                                       PRIMARY KEY (`id`),
                                                       UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC),
                                                       CONSTRAINT `fk_administrators_user`
                                                           FOREIGN KEY (`id_user`)
                                                               REFERENCES `mydb`.`users` (`id`)
                                                               ON DELETE NO ACTION
                                                               ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`subjects` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `subject` VARCHAR(45) NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE INDEX `subject_UNIQUE` (`subject` ASC))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teachers` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `id_base_subject` INT NULL,
                                                 `id_user` INT NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC),
                                                 INDEX `fk_teachers_subject_idx` (`id_base_subject` ASC),
                                                 CONSTRAINT `fk_teachers_user`
                                                     FOREIGN KEY (`id_user`)
                                                         REFERENCES `mydb`.`users` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION,
                                                 CONSTRAINT `fk_teachers_subject`
                                                     FOREIGN KEY (`id_base_subject`)
                                                         REFERENCES `mydb`.`subjects` (`id`)
                                                         ON DELETE SET NULL
                                                         ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`groups` (
                                               `id` INT NOT NULL AUTO_INCREMENT,
                                               `name` VARCHAR(45) NOT NULL,
                                               `id_master` INT NOT NULL,
                                               PRIMARY KEY (`id`),
                                               INDEX `fk_groups_master_idx` (`id_master` ASC),
                                               UNIQUE INDEX `name_UNIQUE` (`name` ASC),
                                               CONSTRAINT `fk_groups_master`
                                                   FOREIGN KEY (`id_master`)
                                                       REFERENCES `mydb`.`teachers` (`id`)
                                                       ON DELETE NO ACTION
                                                       ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`students` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `id_group` INT NOT NULL,
                                                 `id_user` INT NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 INDEX `fk_students_group_idx` (`id_group` ASC),
                                                 UNIQUE INDEX `id_user_UNIQUE` (`id_user` ASC),
                                                 CONSTRAINT `fk_students_group`
                                                     FOREIGN KEY (`id_group`)
                                                         REFERENCES `mydb`.`groups` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION,
                                                 CONSTRAINT `fk_students_user`
                                                     FOREIGN KEY (`id_user`)
                                                         REFERENCES `mydb`.`users` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`schedule` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `id_group` INT NOT NULL,
                                                 `id_subject` INT NOT NULL,
                                                 `day` VARCHAR(45) NOT NULL,
                                                 `time` TIME NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 INDEX `fk_schedule_group_idx` (`id_group` ASC),
                                                 INDEX `fk_schedule_subject_idx` (`id_subject` ASC),
                                                 CONSTRAINT `fk_schedule_group`
                                                     FOREIGN KEY (`id_group`)
                                                         REFERENCES `mydb`.`groups` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION,
                                                 CONSTRAINT `fk_schedule_subject`
                                                     FOREIGN KEY (`id_subject`)
                                                         REFERENCES `mydb`.`subjects` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lessons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lessons` (
                                                `id` INT NOT NULL AUTO_INCREMENT,
                                                `id_subject` INT NOT NULL,
                                                `id_teacher` INT NOT NULL,
                                                `datetime` DATETIME NOT NULL,
                                                `topic` VARCHAR(200) NULL,
                                                `homework` VARCHAR(200) NULL,
                                                PRIMARY KEY (`id`),
                                                INDEX `fk_lessons_subject_idx` (`id_subject` ASC),
                                                INDEX `fk_lessons_teacher_idx` (`id_teacher` ASC),
                                                CONSTRAINT `fk_lessons_subject`
                                                    FOREIGN KEY (`id_subject`)
                                                        REFERENCES `mydb`.`subjects` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION,
                                                CONSTRAINT `fk_lessons_teacher`
                                                    FOREIGN KEY (`id_teacher`)
                                                        REFERENCES `mydb`.`teachers` (`id`)
                                                        ON DELETE NO ACTION
                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registry` (
                                                 `id` INT NOT NULL AUTO_INCREMENT,
                                                 `id_lesson` INT NOT NULL,
                                                 `id_student` INT NOT NULL,
                                                 `mark` TINYINT NULL,
                                                 `absent` TINYINT(1) NOT NULL,
                                                 PRIMARY KEY (`id`),
                                                 INDEX `fk_registry_lesson_idx` (`id_lesson` ASC),
                                                 INDEX `fk_registry_student_idx` (`id_student` ASC),
                                                 CONSTRAINT `fk_registry_lesson`
                                                     FOREIGN KEY (`id_lesson`)
                                                         REFERENCES `mydb`.`lessons` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION,
                                                 CONSTRAINT `fk_registry_student`
                                                     FOREIGN KEY (`id_student`)
                                                         REFERENCES `mydb`.`students` (`id`)
                                                         ON DELETE NO ACTION
                                                         ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`password_reset_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`password_reset_token` (
                                                             `id` INT NOT NULL AUTO_INCREMENT,
                                                             `token` VARCHAR(200) NOT NULL,
                                                             `user_id` INT NOT NULL,
                                                             `expiryDate` DATE NOT NULL,
                                                             PRIMARY KEY (`id`),
                                                             INDEX `fk_pass_reset_token_user_idx` (`user_id` ASC),
                                                             UNIQUE INDEX `id_UNIQUE` (`id` ASC),
                                                             CONSTRAINT `fk_pass_reset_token_user`
                                                                 FOREIGN KEY (`user_id`)
                                                                     REFERENCES `mydb`.`users` (`id`)
                                                                     ON DELETE NO ACTION
                                                                     ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`activate_account_token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`activate_account_token` (
                                                               `id` INT NOT NULL AUTO_INCREMENT,
                                                               `token` VARCHAR(200) NOT NULL,
                                                               `user_id` INT NOT NULL,
                                                               `expiryDate` DATE NOT NULL,
                                                               PRIMARY KEY (`id`),
                                                               UNIQUE INDEX `id_UNIQUE` (`id` ASC),
                                                               INDEX `fk_activate_account_token_user_idx` (`user_id` ASC),
                                                               CONSTRAINT `fk_activate_account_token_user`
                                                                   FOREIGN KEY (`user_id`)
                                                                       REFERENCES `mydb`.`users` (`id`)
                                                                       ON DELETE NO ACTION
                                                                       ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
