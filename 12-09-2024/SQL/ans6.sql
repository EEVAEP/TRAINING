SELECT emp_id, emp_name, salary, date_format(hire_date, "%M, %e, %Y") AS "Formatted Date"
FROM employees;