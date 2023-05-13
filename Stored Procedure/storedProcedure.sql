/*
	Stored Procedure
		It is simply a procedure or function that is stored in the database server.
        Created using CREATE PROCEDURE keyword.
        Stored Procedure is invoked using CALL keyword.
        It can also have number of parameters, and we can pass required arguments while invoking the procedure.
        
        We want the stored procedure to be compiled as a single compound statement. Since, the delimiter used by SQL is ';', and procedure will have multiple SQL statements separated using ';' 
        we need to change the delimiter so that the procedure is compiled as a single statement. Finally, the delimiter has to be changed into the default(;).
        
		Delimiter is changed using keyword DELIMITER.
        
        
        Stored Procedure can be dropped using DROP PROCEDURE keyword.
        
        But, the stored procedure can NOT be altered or modified. 
        For altering, we have to drop the existing procedure and re-create it again.
*/

DELIMITER $$

CREATE PROCEDURE getAllEmployees()
BEGIN
	
    SELECT * FROM employees;
    
END $$

DELIMITER ;

CALL getAllEmployees();



DELIMITER $$

CREATE PROCEDURE getAdultEmployee()
BEGIN
	
    SELECT * FROM employees
		WHERE age > 20;
    
END $$

DELIMITER ;

CALL learn_sql.getAdultEmployee();

-- If drop procedure is tried for the non-existing procedure, it will result into error. But, if 'IF EXISTS' condition is included, it will check if the procedure exists. If it does, it will drop it else it will give warning rather than error.
DROP PROCEDURE IF EXISTS ABC;
SHOW WARNINGS; -- shows warnings.

DROP PROCEDURE IF EXISTS getAdultEmployee;


/*
	SHOW ALL THE PROCEDURES
		Syntax:
			SHOW PROCEDURE STATUS [ LIKE '%pattern%' | WHERE search_condition ]
*/

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS 
	WHERE db = 'learn_sql';
    
SHOW PROCEDURE STATUS
	LIKE '%get%';



/*
	The procedure can have parameters:
		3 types of parameters:
			- IN : Default mode. This is the parameter which receives the value from the calling program. The value of IN parameter is protected, means the original value of the IN parameter remains unchanged after the stored procedure ends. In other words, the stored procedure only works with the copy of the parameter.
            - OUT : The value of this parameter can get changed and the latest value is returned to the calling program. So, the calling program must define a variable into which the returned value is to be stored.
            - INOUT: This is combination of both IN and OUT parameters. It means, the calling program may pass the argument, the stored procedure may modify the INOUT parameter, and return the latest value back to the calling program.
	Syntax:
		[ IN | OUT | INOUT ] parameter_name datatype[(length)]
        
	Note:
		While using SELECT ... INTO ... , the SLEECT must return only ONE row. So that the value is stored into user-defined variable, or stored procedure or function parameter.
        If it returns multiple rows or no row at all, it will throw an error.
*/

-- IN

DELIMITER $$

CREATE PROCEDURE getEmployeeByAge(
		IN age_para int
)
BEGIN
	
    SELECT * FROM employees
		WHERE age = age_para;
    
END $$

DELIMITER ;

CALL getEmployeeByAge(22);


-- OUT

DELIMITER $$

CREATE PROCEDURE getEmployeeByAgeWithOUT(
		IN age_para int,
        OUT total int
)
BEGIN
	
    SELECT COUNT(employee_id) 
				INTO total
		FROM employees
		WHERE age = age_para;
    
END $$

DELIMITER ;

CALL getEmployeeByAgeWithOUT(22, @total);



-- INOUT

DELIMITER $$

CREATE PROCEDURE setCounter(
		INOUT counter int,
        IN increment int
)
BEGIN
	
	SET counter = counter + increment;
    
END $$

DELIMITER ;

SET @counter = 1;
CALL setCounter(@counter, 1);
CALL setCounter(@counter, @counter);

Select @counter;


/*
	Using variables in the stored procedure
	Variable can be decalred using DECLARE keyword
    Syntax:
		DECALRE variable_name datatype(size) [DEFAULT default_value];
        
        if default value is not provided, the variable is initialized to NULL.
        
        The value can be assigned to variable using SET statement or SELECT INTO statement.
*/

DELIMITER //

-- this is the only way to alter or modify the existing procedure. Drop it if exists and re-create the procedure.
DROP PROCEDURE IF EXISTS variableExample; 

CREATE PROCEDURE variableExample()
BEGIN

	DECLARE count int default 0;
    -- SET count = 100;
    
    SELECT COUNT(*) 
			INTO count
		FROM employees;
        
	Select count;
    
END //

DELIMITER ;

CALL variableExample();

