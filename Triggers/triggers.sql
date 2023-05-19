/*

	Triggers can be named using trigger's timing and event info.
    
		BEFORE INSERT : Trigger that is fired or invoked BEFORE the INSERT event occurs on the table.
		AFTER INSERT : Trigger that is fired AFTER the INSERT event occurred on the table.
			Note: Insert trigger can access only NEW data, as there is no old data.
        
        BEFORE UPDATE : Trigger that is fired BEFORE the UPDATE event occurs on the table associated with the t 
        AFTER UPDATE : Trigger that is fired AFTER the UPDATE event occurred on the table
			Note: Update trigger can access both NEW and OLD data.
        
        BEFORE DELETE :	Trigger that is fired BEFORE the DELETE event occur on the table.
        BEFORE DELETE : Trigger tat is fired AFTER the DELETE event occurred on the table.
			Note: DELETE trigger can only access OLD data, as there is no new data.
            
*/