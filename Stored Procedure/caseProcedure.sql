/*
	Two types of Case Statements within the stored procedure.
		- Simple Case 
			Syntax:
				CASE case_value
					WHEN when_value1 THEN Statements
                    WHEN when_value2 THEN statements
                    ...
                    [ELSE else-statements]
				END CASE;
                
		- Searched Case
			Syntax:
				CASE
					WHEN search_condition1 THEN statements
                    WHEN search_condition2 THEN statements
                    ...
                    [ELSE else-statements]
				END CASE;
                
		NOTE:
			When none of the condition is satisfied, the else-statements get executed.
            Since ELSE is optional and if there is no else-statements and none of the condition is fulfilled, then there will be an error.
            To avoid this error, we can use an empty BEGIN END block in ELSE cluase.
				LIKE:
					CASE
						...
                        ...
						ELSE
							BEGIN
							END;
					END CASE;
*/


-- Simple Case Statement

DELIMITER $$

DROP PROCEDURE IF EXISTS simpleCaseProcedure;

CREATE PROCEDURE simpleCaseProcedure(
	IN employee_id_para int,
    OUT age_status varchar(25)
)
BEGIN
	DECLARE age_var int;
    
    SELECT age INTO age_var
		FROM employees
        WHERE employee_id = employee_id_para;
        
	CASE age_var
		WHEN 22 THEN
			SET age_status = 'Early Twenties';
		WHEN 25 THEN
			SET age_status = 'Mid Twenties';
		When 29 THEN
			SET age_status = 'Late Twenties';
		ELSE
			SET age_status = 'N/A';
	END CASE;
    
END $$

DELIMITER ;

CALL simpleCaseProcedure(6, @age_status);

Select @age_status;



-- Searched CASE statement

DELIMITER $$

Drop procedure if exists searchedCaseProcedure;

CREATE PROCEDURE searchedCaseProcedure(
	IN employee_id_para int,
    OUT levels varchar(20)
)
BEGIN
	DECLARE amount decimal(10,2) default 0.0;
    
	SELECT salary INTO amount
		from employees
        where employee_id = employee_id_para;
        
	CASE
		WHEN amount > 50000 THEN
			SET levels = 'Platinum';
		WHEN amount < 50000 AND amount > 25000 THEN
			SET levels = 'GOLD';
		WHEN amount < 25000  AND amount > 0 THEN
			SET levels = 'SILVER';
		ELSE 
			SET levels = 'N/A';
			
    END CASE;

END $$

DELIMITER ;

CALL searchedCaseProcedure(4, @levels);

Select @levels;
