/*
	Temporary tables
    
    They are useful for storing intermediate results. They let us perform different selection, update and joins just like typical SQL Server tables.
    
    These temporarary tables gets deleted when the client session terminates. Means, the temporary table lives until the connection is alive.
*/

CREATE TEMPORARY TABLE TEMP_ORDERS(
	ID INT NOT NULL AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(50) NOT NULL,
    AMOUNT DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY(ID)
);

INSERT INTO TEMP_ORDERS(PRODUCT_NAME, AMOUNT)
	VALUES('NOODLES', 499.99);
    
SELECT * FROM TEMP_ORDERS;