DROP DATABASE IF EXISTS seed_db;
CREATE DATABASE seed_db;
USE seed_db;

CREATE TABLE departments
(
    id INTEGER
    AUTO_INCREMENT NOT NULL,
department VARCHAR
    (30),
PRIMARY KEY
    (id)
);

    CREATE TABLE roles
    (
        id INTEGER
        AUTO_INCREMENT NOT NULL,
title VARCHAR
        (30),
salary DECIMAL,
department_id INTEGER,
PRIMARY KEY
        (id),
FOREIGN KEY
        (department_id) REFERENCES department
        (id)
);

        CREATE TABLE employees
        (
            id INTEGER
            AUTO_INCREMENT NOT NULL, 
first_name VARCHAR
            (30) NOT NULL,
last_name VARCHAR
            (30) NOT NULL,
role_id INTEGER,
manager_id INTEGER,
PRIMARY KEY
            (id),
FOREIGN KEY
            (role_id) REFERENCES roles
            (id),
FOREIGN KEY
            (manager_id) REFERENCES employees
            (id)
);

            INSERT INTO departments
                (department)
            VALUES
                ("Initech");

            INSERT INTO roles
                (title, salary, department_id)
            VALUES
                ("Manager", "150000", 1),
                ("Salary", "25000", 1);

            INSERT INTO employees
                (first_name, last_name, role_id, manager_id)
            VALUES
                ("Bill", "Lumbergh ", 2, 1);
            INSERT INTO employees
                (first_name, last_name, role_id, manager_id)
            VALUES
                ("Peter", "Gibbons", 1);
            INSERT INTO employees
                (first_name, last_name, role_id, manager_id)
            VALUES
                ("Milton", "Waddams", 2, 1);
            INSERT INTO employees
                (first_name, last_name, role_id, manager_id)
            VALUES
                ("Samir", "Nagheenanajar ", 2, 1);
            INSERT INTO employees
                (first_name, last_name, role_id, manager_id)
            VALUES
                ("Michael", "Bolton", 2, 1);