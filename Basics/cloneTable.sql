/*
	Clone Tables
    
    Lets consider a scenario where we want an exact copy of a table. Here, Create Table ... SELECT ... (creating table from other table) might not work since this does not copy all the indexes.
    So, when we want an exact replica, we can hit a query that returns Create Table statement that specifies the source table's structure, indexes and all.
    
    Simply, hit query to get the statement and copy the statment then replace the table name and execute it.
    There you go. You have an exact copy of the source table.
*/

SHOW CREATE TABLE orders;

CREATE TABLE `clone_orders` (
  `ORDER_ID` int NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int NOT NULL,
  `ORDER_DATE` datetime NOT NULL,
  `ORDER_TOTAL` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`EMPLOYEE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DESCRIBE clone_orders;

SHOW CREATE TABLE clone_orders;

-- Insert all the records from the source table into the clone table.
INSERT INTO clone_orders
	SELECT * FROM orders;

select * from clone_orders;
