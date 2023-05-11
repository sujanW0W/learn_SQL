SELECT * FROM employees;
 
SELECT * FROM orders;


/*
	LIMIT and OFFSET
		LIMIT can be used to select the number of records to be displayed.
        OFFSET specifies the position from which the number of rows to be displayed is counted while filtering using LIMIT. Simply, the number of position to skip,
        
	Syntax:
		SELECT ...
			LIMIT [OFFSET], [NUMBER]
            
		If offset is not provided, its default value is 0.
*/

SELECT * FROM EMPLOYEES
LIMIT 2, 3; -- LIMIT 3 OFFSET 2. LEFT IS SHORTER SYNTAX OF THIS. 

Select (20 + 30) as Addition;

Select Count(*) as Records
	FROM employees
    where age < 18;
    
Select current_timestamp();

SELECT * FROM employees
	WHERE NAME LIKE 'SU%';
    
SELECT * FROM employees
	LIMIT 10;
    
SELECT * FROM employees
	ORDER BY AGE DESC, name;
/*
	When multiple columns are used, the results are sorted starting from the first column to the last.
	Basically, the table is sorted with respect to the first column that is provided. Then the resulted table is further ordered with respect to the second column provided and so on.
    This means, when the resulted table have similar value then these records with similar value are sorted with respect to the second or further fields.
 */
 
 SELECT AGE, SUM(SALARY) FROM employees
	GROUP BY AGE;
    
/* FETCHES ONLY DISTINCT RECORDS i.e. removes the duplicate records from the result. */
SELECT DISTINCT AGE FROM employees;


/* Group By */
SELECT employee_id, SUM(order_total) AS TOTAL FROM orders
	group by employee_id;

/* 
	HAVING clause will filter which group results appear in the final result.
    
    The WHERE clause places conditions for filtration on the selected columns, whereas the HAVING clause places conditions on groups created by the GROUP BY clause.
    
    Order of clauses:
		SELECT
        FROM
        WHERE
        GROUP BY
        HAVING 
        ORDER BY
*/

Select AGE, COUNT(EMPLOYEE_ID) AS POPULATION from employees
	GROUP BY AGE
    HAVING COUNT(AGE) >= 2;