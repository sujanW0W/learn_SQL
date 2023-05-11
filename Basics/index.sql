    
/* INDEX */

/*
	Index is simply special lookup tables that search engine use to speed up the data retrieval. Understand it as index in book, which helps to locate a particular information by means of page number.
    
    Index can be:
		- Single Column indexes
        - Composite Column indexes (Multiple column indexes)
        - Unique Indexes
        - Implicit Indexes : They are indexes that are automatically created by the database server when object is created. Indexes are implicitly created for Primary Key Constraint, Unique Constraint.
*/

CREATE INDEX employee_name 
	ON employees(name);
    
DROP INDEX employee_name
	ON employees;
