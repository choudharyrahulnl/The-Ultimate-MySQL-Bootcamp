SELECT * FROM books;

# DISTINCT: GOES AFTER SELECT AND BEFORE COLUMN NAME
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT released_year FROM books;

# FIND DISTINCT AUTHOR
SELECT DISTINCT CONCAT(author_fname,' ',author_lname) AS author FROM books;

# FIND DISTINCT AUTHOR: DISTINCT ON AUTHOR_FNAME AND AUTHOR_LNAME
SELECT DISTINCT author_fname,author_lname AS author FROM books;

# SORT (ORDER BY): COMES AFTER SELECT STATEMENT
# By DEFAULT ORDER BY IS IN ASCENDING ORDER
SELECT author_fname,author_lname,released_year FROM books ORDER BY released_year;

# SELECT ... FROM TABLE ORDER BY COLUMN ASC;
SELECT author_fname,author_lname,released_year FROM books ORDER BY released_year ASC;

# SELECT ... FROM TABLE ORDER BY COLUMN DESC;
SELECT author_fname,author_lname,released_year FROM books ORDER BY released_year DESC;

# IF WE HAVE NULL THEN IT HAS LOWEST VALUE FOR ORDER BY

# ORDER BY USING COLUMN NUMBER FROM SELECT
SELECT author_fname,author_lname,released_year FROM books ORDER BY 3;
SELECT pages,author_fname,author_lname,released_year FROM books ORDER BY 1;
SELECT author_fname,author_lname,released_year,pages FROM books ORDER BY 4;

# ORDER BY MULTI COLUMN
# FIRST IT ORDER BY AUTHOR_LNAME THEN IF WE HAVE GROUP OF SAME AUTHOR_LNAME THEN ORDER BY RELEASED YEAR
# WILL ORDER BY ON THAT GROUP OF SAME AUTHOR AND ORDER BY RELEASED YEAR
# EX Eggers HAS RELEASED YEAR 2012,2013,2001 THEN SECOND ORDER BY RELEASED YEAR WILL GIVE
# Eggers 2001,2012,2013
SELECT author_lname,released_year,title FROM books;
SELECT author_lname,released_year,title FROM books ORDER BY author_lname;
SELECT author_lname,released_year,title FROM books ORDER BY author_lname, released_year;
SELECT author_lname,released_year,title FROM books ORDER BY author_lname, released_year,title;

# ORDER BY WORKS ON SELECT QUERY COLUMN EVEN IF ITS NOT A TABLE COLUMN
SELECT CONCAT(author_fname,' ',author_lname) AS author FROM books ORDER BY author;

# LIMIT
SELECT * FROM books LIMIT 5;

# GET LATEST BOOK
SELECT CONCAT(author_fname,' ',author_lname) AS author, title, released_year FROM books ORDER BY released_year DESC LIMIT 1;

# GET LATEST 3 BOOKS
SELECT CONCAT(author_fname,' ',author_lname) AS author, title, released_year FROM books ORDER BY released_year DESC LIMIT 3;

# GET SECOND LATEST BOOK : LIMIT INDEX(START FROM 0),HOW-MANY-ROWS
SELECT CONCAT(author_fname,' ',author_lname) AS author, title, released_year FROM books ORDER BY released_year DESC LIMIT 1,1;

# LIKE
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE 'da%';
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '%da';
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '%da%';

# NO OF UNDERSCORE = NO OF CHAR EX NAME WITH 4 CHAR
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '____';

# NAME WITH 5 CHAR
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '_____';

# ONE CHAR, a, ONE CHAR = Dan
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '_a_';

# NAME END WITH n = Don, John, Dan
SELECT title,author_fname,author_lname FROM books WHERE author_fname LIKE '%n';

# IF WE WANT TO SEARCH A STRING THAT CONTAINS % THEN WE NEED TO ESCAPE IT
# EX WHERE title LIKE '%\%%'
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';

# EXERCISE
SELECT title FROM books WHERE title LIKE '%stories%';
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
SELECT CONCAT(title,' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title,author_lname FROM books WHERE author_lname LIKE '% %'
SELECT title,released_year,stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title,author_lname FROM books ORDER BY author_lname,title;
SELECT CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname),'!') as yell FROM books ORDER BY author_lname;
