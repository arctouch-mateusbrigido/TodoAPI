SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vapor_database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vapor_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `vapor_database` ;

-- -----------------------------------------------------
-- Table `vapor_database`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vapor_database`.`User` (
  `id` VARBINARY(16) NOT NULL,
  `firstName` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vapor_database`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vapor_database`.`Task` (
  `id` VARBINARY(16) NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  `dueDate` DATE NOT NULL,
  `completed` BINARY(1) NULL DEFAULT NULL,
  `user_id` VARBINARY(16),
  PRIMARY KEY (`id`),
  INDEX `task_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `task_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `vapor_database`.`User` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `vapor_database`.`Token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vapor_database`.`Token` (
  `id` VARBINARY(16) NOT NULL,
  `value` VARCHAR(100) NOT NULL,
  `user_id` VARBINARY(16) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `token_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `token_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `vapor_database`.`User` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Initial suggestions tasks load
-- -----------------------------------------------------
INSERT INTO Task (id, description, dueDate, completed, user_id) VALUES
(UUID_TO_BIN(UUID()), 'Do laundry', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Buy groceries', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Pay bills', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Clean the kitchen', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Vacuum the house', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Take out the trash', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Cook dinner', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Clean the bathroom', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Mow the lawn', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Organize closet', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go for a run', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write an email', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Schedule a meeting', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Call a friend', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Check email', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend an appointment', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Walk the dog', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Feed the pets', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Water the plants', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go to the gym', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Plan a trip', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a report', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Study for a test', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a class', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Complete a project', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Submit an application', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Update resume', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Apply for a job', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Research a topic', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Read a book', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Watch a movie', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Learn a new skill', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Start a hobby', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Create a budget', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Plan for retirement', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Pay off debt', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Invest money', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a networking event', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go on a date', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Plan a party', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Clean out the garage', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Organize a space', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Donate to charity', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Volunteer at a non-profit', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Cook a new recipe', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Try a new restaurant', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Create a vision board', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a journal entry', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Take a nap', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Meditate', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Practice yoga', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Get a massage', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a concert', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Plan a garden', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Decorate a room', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Paint a picture', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a poem', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Start a journal', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Create a workout routine', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Learn a new language', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Take a dance class', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Join a sports team', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a music festival', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Play a musical instrument', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Sing karaoke', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Practice mindfulness', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Spend time in nature', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go camping', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go hiking', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Travel to a new place', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a cultural event', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Visit a museum', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a play', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a sporting event', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go on a road trip', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Ride a bike', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Go for a walk', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a meditation retreat', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Get a haircut', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Get a manicure or pedicure', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Buy new clothes', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Update your wardrobe', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Start a side hustle', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Learn how to code', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Create a website', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a blog post', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Learn how to cook a new cuisine', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Take a photography class', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a wine tasting', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Read the news', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a book', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Publish an article', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Write a poem', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Create a podcast', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a cooking class', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Learn to bake', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Try a new wine', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Attend a book club', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Start a book club', '2023-05-01', 0, NULL),
(UUID_TO_BIN(UUID()), 'Start a support group', '2023-05-01', 0, NULL);

-- -----------------------------------------------------
-- Initial user load. The password is 123456789
-- -----------------------------------------------------
INSERT INTO vapor_database.`User`
(id, firstName, lastName, email, username, password)
VALUES(0xFA0D973921734328941E0813E7FA37A5, 'John', 'Doe', 'johndoe@gmail.com', 'john.doe', '$2b$12$iwAFioQThRdOelqUojcH6.GbuMfPgoqAAs6Is365SNS8zJ.8TrvkK');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;