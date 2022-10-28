# DATA TYPES

# Numeric Type: INT, SMALLINT, TINYINT, MEDIUMINT, BIGINT, DECIMAL, NUMERIC, FLOAT, DOUBLE, BIT

# String Type: CHAR, VARCHAR, BINARY, VARBINARY, BLOB, TINYBLOB, MEDIUMBLOB, LONGBLOB, TEXT, TINYTEXT, MEDIUMTEXT, LONGTEXT, ENUM

# Date Type: DATE, DATETIME, TIMESTAMP


# MOST USED

# INT : Whole Number no decimal, Max value 22147483647 , its signed that means -22147483647

# VARCHAR: Variable length string, we need to give size like varchar(10) or varchar(100)

# CREATE TABLE
CREATE TABLE cats (
                      name VARCHAR(50),
                      breed VARCHAR(50),
                      age INT
);

# SHOW TABLES
SHOW TABLES;

# SHOW COLUMNS
SHOW COLUMNS FROM cats;

# DESC TABLE
DESC cats;

# DELETE TABLE
DROP TABLE cats;

