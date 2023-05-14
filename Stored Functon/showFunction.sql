-- See all the stored funtions
	
/*
	SHOW FUNCTION STATUS
		[LIKE 'pattern' | WHERE search_condition]
*/
    
    SHOW FUNCTION STATUS
		WHERE DB = 'learn_sql';
        
	SHOW FUNCTION STATUS
		LIKE '%func%';