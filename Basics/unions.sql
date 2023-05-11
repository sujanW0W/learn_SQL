/* UNIONS */

/* 
	UNION: Union clause/operator combines the results of multiple SELECT statements without returning duplicate rows.
			To use UNION, each SELECT must have the same number of columns selected, the same number of column 
			expressions, the same data type, and have them in the same order, but they do not have to be the same length.
    
    UNION ALL: UNION ALL is similar to the UNION, but it contains duplicate rows too.
    
    Two other clauses: 
    Intersect: it combines two SELECT statements, but returns only those rows from the first SELECT that are identical to the rows in the second SELECT. 
				it means INTERSECT only returns common rows.
                
	EXCEPT: it combines two SELECT statements, but returns only those rows from the SELECT that are not returned by the second SELECT.alter
			it means EXCEPT only returns rows from first result that are not available in second result.
    
    All of these clauses, UNION, INTERSECT and EXCEPT can have succession of [ALL | DISTINCT].
    ALL will return duplicate rows too, while DISTINCT will not return duplicate rows. By DEFAULT (if not mentioned), it will be DISTINCT.
    
    Also, for all of these clauses, both SELECT must have same attributes, just like for UNION (written above in lines 5 & 6)
*/

SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    LEFT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID 
INTERSECT
SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    RIGHT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID;
    
    SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    LEFT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID 
EXCEPT 
SELECT employees.EMPLOYEE_ID, name, order_total, order_date
	FROM employees
    RIGHT JOIN orders
    ON employees.EMPLOYEE_ID = orders.EMPLOYEE_ID;
