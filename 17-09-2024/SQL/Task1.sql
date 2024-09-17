-- 1. From the above table return complete information about the employees.
SELECT * FROM training.employees;


-- 2. From the table, write a SQL query to find the salaries of all employees. Return salary. 
SELECT salary FROM training.employees;


-- 3. From the table, write a SQL query to find the unique designations of the employees. Return job name. 

SELECT DISTINCT(job_name) 
FROM training.employees;


-- 4. From the following table, write a SQL query to list the employees’ names, 
-- increase their salary by 15%, and express the number of Dollars.

SELECT emp_name, CONCAT('$', ROUND(salary*1.15)) AS incresed_salary
FROM training.employees;



-- 5. From the following table, write a SQL query to list the 
-- employee's name and job name as a format of "Employee & Job".

SELECT CONCAT(emp_name, ' ', job_name) AS "Employee & Job" 
FROM training.employees;




-- 6. From the following table, write a SQL query to find those employees with a hire date 
-- in the format like February 22, 1991.
--  Return employee ID, employee name, salary, hire date. 

SELECT emp_id, emp_name, salary, date_format(hire_date, "%M, %e, %Y") AS "Formatted Date"
FROM employees;



-- 7. From the following table, write a SQL query to count the number of characters 
-- except the spaces for each employee name. Return employee name length.

SELECT emp_name,char_length(REPLACE(emp_name,' ','')) AS Length
FROM training.employees;


-- 8. From the following table, write a SQL query to find the employee ID, salary, and commission of all the employees.
SELECT emp_id, salary, commission
FROM training.employees;


-- 9. From the following table, write a SQL query to find those employees who do not belong to the department 2001.
-- Return complete information about the employees. (Using NOT IN)
SELECT * 
FROM training.employees
WHERE dep_id NOT IN (2001);


-- 10. From the following table, write a SQL query to find those employees who joined before 1991.
-- Return complete information about the employees
SELECT * 
FROM training.employees
WHERE hire_date < "1991-01-01";

-- 11. From the following table, write a SQL query to compute the average salary of those employees who 
-- work as ‘ANALYST’. Return average salary

SELECT AVG(salary) AS AVG_salary
FROM training.employees
WHERE job_name='ANALYST';

-- 12. From the following table, write a SQL query to find the details of the employee ‘BLAZE’.

SELECT *
FROM training.employees
WHERE emp_name="BLAZE";


-- 13. From the following table, write a SQL query to find those employees whose salary exceeds
-- 3000 after giving a 25% increment. Return complete information about the employees.  

SELECT * 
FROM training.employees
WHERE salary * 1.25 > 3000;

-- 14. From the following table, write a SQL query to find those employees who joined in the
--  month January. Return complete information about the employees. 

SELECT * 
FROM training.employees
WHERE hire_date LIKE("____-01-%");

SELECT *
FROM training.employees
WHERE MONTH(hire_date) = 1;


-- 15. From the following table, write a SQL query to find those employees who joined before
--  1st April 1991. Return employee ID, employee name, hire date and salary. 

SELECT *
FROM training.employees
WHERE hire_date < "1991-04-01";



-- 16. From the following table, write a SQL query to find the name and salary of the 
-- employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)

SELECT emp_name, salary
FROM training.employees
WHERE salary between 2101 AND 3100 AND emp_name = "FRANK" ;

-- 17. From the following table, write a SQL query to list all the employees except PRESIDENT 
-- and MANAGER in ascending order of salaries. Return complete information about the employees.(Using Order By)

SELECT *
FROM training.employees
WHERE job_name NOT IN ("PRESIDENT", "MANAGER")
ORDER BY salary ASC;


-- 18. From the following table, write a SQL query to find the highest salary. Return the highest salary.

SELECT MAX(salary)
FROM training.employees;


-- 19. From the table, write a SQL query to find the average salary and average total
-- remuneration (salary and commission) for each type of job. 
-- Return name, average salary and average total remuneration. (Using GROUP BY)


SELECT job_name, AVG(salary), AVG(salary + IFNULL(commission,0)) AS Total_remuneration
FROM training.employees
GROUP BY job_name;


-- 20. From the following table, write a SQL query to find those employees who 
-- work in the department ID 1001 or 2001. Return employee ID, employee name, department ID, 
-- department location, and department name.(Using IN clause)

SELECT employees.emp_id, employees.emp_name, department.dep_id, department.dep_location, department.dep_name
FROM training.employees
INNER JOIN training.department ON employees.dep_id = department.dep_id
WHERE  department.dep_id IN (1001, 2001);


-- 21. From the table, write a SQL query to list the managers and number of employees work under them. 
-- Sort the result set in ascending order on manager. 
-- Return manager ID and number of employees under them.(Using GROUP BY & ORDER BY)

SELECT  manager_id, count(emp_id) AS count
FROM training.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY manager_id ASC;


-- 22. From the table, write a SQL query to find those departments where at least two employees work.
--  Return department id, number of employees.(GROUP BY & HAVING)

SELECT dep_id, COUNT(emp_id) AS COUNT
FROM training.employees
GROUP BY dep_id
HAVING COUNT(emp_id)>2;


-- 23. From the table, write a SQL query to find those employees whose names contain the character 
-- set 'AR' together. Return complete information about the employees. (using ‘like’)

SELECT *
FROM training.employees
WHERE emp_name LIKE ("%AR%");


-- 24. Add a column for “Gender” in the employee table and update each row accordingly.

ALTER TABLE training.employees 
ADD Gender varchar(8);

UPDATE training.employees
SET Gender=CASE
	WHEN emp_name IN ('SANDRINE','WADE','MADDEN','CLARE','KAYLING','ADNRES','FRANK') THEN 'FEMALE'
    WHEN emp_name IN ('ADELYNE','JONAS','BLAZE','SCARLET','TUCKER','JULIUS','MARKER') THEN 'MALE'
    ELSE 'UNKNOWN'
    END
WHERE emp_id IS NOT NULL
LIMIT 100;


UPDATE training.employees
SET Gender = CASE
    WHEN RAND() < 0.5 THEN 'MALE'
    ELSE 'FEMALE'
    END
WHERE emp_id IS NOT NULL 
LIMIT 100;


-- 25. From the above table we need to retrieve all employees except ‘Manager’ & ’President’ Job name. 

SELECT *
FROM training.employees 
WHERE job_name NOT IN ("MANAGER","PRESIDENT");


-- 26. From the above table we need to display ‘Management Level’ - labelname for ‘President’,’Manager’,’Analyst’ 
-- jobs and ‘Employee Level’ - label name for ‘Salesman’,’Clerk’ job names.

SELECT *,
	CASE
		WHEN job_name IN ('PRESIDENT','MANAGER','ANALYST') THEN 'Management Level'
        WHEN job_name IN ('Salesman','Clerk') THEN 'Employee Level'
		ELSE 'Other'
        END AS Job_level
       
FROM training.employees;
      

-- 27. Update commission field to 650.00 for job name titled as  “analyst” in “employee” table using 
-- Exist clauses.

UPDATE training.employees customers
SET e.commission=650.00
WHERE EXISTS (
	SELECT 1
    FROM (
			SELECT emp_id
			FROM training.employees 
			WHERE job_name="ANALYST"
		) sub
		WHERE sub.emp_id=e.emp_id
);

-- 28 STORED PROCEDURES---------------

CREATE PROCEDURE SelectAllEmployees()
SELECT * FROM training.employees
GO;

-- FUNCTIONS -------------------------

SELECT FIELD("c","a","b","c");

SELECT FIND_IN_SET("c","a,b,c");

SELECT FORMAT(56789.98567,2);

SELECT INSERT("W3Schools.com", 10, 2, "no");

SELECT INSTR("W3Schools.compbmcom", "COM") AS MatchPosition;

SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

SELECT REVERSE("Software Training");



CREATE INDEX first_index
ON training.employees(emp_name);



CREATE TEMPORARY TABLE temp_orders (
    order_id INT,
    order_date DATE,
    customer_id INT
);
















