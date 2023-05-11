/*
	Sub Query (or Inner Query or Nested Query)
    
		It is query that is embedded within the WHERE clause.
        Sub queries can be used with INSERT, UPDATE, DELETE and SELECT statements along with operators like =, >, <,etc., IN, BETWEEN,etc.
        
        There are few rules that sub queries must follow: (Refer to the PDF for all of them.)
        Some are:
			- Must be enclosed within paranthesis.
            - A sub query must have only one column in the SELECT clause, unless multiple columns are in the main query for the sub query to compare its selected columns.
            - If sub query returns more than one row, then they can be used only with multiple value operators, like IN operator.
				Means >, <, =, these can be only only when sub query returns a single row. But if multiple rows are returned, they can not be used.
*/



UPDATE employees
	SET salary = salary * 1.5
    WHERE employee_id IN ( SELECT employee_id FROM orders
							WHERE order_total > 5000);

SELECT * FROM orders; 
                           
DELETE from orders
	WHERE employee_id = (SELECT employee_id from employees
							WHERE employee_id = 10);
