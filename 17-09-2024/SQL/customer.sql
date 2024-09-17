-- 28 stored Procedures

CREATE PROCEDURE SelectAllEmployees()
SELECT * FROM customer.customers
GO;


CREATE TRIGGER beforeCustomer()
BEFORE INSERT ON customer.customers FOR EACH ROW
BEGIN 
IF NEW.ContactName = "Maria" 