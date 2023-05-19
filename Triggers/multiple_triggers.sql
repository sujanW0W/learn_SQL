/*
	Multiple Triggers with same trigger time and event
    
		With newer version of MySQL, we can now create multiple triggers for same event and timing.
        The triggers are fired sequentially based on the infomation provided during the creation of the trigger.
        
        While creating multiple triggers, the info can be provided, whether it FOLLOWS or PRECEDES the existing trigger.
        
        CREATE TRIGGER 	trigger_name
			{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
            ON table_name
            FOR EACH ROW
            {FOLLOWS | PRECEDES} existing_trigger_name
            BEGIN
				-- STATEMENTS
			END $$
            
            FOLLOWS: new trigger will be activated after an existing trigger
            PRECEDES: new trigger will be activated before an existing trigger
*/

-- Example: We have an exsting before_employees_update trigger.
-- Now, lets create a new BEFORE UPDATE trigger that will record the log of the user that has updated.

CREATE TABLE employees_audit_2(
	id int not null auto_increment,
    employee_id int not null,
    id_audit_1 int not null,
    updatedOf varchar(30) not null,
    updatedBy varchar(30) not null,
    updated_date datetime default(current_timestamp),
    primary key(id),
    foreign key(employee_id) references employees(employee_id),
    foreign key(id_audit_1) references employees_audit(id)
);

-- Create a second trigger for BEFORE UPDATE
DELIMITER $$

CREATE TRIGGER before_employees_update_audit_2
	BEFORE UPDATE
    ON employees
    FOR EACH ROW
    FOLLOWS before_employees_update
    BEGIN
		DECLARE id_in_audit_1 int;
        
		SELECT MAX(id) into id_in_audit_1 from employees_audit;
		
        IF OLD.salary != NEW.salary THEN
			INSERT INTO employees_audit_2(employee_id, id_audit_1, updatedOf,  updatedBy)
				Values(OLD.employee_id, id_in_audit_1, OLD.name, user());
		END IF;
            
    END $$
DELIMITER ;

UPDATE employees
	SET salary = 22233
    where address = 'santa rosa';
    
select * from employees_audit;
select * from employees_audit_2;