DROP DATABASE task_management;

-- Create database
CREATE DATABASE task_management;

-- Set up database user and permissions
DROP USER IF EXISTS 'appuser'@'localhost';

CREATE USER 'appuser'@'localhost' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON task_management.* TO 'appuser'@'localhost';

FLUSH PRIVILEGES;

USE task_management;

-- Create users table for storing user information
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL    -- no encryption needed
);

-- Create tasks table with references to users
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    priority VARCHAR(50) NOT NULL,
    task_date DATE NOT NULL,
    due_date DATE NOT NULL,
    content TEXT NOT NULL,
    memo TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert test user 
INSERT INTO users (username, password) VALUES ('testuser', 'password123'); 
-- To verify the insertion
SELECT * FROM users;