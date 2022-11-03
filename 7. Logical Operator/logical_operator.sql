# NOT EQUAL !=
SELECT title,released_year FROM books WHERE released_year = 2017;
SELECT title,released_year FROM books WHERE released_year != 2017;
SELECT title,author_lname FROM books WHERE author_lname != 'Gaiman';

# NOT LIKE
SELECT title FROM books WHERE title LIKE '% %';
SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT title,author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title,author_fname FROM books WHERE author_fname NOT LIKE 'da%';

# GREATER THAN >
SELECT title,released_year FROM books WHERE released_year > 2000;

# IF EXPRESSION IS TRUE SQL RETURN 1
SELECT 80 > 40;

# IF EXPRESSION IS FALSE SQL RETURN 0
SELECT 40 > 80;

# IF WE COMPARE WITH NULL WE GET NULL
SELECT 40 > NULL;

# LESS THAN <
SELECT title,released_year FROM books WHERE released_year < 2000;

# GREATER THAN EQUAL TO >=
SELECT title,released_year FROM books WHERE released_year >= 2010;

# LESS THAN EQUAL TO <=
SELECT title,released_year FROM books WHERE released_year <= 1985;

# LOGICAL AND (AND OR &&)
SELECT title,released_year,author_lname FROM books WHERE author_lname='Eggers' AND released_year > 2010;

# LOGICAL OR (OR OR ||)
SELECT title,released_year,author_lname FROM books WHERE author_lname='Eggers' OR released_year > 2010;

# BETWEEN EXPRESSION-1 AND EXPRESSION-2 : ITS INCLUSIVE OF BOTH EXPRESSION
SELECT title,released_year FROM books WHERE released_year >= 2004 AND released_year <= 2014;
SELECT title,released_year FROM books WHERE released_year BETWEEN 2004 AND 2014;

# NOT BETWEEN
SELECT title,released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2014 ORDER BY released_year;

# COMPARE DATES
SELECT * FROM people;

# SQL AUTOMATICALLY TRY TO CAST
SELECT * FROM people WHERE birthdate < '2005-01-01';
SELECT * FROM people WHERE birthtime < '12:00:00';
SELECT * FROM people WHERE birthtime BETWEEN '10:00:00' AND '12:00:00';

# RECOMMENDED
SELECT * FROM people WHERE YEAR(birthdate) < 2005;
SELECT * FROM people WHERE birthdate < CAST('2005-01-01' AS DATE);

SELECT * FROM people WHERE birthtime < CAST('12:00:00' AS TIME );
SELECT * FROM people WHERE HOUR(birthtime) < 12;

SELECT * FROM people WHERE birthtime BETWEEN CAST('10:00:00' AS TIME) AND CAST('12:00:00' AS TIME);

# IN
SELECT title,author_lname FROM books WHERE author_lname='Carver' OR author_lname='Lahiri' OR author_lname='Smith';
SELECT title,author_lname FROM books WHERE author_lname IN ('Carver','Lahiri','Smith');

# NOT IN
SELECT title,author_lname FROM books WHERE author_lname NOT IN ('Carver','Lahiri','Smith');
SELECT title,released_year FROM books WHERE released_year >= 2000 AND books.released_year %2 != 0;

# CASE
SELECT title,released_year, CASE WHEN released_year>= 2000 THEN 'modern lit' ELSE '20th century lit' END AS genre FROM books;

SELECT title,stock_quantity,
       CASE
           WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
           WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
           ELSE '***'
       END AS stock
FROM books;

SELECT title,stock_quantity,
       CASE
           WHEN stock_quantity <= 50 THEN '*'
           WHEN stock_quantity <= 100 THEN '**'
           ELSE '***'
           END AS stock
FROM books;

# IS NULL
SELECT * FROM books WHERE author_lname IS NULL;

# IS NOT NULL
SELECT * FROM books WHERE author_lname IS NOT NULL;

DELETE FROM books WHERE author_lname IS NULL;

# EXERCISE
SELECT 10 != 10;
SELECT 15 > 14 AND 99-5 <= 94;
SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10;
SELECT * FROM books WHERE released_year < 1980;
SELECT * FROM books WHERE author_lname IN ('Eggers','Chabon');
SELECT * FROM books WHERE author_lname='Lahiri' AND released_year > 2000;
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE author_lname LIKE 'C%' || author_lname LIKE 'S%';
SELECT title,author_lname,
       CASE
           WHEN title LIKE '%stories%' THEN 'Short Stories'
           WHEN title = 'Just Kids' THEN 'Memoir'
           WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memoir'
           ELSE 'Novel'
       END AS TYPE
FROM books;
SELECT author_fname,author_lname,
       CASE
           WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*), ' book')
           ELSE CONCAT(COUNT(*), ' books')
           END AS COUNT
FROM books GROUP BY author_lname, author_fname;

