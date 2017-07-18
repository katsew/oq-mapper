CREATE TABLE IF NOT EXISTS `dvd_collection`.`movies` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `release_date` DATE NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB