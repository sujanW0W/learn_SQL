/*
	SIGNAL / RESIGNAL
    
		These are the statements that will return an error back to the caller.
        SIGNAL can be used anywhere within the stored procedure, But RESIGNAL must be used within the error handler.
        
        SIGNAL SQLSTATE | condition_name
			SET condition_information_item_name_1 = value1,
				condition_information_item_name_2 = value2;
                
		- SIGNAL must be succeeded by a SQLSTATE or a named condition that defines the SQLSTATE.
        
        Example:
			IF C != 1 THEN
				SIGNAL SQLSTATE '45000'
					SET MESSAGE_TEXT = 'Id not found in the table.';
			END IF;
        
        
        RESIGNAL returns the error back to the caller, but this must be used within the error handler.
		Basically, SIGNAL is used when the specific error is not handled and the error is directly returned to the caller. But, if the specific error is handled and when error occurs the error handler will be executed. So for further throwing the error back to the caller, the RESIGNAL clause is used.
        
        Example:
			DECLARE DivisionByZero CONDITION FOR SQLSTATE '22012';
            
            DECLARE CONTINUE HANDLER FOR DivisionByZero
				RESIGNAL SET MESSAGE_TEXT = 'Division By Zero.';
                
			...
            
			IF denominator = 0  THEN
				SIGNAL DivisionByZero;
*/


DELIMITER $$

DROP PROCEDURE IF EXISTS returnError;

CREATE PROCEDURE returnError( 
	numerator int, 
    denominator int, 
    OUT result decimal(10,2)
)
BEGIN
	-- Error handler for infinity
 	DECLARE divisionByZero CONDITION FOR SQLSTATE '22012';
        
	DECLARE CONTINUE HANDLER FOR divisionByZero
  		RESIGNAL SET MESSAGE_TEXT = 'Throw Error: RESIGNAL: Division By Zero';
       
       
	-- SIGNAL
    --  IF denominator = 0 THEN
--  		SIGNAL divisionByZero
--  			SET MESSAGE_TEXT = 'Throw error: Signal = Division By Zero';
--  	END IF;


	-- SIGNAL for using RESIGNAL
    IF denominator = 0 THEN
 		SIGNAL divisionByZero;
	END IF;

	SET result = numerator / denominator;
    
    SELECT result;

END $$

DELIMITER ;

CALL returnError(10, 0, @result);

Select @result;