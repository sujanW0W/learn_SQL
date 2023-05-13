/*
	Error Handler
    
    MySQL provides ways to define handlers that handle errors or exceptions.
    
    To declare handler, we use DECLARE HANDLER statement
		DECLARE action HANDLER FOR condition_value statement;
        
			- action can be either CONTINUE or EXIT.
				CONTINUE: the execution of the code block beneath the statement will continue.
                EXIT: the execution of the code block terminates.
                
			- condition_value can be one of the following: 
					- MySQL Error Code 
                    - SQLSTATE value : SQLEXCEPTION or SQLWARNING or NOT FOUND
                    - name condition (we can provide name for a condition (mentioned below) )
				
			- statement could be simple statement like SET ... or compound statement enclosing by BEGIN and END keyword.
            
	example:
		DECLARE CONTINUE HANDLER FOR NOT FOUND 
			SET finished = 1;
            
		DECLARE EXIT HANDLER FOR SQLEXCEPTION
			BEGIN
				ROLLBACK;
                SELECT 'An error has occurred, operation rollbacked and the stored procedure has been terminated.' AS Message;
            END;
            
		DECLARE CONTINUE HANDLER FOR 1062
			SELECT 'Error, Duplicate key occurred.';
            
		1062 is MySQL error code for duplicate.
        
        There are a lot of error code. We wont be able to remember all of those error codes. Now, in a large program, there could be a number of error handlers with different error codes. It will be difficult in maintaining and understanding these error handlers.
	
		For convinience, we can provide name to the error condition using DECLARE CONDITION statement.
			DECLARE condition_name CONDITION FOR condition_value;
            
            - condition_value can be error code or SQLSTATE
            - condition name will represent the associated condition_value.
            
		example:
        
			DECALRE TableNotFound CONDITION FOR 1146;
            
            DECLARE EXIT HANDLER FOR TableNotFound
				SELECT 'Please Create table first' AS Message;
            
*/	

-- Create table for this example
CREATE TABLE SupplierProducts(
	supplierId int,
    productId int,
    PRIMARY KEY(supplierId, productId) -- Composite Key
);

DELIMITER $$

DROP PROCEDURE IF EXISTS errorHandler;

CREATE PROCEDURE errorHandler(
	supplierId int,
    productId int
)
BEGIN
	-- Error Handler for duplicate error
    DECLARE DuplicateKey CONDITION FOR 1062;
    
	DECLARE EXIT HANDLER FOR DuplicateKey
		BEGIN
			SELECT CONCAT( 'Duplicate Key ( ', supplierId, ', ', productId, ' ) occurred.') AS Error_Message;
        END;

	INSERT INTO SupplierProducts
		Values(supplierId, productId);
        
	SELECT * FROM SupplierProducts;

END $$

DELIMITER ;

CALL errorHandler(1,1);
CALL errorHandler(1,2);
CALL errorHandler(1,3);
CALL errorHandler(1,4);

-- Error Call
CALL errorHandler(1,3);