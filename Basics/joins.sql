/* JOINS */

/* 
	IMPORTANT

	AS is a alias keyword and it is optional. However, it is recommended to use it for making query easy to read and not get misunderstood.
    if alias is defined, it must be used, not the original name.
 */

SELECT emp.employee_id, name, salary, order_total FROM employees AS emp, orders AS ord
	WHERE emp.employee_id = ord.employee_id; 
/* Above query is a Cartesian Join.*/
    
/*
Types of Join:
    Inner Join / Join (simply) : Returns rows when there is match in both tables.
    Left Join / Left Outer Join	: Returns all rows from the left table, even if there are no matches in the right table (NULL is placed, if no match in the right table).
    Right Join / Right Outer Join : Returns all rows from the right table, even if there are no matches in the left table (NULL is placed, if no match in the left table).
    Full Join / Full Outer Join (In MySQL, Full Join is not supported, so we use Left Join UNION ALL Right Join) : combines the result of both left join and right join. Contains records from both tables, and fill in NULLs for missing matches on either side.
    Self Join : joins table to itself as if the tables were two tables.
    Cartesian Join / Cross Join : returns the Cartesian product of the sets of records from the two or more joined tables.
    
Category of joins:
    Inner Join
    Outer Join(Left, Right, Full)
    Self Join
    Cross Join or Cartesian Join
*/

/* Inner Join */
SELECT employees.employee_id, name, order_total, ordeR_date
	FROM employees
    INNER JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID;
    
/* Left Join */
SELECT employees.employee_id, name, order_total, order_date
	FROM employees
    LEFT JOIN orders
    ON employees.employee_id = orders.employee_id;
    
/* Right Join */
SELECT employees.employee_id, name, order_total, order_date
	FROM employees
    RIGHT JOIN orders
    ON employees.employee_id = orders.employee_id;

/* Full Join 
This is how full join is performed.
SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    FULL JOIN orders
    ON employees.employee_id = orders.EMPLOYEE_ID;
    
However, Full Join is not supported by MySQL. For implementing Full Join in MySQL, we can use UNION ALL clause. (Left Join UNION ALL Right Join)
*/

SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    LEFT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID
UNION ALL
SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    RIGHT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID; 
    
/* SELF Join */
SELECT a.employee_id,a.order_id as A_order, b.order_id as B_order, b.order_total
	FROM orders a, orders b
    WHERE a.order_total < b.order_total;
    
/* Cartesian Join */
Select employees.employee_id, name, order_date, order_total
	from employees, orders;
