
CREATE TRIGGER before_insert_department_location
 BEFORE INSERT ON training.department FOR EACH ROW
 BEGIN 
	IF NEW.dep_name NOT IN("FINANCE", "AUDIT", "MARKETING", "PRODUCTION") 
    THEN SET NEW.dep_name = "NULL" ;
END IF;




