/*
	IF THEN ELSE
		3 types:
		-	IF condition THEN
				statements;
			END IF;
		
        -	IF condition THEN
				statements;
			ELSE
				statements;
			END IF;
            
		-	IF condition THEN
				statements;
			ELSEIF condition THEN
				statements;
			ELSE
				statements;
			END IF;
*/

DELIMITER $$

DROP procedure if exists ifElseExample;

CREATE PROCEDURE ifElseExample(
	IN employee_id_para int,
    OUT nameOut varchar(30),
    OUT levels varchar(10)
)

BEGIN
    DECLARE amount decimal(10,2);
    
	SELECT name, salary INTO nameOut, amount
		FROM employees
        WHERE employee_id = employee_id_para;
        
	IF amount > 50000 THEN 
		SET levels = 'Platinum';
	ELSEIF amount < 50000 AND amount > 25000 THEN
		SET levels = 'GOLD';
	ELSE
		SET levels = 'SILVER';
	END IF;

END $$

DELIMITER ;

CALL ifElseExample(7, @name, @levels);

Select @name, @levels;
