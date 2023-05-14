/*
	Stored Function
		It is a special type of stored program that returns a single value. Typically, stored function can be used to encapsulate common formulas or business rules that are reusable in SQL statements or other stored program.
        Different from stored procedure, stored function can be called in SQL statements.
        
        Stored function is created using CREATE FUNCTION.
        Syntax:
			CREATE FUNCTION function_name(
				param1,
                param2
            )
            RETURNS datatype
            [NOT] DETERMINISTIC
            BEGIN
            
            END $$
            
		Here,
			All the parameters are by default IN parameters. We CAN NOT specify modifiers like IN, OUT, INOUT.
            
            RETURNS datatype : mention datatype of the data that is returned by the function
            
            DETERMINISTIC or NOT DETERMINISTIC : 
				A deterministic function is the one that returns the same result for the same set of input parameters whereas a non-deterministic function is the one that returns different result result for same set of input parameters.
                This is optional, if not mentioned, by default the function will be NOT DETERMINISTIC.
                
			Finally, the body of the funciton. BEGIN ... END. The body must return some value using RETURN keyword. The RETURN will immediately terminate the function.
*/


DELIMITER $$

CREATE FUNCTION levelFunction(
	salary DECIMAL(10,2)
)
	RETURNS VARCHAR(30)
	DETERMINISTIC
	BEGIN
    
		DECLARE employee_level varchar(30) default '';
        
        CASE
			WHEN salary > 50000 THEN
				SET employee_level = 'Platinum';
			WHEN salary < 50000 AND salary > 25000 THEN
				SET employee_level = 'GOLD';
			WHEN salary > 0 THEN
				SET employee_level = 'Silver';
			ELSE
				SET employee_level = 'N/A';
        END CASE;
        
        RETURN employee_level;
    
    END $$

DELIMITER ;

SELECT name, levelFunction(salary)
	FROM employees;