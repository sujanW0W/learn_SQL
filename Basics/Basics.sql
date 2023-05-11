CREATE DATABASE learn_sql;

SHOW DATABASES;

USE learn_sql;

CREATE TABLE employees(
	ID INT NOT NULL,
    NAME VARCHAR(25) NOT NULL,
    AGE INT NOT NULL,
    ADDRESS VARCHAR(30),
    SALARY DECIMAL(10,2),
    PRIMARY KEY(ID)
);

ALTER TABLE employees
	add column orders int not null;
    
alter table employees
	add constraint fk_key foreign key(orders) references orders(order_id);
    
alter table employees
	drop constraint fk_key,
    drop key fk_key;
/* When the foreign key is created, the index is also created implicitly. So in order to remove the MUL key completely, we have to drop the index as well. */
    
describe employees;

ALTER TABLE employees
	RENAME COLUMN ID TO EMPLOYEE_ID;

CREATE TABLE department(
	ORDER_ID INT NOT NULL,
    EMPLOYEE_ID INT NOT NULL,
    ORDER_DATE DATETIME NOT NULL,
    ORDER_TOTAL DECIMAL(18,2),
    PRIMARY KEY(ORDER_ID),
    FOREIGN KEY(EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID)
);

ALTER TABLE department
	RENAME orders;
    
ALTER TABLE orders
	MODIFY ORDER_ID INT NOT NULL auto_increment;
    
describe orders;

/* Create table from existing table */
Create table workers AS
	SELECT ID, NAME, AGE
    FROM employees;
    
/* Drop the table */
Drop table workers;
    
/*To check all the information about a table */
Describe employees; 
/*DESC or DESCRIBE */
/*equivalent to command*/
SHOW columns from employees;

SHOW CREATE TABLE employees; /*Another way */
    
ALTER TABLE employees
	MODIFY SALARY DECIMAL(10,2) DEFAULT 5000.00;
    
ALTER TABLE employees
	ADD CONSTRAINT myUNIQUE UNIQUE(ADDRESS); /* MySQL supports ADD CONSTRAINT for UNIQUE, CHECK, PK, FK. */

ALTER TABLE employees
	ADD CONSTRAINT check_age CHECK(AGE >= 18);

ALTER TABLE employees
	DROP CONSTRAINT ageUnique;

ALTER TABLE employees
	RENAME TO STAFFS;


ALTER TABLE employees
	MODIFY ID INT auto_increment;

