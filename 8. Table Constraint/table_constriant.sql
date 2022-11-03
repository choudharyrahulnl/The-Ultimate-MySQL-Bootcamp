# NOT NULL & UNIQUE CONSTRAINT
CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL ,
    phone VARCHAR(15) NOT NULL UNIQUE
);
INSERT INTO contacts (name, phone) VALUES ('rahul', '12345678');
# NOT NULL ERROR :  Column 'name' cannot be null
INSERT INTO contacts (name, phone) VALUES (NULL, '12345678');
# DUPLICATE ERROR: Duplicate entry '12345678' for key 'contacts.phone'
INSERT INTO contacts (name, phone) VALUES ('choudhary', '12345678');
SELECT * FROM contacts;




# CHECK CONSTRAINT
CREATE TABLE users (
    name VARCHAR(50) NOT NULL,
    age INT CHECK ( age > 18 )
);
INSERT INTO users (name, age) VALUES ('rahul', 19);
# CHECK ERROR: Check constraint 'users_chk_1' is violated.
INSERT INTO users (name, age) VALUES ('rahul', 17);
SELECT * FROM users;



CREATE TABLE palindrome (
                       word VARCHAR(50) NOT NULL CHECK ( REVERSE(word) = word )
);
INSERT INTO palindrome (word) VALUES ('aba');
# Check constraint 'palindrome_chk_1' is violated.
INSERT INTO palindrome (word) VALUES ('abb');
SELECT * FROM palindrome;


# NAMED CONSTRAINT: CONSTRAINT CONSTRAINT-NAME CHECK||UNIQUE...
CREATE TABLE children (
                       name VARCHAR(50) NOT NULL,
                       age INT, CONSTRAINT age_over_18 CHECK ( age > 18 )
);
INSERT INTO children (name, age) VALUES ('rahul', 19);
# CHECK ERROR: Check constraint 'age_over_18' is violated.
INSERT INTO children (name, age) VALUES ('rahul', 17);
SELECT * FROM children;

# MULTI CONSTRAINT
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name,address)
);
INSERT INTO companies (name, address) VALUES ('a', 'a');
INSERT INTO companies (name, address) VALUES ('b', 'b');
INSERT INTO companies (name, address) VALUES ('a', 'b');
# Duplicate entry 'a-a' for key 'companies.name_address'
INSERT INTO companies (name, address) VALUES ('a', 'a');
SELECT * FROM companies;

# CONSTRAINT USING MULTI COLUMN
CREATE TABLE houses (
                           purchase_price INT NOT NULL,
                           sale_price INT NOT NULL,
                           CONSTRAINT sale_price_greater_then_purchase_price CHECK (sale_price >= houses.purchase_price)
);
INSERT INTO houses (purchase_price, sale_price) VALUES (100,200);
# Check constraint 'sale_price_greater_then_purchase_price' is violated.
INSERT INTO houses (purchase_price, sale_price) VALUES (300,250);
SELECT * FROM houses;

# ALTER TABLE : ADD COLUMN, DELETE COLUMN, RENAME COLUMN
ALTER TABLE companies ADD COLUMN city VARCHAR(25) DEFAULT 'Rotterdam';
SELECT * FROM companies;

# INT NOT NULL DEFAULT VALUE WILL BE 0, VARCHAR NOT NULL DEFAULT VALUE WILL BE '' EMPTY
ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL;
ALTER TABLE companies ADD COLUMN owner VARCHAR(25) NOT NULL ;
SELECT * FROM companies;

# DROP COLUMN
ALTER TABLE companies DROP COLUMN owner;
SELECT * FROM companies;

# RENAME TABLE
RENAME TABLE companies to companies_new;
SELECT * FROM companies_new;
RENAME TABLE companies_new to companies;

# RENAME COLUMN
ALTER TABLE companies RENAME COLUMN employee_count to employee;
SELECT * FROM companies;

# MODIFY COLUMN
ALTER TABLE companies MODIFY city VARCHAR(55) DEFAULT 'unknown';
DESC companies;
# OLD DATA STILL HAS CITY ROTTERDAM
SELECT * FROM companies;

INSERT INTO companies(name, address,employee) VALUES ('a','c',200);
# NEW ROWS WILL HAVE CITY UNKNOWN
SELECT * FROM companies;

# RENAME COLUMN WITH MODIFY COLUMN
ALTER TABLE companies CHANGE city comp_city VARCHAR(50);
DESC companies;
SELECT * FROM companies;

# ALTER CONSTRAINT
ALTER TABLE houses ADD CONSTRAINT positive_purchase_price CHECK ( purchase_price >= 0 );
#  Check constraint 'positive_purchase_price' is violated.
INSERT INTO houses (purchase_price, sale_price) VALUES (-4, 10);

# DROP CONSTRAINT
ALTER TABLE houses DROP CONSTRAINT positive_purchase_price;
INSERT INTO houses (purchase_price, sale_price) VALUES (-4, 10);
SELECT * FROM houses;

# EXERCISE
