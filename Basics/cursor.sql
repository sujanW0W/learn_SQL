/*
	MySQL Cursor
		Cursor is used to handle result set inside a stored procedure. A cursor allows to iterate through the set of rows returned by a query(SELECT) and process each row individually.
        MySQL cursor is Read-Only, Non-scrollable & Asensitive.
			Read-Only: Cannot update the data, only read.
            Non-Scrollable: Cannot modify the order of the rows in result set, which is defined by the SELECT statement.
            Asensitive: points to the actual data, not the temporary copy of data(insensitive cursor). Since, we are working with the actual data, other connection should not modify the data that is being accessed by this asensitive cursor, which may cause inconsistency.
			
		Working with the MySQL Cursor
			Declared using DECLARE statment:
				DECLARE cursor_name CURSOR FOR SELECT_Statement;
			
            Note:
				The cursor declaration must be after any variable declaration.
                
			The cursor has to be opened using OPEN statement.
				OPEN cursor_name;
                
			FETCH: to move cursor to the next row and fetch data from next row.
				FETCH cursor_name INTO variable_list;
			
            Here, we need to check if there is data in the next row. If we reach at the end of the result set, next row will be empty.
            In this condition NOT FOUND handler must handle this condition.
            
            To declare a NOT FOUND handler, we use following syntax:
				DECLARE CONTINUE HANDLER FOR NOT FOUND 
					SET finished = 1;
			
            This NOT FOUND handler declaration must be after variable and cursor declaration.
			Here, the finished is the variable to indicate the end of the result set. This variable can be used to detect the end of the set and LEAVE the loop while accessing the rows in the result set.\\
            
            Finally, the cursor has to be closed. This will deactivate the cursor and deactivate all the memory associated with it.
				CLOSE cursor_name;	
*/

DELIMITER $$
DROP PROCEDURE IF EXISTS createAddressList;
CREATE PROCEDURE createAddressList(
	INOUT addressList varchar(1000)
)
BEGIN
	DECLARE finished int default 0; -- variable for NOT FOUND handler
    DECLARE addressVar varchar(30) default '';
    
    -- Declare cursor
	DECLARE addressCursor 
		CURSOR FOR 
			SELECT address from employees;
            
	-- Declare NOT FOUND handler
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET finished = 1;
            
	OPEN addressCursor;
    
    -- Loop for accessing the rows
    loopLabel: LOOP
		FETCH addressCursor 
			INTO addressVar;
		
		IF finished = 1 THEN
			LEAVE loopLabel;
		END IF;
        
		SET addressList = CONCAT(addressVar, ', ', addressList);
        
	END LOOP;
    
    CLOSE addressCursor;

END $$

DELIMITER ;

SET @addressList = '';
CALL createAddressList(@addressList);

Select @addressList;