# ONE TO MANY RELATIONSHIPS

DROP DATABASE IF EXISTS shops;
CREATE DATABASE shops;
USE shops;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');


INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10', 99.99, 1),
       ('2017-11-11', 35.50, 1),
       ('2014-12-12', 800.67, 2),
       ('2015-01-03', 12.50, 2),
       ('1999-04-11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

# CROSS JOINS: ITS NOT USEFUL
SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = (SELECT id FROM customers WHERE last_name='George');

# CUSTOMERS HAS 6 ROWS & ORDERS HAS 5 ROWS : 6X5=30 ROWS WILL GET IN CROSS JOIN
SELECT * FROM customers,orders;

# INNER JOIN: SELECT ALL RECORDS FROM TABLE A AND TABLE B WHERE JOIN CONDITION IS MET
SELECT first_name,last_name,order_date,amount FROM customers
JOIN orders ON customers.id = orders.customer_id;

SELECT first_name,last_name,order_date,amount FROM orders
JOIN customers ON customers.id = orders.customer_id;

SELECT first_name,last_name,SUM(amount) AS total_amount FROM customers
JOIN orders ON customers.id = orders.customer_id GROUP BY first_name, last_name ORDER BY total_amount DESC;

# LEFT JOIN: SELECT EVERYTHING FROM LEFT TABLE A, ALONG WITH ANY MATCHING RECORDS IN B
SELECT first_name,last_name,order_date,amount FROM customers
LEFT JOIN orders on customers.id = orders.customer_id;

SELECT first_name,last_name,IFNULL(SUM(amount),0) as amount_spent FROM customers
LEFT JOIN orders on customers.id = orders.customer_id
GROUP BY first_name, last_name;

# RIGHT JOIN: SELECT EVERYTHING FROM RIGHT TABLE B, ALONG WITH ANY MATCHING RECORDS IN A
SELECT first_name,last_name,order_date,amount FROM customers
RIGHT JOIN orders on customers.id = orders.customer_id;

SELECT first_name,last_name,SUM(amount) AS amount FROM customers
RIGHT JOIN orders on customers.id = orders.customer_id
GROUP BY first_name, last_name;

# ON DELETE CASCADE: IF CUSTOMER IS DELETED THEN ITS ORDER SHOULD ALSO BE DELETED
DELETE FROM customers WHERE id=5;

# EXERCISE
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS papers;
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  first_name VARCHAR(50)
);
CREATE TABLE papers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE
);
INSERT INTO students (first_name) VALUES
                                      ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
                                                   (1, 'My First Book Report', 60),
                                                   (1, 'My Second Book Report', 75),
                                                   (2, 'Russian Lit Through The Ages', 94),
                                                   (2, 'De Montaigne and The Art of The Essay', 98),
                                                   (4, 'Borges and Magical Realism', 89);

SELECT * FROM students;
SELECT * FROM papers;

SELECT first_name,title,grade FROM students
INNER JOIN papers on students.id = papers.student_id ORDER BY grade DESC;

SELECT first_name,title,grade FROM students
LEFT JOIN papers on students.id = papers.student_id;

SELECT first_name,IFNULL(title,'MISSING') AS title,IFNULL(grade,0) AS grade FROM students
LEFT JOIN papers on students.id = papers.student_id;

SELECT first_name,IFNULL(AVG(grade), 0) AS grade FROM students
LEFT JOIN papers on students.id = papers.student_id
GROUP BY first_name ORDER BY grade DESC;

SELECT first_name,IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN 'passing'
        ELSE 'failing'
    END AS passing_status
FROM students
LEFT JOIN papers ON students.id = papers.student_id
GROUP BY first_name
ORDER BY average DESC;