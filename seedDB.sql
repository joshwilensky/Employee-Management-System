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
        salary DECIMAL),
        department_id INTEGER,

        PRIMARY KEY
        (id),

        FOREIGN KEY
        (department_id) REFERENCES department
        (id),
        );

        CREATE TABLE employees