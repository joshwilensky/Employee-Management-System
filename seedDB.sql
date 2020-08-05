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
    CREATE TABLE employees