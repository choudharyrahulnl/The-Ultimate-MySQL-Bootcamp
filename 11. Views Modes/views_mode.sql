# VIEW ARE QUERIES TO WHICH WE CAN GIVE NAME AND STORE WHICH WHEN INVOKE PRODUCE RESULT SET
# VIEWS ARE VIRTUAL TABLE SO WE CAN'T DELETE FROM VIEW

# WE WILL CREATE VIEW FOR THIS QUERY SO THAT LATER WE CAN USE THIS WITH JOINS
SELECT title,released_year,genre
       rating,
       CONCAT(first_name,' ',last_name) AS reviewer
FROM reviewers
         INNER JOIN reviews on reviewers.id = reviews.reviewer_id
         INNER JOIN series on reviews.series_id = series.id ORDER BY title;

# CREATE VIEW
CREATE VIEW full_reviews AS
    SELECT title,
           released_year,
           genre,
           rating,
            CONCAT(first_name,' ',last_name) AS reviewer
FROM reviewers
INNER JOIN reviews on reviewers.id = reviews.reviewer_id
INNER JOIN series on reviews.series_id = series.id ORDER BY title;

# SHOW VIEW
SHOW TABLES ;

# DROP VIEW
DROP VIEW full_reviews;

# USE VIEW
SELECT * FROM full_reviews WHERE genre = 'Animation';
SELECT genre,AVG(rating) AS avg_rating FROM full_reviews GROUP BY genre;

# WE CAN'T UPDATE VIEW IF IT CONTAINS AGGREGATE FUNCTIONS / DISTINCT / GROUP BY / HAVING / SUB QUERY IN SELECT ....
# ELSE WE CAN UPDATE THE VIEW LIKE WE UPDATE OUR TABLE

# UPDATING VIEW - INSERT / DELETE
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SHOW TABLES;
SELECT * FROM ordered_series;

INSERT INTO ordered_series (title, released_year, genre) VALUES ('The Great', 2022, 'Comedy');
SELECT * FROM ordered_series;
SELECT * FROM series;

DELETE FROM ordered_series WHERE title='The Great';
SELECT * FROM ordered_series;
SELECT * FROM series;

# UPDATE VIEW - CHANGE QUERY
# THIS WILL GIVE ERROR : VIEW ALREADY EXIST
CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

# CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;

SELECT * FROM ordered_series;

# ALTER VIEW
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;

SELECT * FROM ordered_series;




# GROUP BY WITH HAVING CLAUSE WHICH IS USED TO FILTER THE RESULT WE GET USING GROUP BY LIKE WHERE CLAUSE
SELECT title,AVG(rating) AS avg_rating FROM full_reviews
GROUP BY title HAVING title='Archer';

SELECT title,AVG(rating) AS avg_rating, COUNT(rating) as rating_count FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 3;


# SQL MODES
SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

# SET GLOBAL sql_moe = '' # WE CAN PASS THE MODES FROM ABOVE AND OMIT MODES WHICH WE DON'T WANT
# SET SESSION sql_moe = '' # THIS WILL DISABLE ALL MODE WHICH WE SEE ABOVE EX ERROR_FOR_DIVISION_BY_ZERO

# STRICT_TRANS_TABLES MODE IT VALIDATES THE INPUT LIKE YOU IF YOU GIVE INT FOR A VARCHAR
# ONLY_FULL_GROUP_BY IF WE GROUP BY title THEN WE CAN ONLY USE COLUMN title or AGGREGATE FUNCTIONS
# NO_ZERO_IN_DATE IT DON'T ALLOW ZERO IN DATE LIKE 2022-00-01 OR 2022-01-00


