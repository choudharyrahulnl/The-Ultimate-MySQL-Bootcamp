# WINDOW FUNCTIONS
# GROUP BY REDUCE THE SAME ROWS TO 1 ROW AND SHOW DATA FOR AGGREGATE FUNCTIONS
# WINDOWS FUNCTION DOESN'T REDUCE THE ROWS, IT SHOWS ALL ROWS WITH DATA FOR AGGREGATE FUNCTIONS

DROp DATABASE IF EXISTS windows_functions;
CREATE DATABASE windows_functions;
USE windows_functions;

CREATE TABLE employees (
                           emp_no INT PRIMARY KEY AUTO_INCREMENT,
                           department VARCHAR(20),
                           salary INT
);

INSERT INTO employees (department, salary) VALUES
                                               ('engineering', 80000),
                                               ('engineering', 69000),
                                               ('engineering', 70000),
                                               ('engineering', 103000),
                                               ('engineering', 67000),
                                               ('engineering', 89000),
                                               ('engineering', 91000),
                                               ('sales', 59000),
                                               ('sales', 70000),
                                               ('sales', 159000),
                                               ('sales', 72000),
                                               ('sales', 60000),
                                               ('sales', 61000),
                                               ('sales', 61000),
                                               ('customer service', 38000),
                                               ('customer service', 45000),
                                               ('customer service', 61000),
                                               ('customer service', 40000),
                                               ('customer service', 31000),
                                               ('customer service', 56000),
                                               ('customer service', 55000);


SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

SELECT
    emp_no,
    department,
    salary,
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;

# AGGREGATE FUNCTIONS WORK WITH GROUP BY OR ALONE
# THIS WONT WORK
SELECT
    emp_no, department, salary, MIN(salary), MAX(salary)
FROM
    employees;

# AGGREGATE FUNCTIONS WORK ALONE
SELECT
     MIN(salary), MAX(salary)
FROM
    employees;




