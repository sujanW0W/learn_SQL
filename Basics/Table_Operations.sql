INSERT INTO employees(NAME,AGE,ADDRESS,SALARY)
	VALUES('chris', 35, 'sANTA Rosa', 15000);
    
UPDATE employees
	SET NAME = 'UnknowN', age = 18
    where address = 'chabahal';
    
Delete from employees
	where employee_id = 9;
    
INSERT INTO orders(EMPLOYEE_ID, ORDER_DATE, ORDER_TOTAL)
	VALUES(7,'2022-12-23',3500.00);