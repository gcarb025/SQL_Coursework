#how many employees are registered? use count function to find out 

select count(emp_no) from employees; 

#how many different names can be found in the employees table? 

select count(distinct first_name) from employees; 

#aggregate functions ignore null values unless told not to (ie will not 
#count a null value as part of the total)

select count(salary) from salaries 
where salary > 100000;

select count(emp_no) from dept_manager;