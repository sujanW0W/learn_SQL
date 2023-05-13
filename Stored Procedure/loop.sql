/*
	LOOP
		3 types of Loop:
        - LOOP : executes statements until the LEAVE statement gets executed which results into break of the loop;
        
        - WHILE: executes statements as long as the search_condition is true. Condition is checked at the beginning of each iteration. So, while loop is also called 'Pre-test' loop.
        
        - REPEAT: executes statements until the seach_condition is true. Condition is checked at the end of each iteration after UNTIL keyword. So, Repeat loop is also called 'Post-test' loop. 
        
				In Repeat loop, statement gets executed at least once. (Just like DO - WHILE loop.)

	LOOP 
		Syntax
			[Loop_label] : LOOP
				statement_list;
			END LOOP [Loop_label];
            
	Two statements within the loop:
		LEAVE [Loop_label] 		- break
        ITERATE [Loop_label]	- continue
        
	
    WHILE LOOP
		Syntax:
			[while_label] : WHILE search_condition DO
				statement_list
			END WHILE [while_label];
            
            
	REPEAT LOOP : This loop executes UNTIL the search_condition is TRUE.
		Syntax 
			[repeat_label] REPEAT
				statement
			UNTIL search_condition
			END REPEAT [repeat_label];
*/


-- LOOP
DELIMITER $$

CREATE PROCEDURE evenNumberConcat(
	IN upperLimit int
)
BEGIN
	
    DECLARE x int default 0;
    DECLARE str varchar(100) default '';
    
    loopLabel : LOOP
		SET x = x + 1;
        IF x > upperLimit THEN
			LEAVE loopLabel; -- break
		END IF;
        
        IF x mod 2 THEN 
			ITERATE loopLabel; -- continue
		END IF;
        
        SET str = concat(str, x, ',');
			
	END LOOP loopLabel;
    
    SELECT str AS String;
    
END $$

DELIMITER ;

CALL evenNumberConcat(15);


-- WHILE LOOP

DELIMITER $$
DROP procedure if exists whileLoop;
CREATE PROCEDURE whileLoop(N int)
BEGIN
	DECLARE x int default 0;
    DECLARE str varchar(100) default '';
    
	whileLabel : WHILE x < N DO
		SET str = concat(str, x, ' ');
        SET x = x + 1;
      
	END WHILE whileLabel;

	SELECT str AS STRING;
END $$

DELIMITER ;

CALL whileLoop(5);



-- REPEAT LOOP
DELIMITER $$

CREATE PROCEDURE repeatLoop(N int)
BEGIN
	DECLARE x int default 0;
    DECLARE str varchar(100) default '';
    
    repeatLabel : REPEAT
		SET str = concat(str, x, ',');
        SET x = x + 1;
	UNTIL x >= N
    END REPEAT repeatLabel;

	SELECT str AS STRING;
END $$

DELIMITER ;

CALL repeatLoop(2);