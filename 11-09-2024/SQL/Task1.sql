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

SELECT CONCAT(emp_name,' ',job_name) AS "Employee & Job" 
FROM training.employees;




-- 6. From the following table, write a SQL query to find those employees with a hire 	. Return employee ID, employee name, salary, hire date.

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
WHERE hire_date<("1991-01-01");

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
WHERE salary * 1.25 >3000;

-- 14. From the following table, write a SQL query to find those employees who joined in the
--  month January. Return complete information about the employees. 

SELECT * 
FROM training.employees
WHERE hire_date LIKE("____-01-%");


-- 15. From the following table, write a SQL query to find those employees who joined before
--  1st April 1991. Return employee ID, employee name, hire date and salary. 

SELECT *
FROM training.employees
WHERE hire_date < "1991-04-01";



-- 16. From the following table, write a SQL query to find the name and salary of the 
-- employee FRANK. Salary should be equal to the maximum salary within his or her salary group.(Using Between)













