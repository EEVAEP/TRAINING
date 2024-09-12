SELECT emp_name,char_length(REPLACE(emp_name,' ','')) AS Length
FROM training.employees;