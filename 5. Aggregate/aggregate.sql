# COUNT(*) MEANS COUNT THE ROWS
# COUNT DONT TAKE NULL IN ACCOUNT
SELECT COUNT(*) FROM books;
SELECT COUNT(author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT released_year) FROM books;

# COUNT NO OF ROWS FROM BOOKS WHERE ...
SELECT title FROM books WHERE title LIKE '%the%';
SELECT count(*) FROM books WHERE title LIKE '%the%';


# GROUP BY - AGGREGATE IDENTICAL DATA INTO SINGLE ROWS
SELECT title, author_lname FROM books;

# IN MEMORY IT CREATED GROUPS FOR AUTHOR_LNAME AND THEN WE CAN PERFORM ACTION ON IT LIKE COUNT
SELECT author_lname, count(*) AS books_written FROM books GROUP BY author_lname;
SELECT author_lname, count(*) AS books_written FROM books GROUP BY author_lname ORDER BY books_written DESC;

SELECT released_year, COUNT(*) AS books_released FROM books GROUP BY released_year ORDER BY books_released DESC;

# AGGREGATE DONT WORK WITH SELECT * FROM TABLE
# AGGREGATE WORKS ON SOME COLUMN: SELECT COLUMN FROM TABLE GROUP BY COLUMN
# AGGREGATE WORK WITH AGGREGATE FUNCTIONS: SELECT COLUMN,AGGREGATE-FUNCTION  FROM TABLE GROUP BY COLUMN
# EX: SELECT released_year, COUNT(*) AS books_released FROM books GROUP BY released_year;

# MIN & MAX WITHOUT GROUP BY
SELECT MIN(released_year) FROM books;
SELECT MAX(pages) FROM books;
SELECT MIN(pages), MAX(pages) FROM books;
SELECT MIN(author_lname), MAX(author_lname) FROM books;

# SUB QUERY: SUB QUERY RUNS FIRST
SELECT title,pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT title,pages FROM books WHERE pages = (SELECT MIN(pages) FROM books);

SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROm books);

# AGGREGATE FUNCTION WITH MULTI COLUMN
SELECT author_fname,author_lname, count(*) AS books_written
FROM books
GROUP BY author_lname,author_fname
ORDER BY books_written DESC;

SELECT CONCAT(author_fname,' ',author_lname) AS author, count(*) FROM books GROUP BY author;

# SUM
SELECT SUM(pages) FROM books;
SELECT author_fname,author_lname,COUNT(*) AS books_written,SUM(pages) FROM books GROUP BY author_lname,author_fname;

# AVG
SELECT AVG(pages) FROM books;
SELECT AVG(stock_quantity) FROM books;
SELECT released_year, AVG(stock_quantity) AS avg_stock, COUNT(*) AS books_released FROM books GROUP BY released_year;

# EXERCISE
SELECT COUNT(*) as books FROM books;
SELECT released_year, COUNT(*) as books_released FROM books group by released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT CONCAT(author_fname,' ',author_lname) AS author,AVG(released_year) as avg_released FROM books group by author;
SELECT CONCAT(author_fname,' ',author_lname) AS author,pages FROM books WHERE pages = (SELECT MAX(pages) FROM books);
SELECT CONCAT(author_fname,' ',author_lname) AS author,pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT released_year AS year,COUNT(*) AS books,AVG(pages) AS avg_pages FROM books GROUP BY released_year ORDER BY released_year;