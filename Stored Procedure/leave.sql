/*
	LEAVE
		LEAVE statement can be used to exit a stored procedure or terminate a loop.
        
		The procedure can be given a label and LEAVE label will exit the stored procedure.
*/
-- Example for exiting a stored procedure using LEAVE.
DELIMITER $$
DROP PROCEDURE IF EXISTS checkEmployee;
	CREATE PROCEDURE checkEmployee(employee_id_para int, OUT output varchar(25))
	procedureLabel: BEGIN
		DECLARE employeeCount int default 0;
        
        -- Check if the employee exists.
        SELECT COUNT(*) INTO employeeCount
			FROM employees
			WHERE employee_id = employee_id_para;
            
		-- If employee does not exist, the count will be zero.
        IF employeeCount = 0 THEN
			SET output = 'No employees found.';
			LEAVE procedureLabel;
		END IF;
        
		SET output = "Employee exists.";
        
    END $$

DELIMITER ;

CALL checkEmployee(22,@output);

SELECT @output;