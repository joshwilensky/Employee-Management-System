DROP DATABASE IF EXISTS employee_tracker_db;
CREATE DATABASE employee_tracker_db;
USE employee_tracker_db;
CREATE TABLE Departments (
  id INTEGER AUTO_INCREMENT NOT NULL,
  name VARCHAR (30),
  PRIMARY KEY (id)
);
CREATE TABLE Roles (
  id INTEGER AUTO_INCREMENT NOT NULL,
  title VARCHAR (30),
  salary DECIMAL (10, 2),
  department_id INTEGER,
  FOREIGN KEY (department_id) REFERENCES Departments (id),
  PRIMARY KEY (id)
);
CREATE TABLE Employees (
  id INTEGER AUTO_INCREMENT NOT NULL,
  first_name VARCHAR (30),
  last_name VARCHAR (30),
  role_id INTEGER (10),
  manager_id INTEGER,
  FOREIGN KEY (role_id) REFERENCES roles (id),
  FOREIGN KEY (manager_id) REFERENCES Manager (manager),
  PRIMARY KEY (id)
);