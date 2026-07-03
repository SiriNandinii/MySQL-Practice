#Stored Procedure

/*A stored procedure is a set of Structured Query Language (SQL) statements with an 
assigned name, which are stored in a relational database management system (RDBMS) 
as a group, so it can be reused and shared by multiple programs.

Stored procedures can access or modify data in a database, but it is not tied to a 
specific database or object, which offers a number of advantages.
*/

-- Normally Queries are not saved
-- If you want to save any query on the database server for execution later, one way 
-- to do it is to use a stored procedure.

USE classicmodels;

SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
FROM
    customers
ORDER BY customerName;

/*The following CREATE PROCEDURE statement creates a new stored procedure that 
 wraps the query above: */

-- Create Stored Procedure

DELIMITER //
CREATE PROCEDURE getMyCustomers123()
	BEGIN
	
	SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
		FROM customers
			ORDER BY customerName;
				
	END //
	
delimiter ;

CALL getMyCustomers123();







-- --------------------------------------------------
SELECT *  FROM employees;
SELECT * FROM offices;

delimiter //
CREATE procedure getMyEmployees()
	begin
	
	SELECT e.employeeNumber,CONCAT(lastName,' ',firstName),
		email, jobTitle, ofc.city,ofc.country
		 FROM employees e 
			INNER JOIN offices ofc
			ON e.officeCode=ofc.officeCode;
		
	END//

delimiter ;


CALL getMyEmployees();






delimiter //
CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
BEGIN 
	SELECT * FROM offices WHERE country=countryName;
END //

delimiter ;


CALL GetOfficeByCountry('USA');

CALL GetOfficeByCountry('France');

CALL GetOfficeByCountry();






delimiter $$

CREATE PROCEDURE GetOrderCountByStatus (
	IN orderStatus VARCHAR(25),
	OUT total INT
)

BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE STATUS=OrderStatus;
END $$


delimiter ;

CALL GetOrderCountByStatus('Shipped', @total);
SELECT @total AS TotalShipped;



	