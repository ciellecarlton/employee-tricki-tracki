-- Drops the programming_db if it already exists --
DROP DATABASE IF EXISTS employee_tricki_tracki;

-- Created the DB "employee_tracker" (only works on local connections)
CREATE DATABASE employee_tricki_tracki;

-- Use the DB employee_tracker for all the rest of the script
USE employee_tricki_tracki;

-- Created the table "departments"
CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  PRIMARY KEY (id)
);


-- Created the table "role"
CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT,
  PRIMARY KEY (id)
);

-- Created the table "employees"
CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR (30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT NOT NULL,
  manager_id INT,
  PRIMARY KEY (id)
);


-- Inserted a set of records into the table
INSERT INTO department (name)
VALUES ("Marketing"), ("IT"), ("HR"), ("Compliance"), ("QA"), ("PR");

INSERT INTO role (title, salary, department_id)
VALUES ("President", "200000", "7"), ("Software Developer", "65000", "2"), ("Attorney", "55000", "3"), ("Attorney", "55000", "4"), ("Compliance Officer", "65000", "5"), ("Patient Outreach", "85000", "6"), ("BDR", "31000", "1");

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Jane", "Doe", "1","1"), ("Peter", "Alexander", "2", "1"), ("Sky", "Ash", "3", "1"), ("Fluffy", "Woof", "4", "3"), ("Cleo", "Patra", "5", "1"), ("Dima", "Bilan", "Patient Outreach", "6", "1"), ("Benson", "Cloud", "1", "1");

-- view all --
SELECT e.id, e.first_name, e.last_name, d.name AS department, r.title, r.salary, CONCAT_WS(" ", m.first_name, m.last_name) AS manager FROM employee e LEFT JOIN employee m ON m.id = e.manager_id INNER JOIN role r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.id ASC;

-- View all roles --
SELECT  r.id, r.title, r.salary, d.name as Department_Name FROM role AS r INNER JOIN department AS d ON r.department_id = d.id;

-- Find employees --
SELECT id, CONCAT_WS(' ', first_name, last_name) AS Employee_Name FROM employee

-- Update --
UPDATE employee SET role_id = 3 WHERE id = 8;
UPDATE employee SET ? WHERE ?;

-- Delete --
DELETE FROM department WHERE id = 13;