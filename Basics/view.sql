/* VIEW */

/*
	VIEW is simply a SQL statement that is stored in the database with an associated name. A view is composition of a table in the form of a predefined SQL query.
    View provides the high level of abstraction by providing only relevant data to the user or can be said as Restricting access to data such that user can see and modify exactly what they need to, nothing else.
    
    To understand,
    As view is a stored SQL statement, it will provide the result based on the records on the table at the time of execution of the view statement. So, the view completely depends on the base table.
    Insertion, update and deletion in the view is ultimatley applied on the base table.
    
    For being able to perform update and insert in the view, some conditions must be satisfied. (Check PDF.)
		For inserting into the view, all the NOT NULL fields must be included in the view. However, the insertion is ultimately applied into the base table.
        
	WITH CHECK OPTION 
		This is a option which if included during the creation of the view will ensure that the defined conditions (during creation of view) must be satisfied in order to update or insert.
        if the condition is not satisfied, it will throw an error.
*/

CREATE VIEW EMPLOYEES_VIEW AS
	SELECT EMPLOYEE_ID, NAME, AGE
    FROM employees;
    
UPDATE employees_view
	set name="CURTIS" WHERE NAME = 'HELLO';
    
INSERT INTO EMPLOYEES_VIEW(NAME, AGE)
	VALUES('DARSH',19);
    
    


CREATE VIEW ORDERS_VIEW AS
	SELECT ORDER_ID, EMPLOYEE_ID
    FROM ORDERS;

UPDATE ORDERS_VIEW
	SET EMPLOYEE_ID = 6
    WHERE ORDER_ID = 2;
    
ALTER VIEW ORDERS_VIEW AS
	SELECT ORDER_ID, EMPLOYEE_ID, ORDER_DATE, ORDER_TOTAL 
    FROM ORDERS
    WHERE ORDER_TOTAL > 3000
    WITH CHECK OPTION;
    
INSERT INTO ORDERS_VIEW(EMPLOYEE_ID, ORDER_DATE,ORDER_TOTAL)
	VALUES(10, '2023-01-06', 3001);
    
DELETE FROM ORDERS_VIEW
	WHERE ORDER_TOTAL BETWEEN 3000 AND 3600;

SELECT * FROM ORDERS_VIEW;

DROP VIEW ORDERS_VIEW;