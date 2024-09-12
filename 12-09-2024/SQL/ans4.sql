SELECT emp_name, CONCAT('$', ROUND(salary*1.15)) AS incresed_salary
FROM training.employees;