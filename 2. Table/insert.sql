# INSERT INTO TABLE
INSERT INTO cats (name, breed, age)
    VALUE ('Blue', 'cat', 2);

# SELECT ALL FROM TABLE
SELECT * FROM cats;

# MULTI INSERT
INSERT INTO cats (name, breed, age)
VALUES ('Red', 'cat', 3),
       ('Yellow', 'cat', 4);
DROP TABLE cats;

# CREATE TABLE WITH NOT NULL
CREATE TABLE cats (
                      name VARCHAR(50) NOT NULL ,
                      breed VARCHAR(50) NOT NULL ,
                      age INT NOT NULL
);
DESC cats;
DROP TABLE cats;

# CREATE TABLE WITH NOT NULL & DEFAULT VALUE
CREATE TABLE cats (
                      name VARCHAR(50) NOT NULL DEFAULT 'unnamed',
                      breed VARCHAR(50) NOT NULL DEFAULT 'cat',
                      age INT NOT NULL DEFAULT 0
);
DESC cats;
INSERT INTO cats (name) VALUE ('Todd');
SELECT * FROM cats;
DROP TABLE cats;

# CREATE TABLE WITH PRIMARY KEY
CREATE TABLE cats (
                      id INT PRIMARY KEY ,
                      name VARCHAR(50) NOT NULL DEFAULT 'unnamed',
                      breed VARCHAR(50) NOT NULL DEFAULT 'cat',
                      age INT NOT NULL DEFAULT 0
);
DESC cats;
INSERT INTO cats (id) VALUE (1);
SELECT * FROM cats;
DROP TABLE cats;

# CREATE TABLE WITH PRIMARY KEY
CREATE TABLE cats (
                      id INT ,
                      name VARCHAR(50) NOT NULL DEFAULT 'unnamed',
                      breed VARCHAR(50) NOT NULL DEFAULT 'cat',
                      age INT NOT NULL DEFAULT 0,
                      PRIMARY KEY (id)
);
DESC cats;
INSERT INTO cats (id) VALUE (1);
SELECT * FROM cats;
DROP TABLE cats;

# CREATE TABLE WITH PRIMARY KEY & AUTOINCREMENT
CREATE TABLE cats (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(50) NOT NULL DEFAULT 'unnamed',
                      breed VARCHAR(50) NOT NULL DEFAULT 'cat',
                      age INT NOT NULL DEFAULT 0
);
DESC cats;
INSERT INTO cats () VALUE ();
SELECT * FROM cats;
DROP TABLE cats;
