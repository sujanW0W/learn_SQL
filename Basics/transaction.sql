/*
	Transaction : a unit of work
	ACID: 
		ATOMICITY: All or none
        Consistency: All the changes is successfully implemented stated by committed transaction
        Isolation: Each transactions is independent from each other
        Durability: The result of the committed transaction persists even if system failure occurs.
        
	MySQL is by default autocommit. autocommit means the result is committed automatically after performing transaction.
    To disable autocommit mode implicitly for a single series of statement, we need to use START TRANSACTION statement and have to end with either COMMIT or ROLLBACK.
	With START TRANSACTION, autocommit remails disabled until the transaction is end using COMMIT or ROLLBACK, then autocommit mode is reverted(activated) again.
    
    SAVEPOINT identifier: it creates a checkpoint to where rollback can be performed to that particular point, without rolling back entirely.
    RELEASE [SAVEPOINT] identifier : Removes the stated savepoint.
*/

START TRANSACTION;
	
    INSERT INTO orders
		VALUES(3, 4, '2023-03-02', 1100);
	
    INSERT INTO orders
		VALUES(4, 7, '2023-03-02', 2100);
    
    SAVEPOINT SP1;
    
    DELETE FROM ORDERS
		WHERE ORDER_ID = 3;
       
	RELEASE SAVEPOINT SP1;
    
	ROLLBACK TO SP1;
    
COMMIT; 
       
SELECT * FROM ORDERS;