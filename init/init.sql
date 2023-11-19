-- Your SQL script goes here
-- ...

-- Create a database (if not exists)
CREATE DATABASE IF NOT EXISTS your_database_name;

-- Use the created database
USE your_database_name;

-- Create a table for users
CREATE TABLE IF NOT EXISTS users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL
);

-- Insert 40 million users with random date of birth (for the sake of example)
DELIMITER $$

CREATE PROCEDURE InsertRandomUsers()
BEGIN
DECLARE i INT DEFAULT 1;

WHILE i <= 40000000 DO
INSERT INTO users (username, date_of_birth)
VALUES (
CONCAT('user', i),
DATE_ADD('1970-01-01', INTERVAL FLOOR(RAND() * 365*100) DAY)
);

SET i = i + 1;
END WHILE;

END $$

DELIMITER ;

-- Call the procedure to insert users
CALL InsertRandomUsers();
