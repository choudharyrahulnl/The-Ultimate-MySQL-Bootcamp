# CRUD - CREATE READ UPDATE DELETE

# CREATE
CREATE TABLE cats (
                      cat_id INT AUTO_INCREMENT,
                      name VARCHAR(100),
                      breed VARCHAR(100),
                      age INT,
                      PRIMARY KEY (cat_id)
);
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);


# READ ALL COLUMN & ROWS
SELECT * FROM cats;

# READ ONLY AGE COLUMN
SELECT age FROM cats;

# READ NAME, AGE COLUMN
SELECT name,age FROM cats;

# READ AGE=4 USING WHERE CLAUSE
SELECT * FROM cats WHERE age=4;

# READ NAME, AGE FOR AGE=4 USING WHERE CLAUSE
SELECT name,age FROM cats WHERE age=4;

# READ NAME='EGG' USING WHERE CLAUSE
SELECT * FROM cats WHERE name='EGG';

# EXERCISE
SELECT cat_id FROM cats;
SELECT name,breed FROM cats;
SELECT name,age FROM cats WHERE breed='Tabby';
SELECT cat_id,age FROM cats WHERE cat_id=age;

# ALIAS
SELECT cat_id as id, name FROM cats;

# UPDATE
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
SELECT * FROM cats;

# UPDATE without WHERE Clause will update all the Rows
# UPDATE MULTIPLE COLUMN: UPDATE TABLE SET COLUMN=VALUE, COLUMN=VALUE WHERE COLUMN=VALUE
# THUMB RULE: CHECK YOUR WHERE CLAUSE BEFORE UPDATE

# EXERCISE
SELECT * FROM cats WHERE name='Ringo';
UPDATE cats SET breed='British Shorthair' WHERE name='Ringo';
SELECT * FROM cats WHERE name='Ringo';

SELECT * FROM cats WHERE breed='Maine Coon';
UPDATE cats SET age=12 WHERE breed='Maine Coon';
SELECT * FROM cats WHERE breed='Maine Coon';

SELECT * FROM cats WHERE name='Jackson';
UPDATE cats SET name='Jack' WHERE name='Jackson';
SELECT * FROM cats WHERE name='Jack';


# DELETE
SELECT * FROM cats WHERE name='Egg';
DELETE FROM cats WHERE name='Egg';
SELECT * FROM cats WHERE name='Egg';

# DELETE FROM CATS; WILL DELETE ALL ROWS "DON'T DO IT!"
# CHECK WHERE CLAUSE BEFORE DELETING SOMETHING

# EXERCISE
SELECT * FROM cats WHERE age=4;
DELETE FROM cats WHERE age=4;
SELECT * FROM cats WHERE age=4;

SELECT * FROM cats WHERE cat_id=age;
DELETE FROM cats WHERE cat_id=age;
SELECT * FROM cats WHERE cat_id=age;

DELETE FROM  cats;
SELECT * FROM cats;


# EXERCISES
CREATE DATABASE shirts_db;
USE shirts_db;

CREATE TABLE shirts (
                        shirt_id INT AUTO_INCREMENT PRIMARY KEY,
                        article VARCHAR(50),
                        color VARCHAR(50),
                        shirt_size VARCHAR(5),
                        last_worn INT
);
DESC shirts;
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt','purple', 'M', 50);

SELECT * FROM shirts;

# READ
SELECT article,color FROM shirts;
SELECT article,color,shirt_size,last_worn FROM shirts WHERE shirt_size='M';

# UPDATE
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
SELECT * FROM shirts WHERE article='polo shirt';

SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
SELECT * FROM shirts WHERE last_worn=15;

SELECT * FROM shirts WHERE color='white';
UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';
SELECT * FROM shirts WHERE color='white';

# DELETE
SELECT * FROM shirts WHERE last_worn >= 200;
DELETE FROM shirts WHERE last_worn >= 200;
SELECT * FROM shirts WHERE last_worn >= 200;

SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';
SELECT * FROM shirts WHERE article='tank top';







