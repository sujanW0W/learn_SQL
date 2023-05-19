/*
	Trigger
		Trigger is a stored program that is invoked automatically in response to events such as INSERT, UPDATE, DELETE (DML statements).
        Two types of trigger:
			Row-level trigger: Trigger gets invoked for every row that is affected.
            Statement level trigger: Trigger gets invoked once the statement gets executed. Trigger gets invoked once for a statement, no matter how many rows get affected.
            
			MySQL only support Row-level trigger.
            
	Create a trigger using CREATE TRIGGER keywords.
    
		CREATE TRIGGER trigger_name
			{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
            ON table_name 
            FOR EACH ROW
            trigger_body;
            
		trigger timing: BEFORE | AFTER
        trigger event: INSERT | DELETE | UPDATE
        
		If the trigger_body has multiple statements, use BEGIN...END compound statement. When compound statement is used, REMEMBER to change the default DELIMITER.
        
        The trigger can access the values of columns being affected by the DML statements.
        The old value can be accessed using OLD modifiers and new value using NEW modifier.
        
        Availability:
			For INSERT: Only NEW 
            For UPDATE: Both NEW and OLD
            For DELETE: Only OLD
            
            
		Show Trigger
			SHOW TRIGGERS
				[{FROM | IN} database_name]
                [LIKE 'pattern' | where search_condition];
            
		Drop trigger:
			DROP TRIGGER [IF EXISTS} [schema_name].trigger_name;
		
        If schema_name is not provided, it will only check the currently selected database.
*/

-- Table for auditing
CREATE TABLE employees_audit(
	id int not null primary key auto_increment,
    employeeId int not null,
    previous_salary int not null,
    new_salary int not null,
    changed_date DATETIME default(null),
    `action` varchar(50) default(null)
);

-- Create a trigger for BEFORE UPDATE

CREATE TRIGGER before_employees_update
	BEFORE UPDATE
    ON employees
    FOR EACH ROW
		INSERT INTO employees_audit
			SET action = 'update',
				employeeId = OLD.employee_id,
                previous_salary = OLD.salary,
                new_salary = NEW.salary,
                changed_date = NOW();
                
-- Drop Trigger
	DROP TRIGGER IF EXISTS before_employees_update;

-- SHOW TRIGGERS;
SHOW TRIGGERS;

-- Lets try the trigger. Perform an update into the employees table
UPDATE employees
	SET salary = 13005
    where address = 'rosa';

SELECT * FROM employees_audit;