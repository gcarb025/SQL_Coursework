select emp_no, salary from salaries; 

#using row_number() window functions

#having a blank () in over will execute query in all rows
#having partition by separates by whatever column is specified, in this case emp_no 
	#results number rows based on employee number, then restart once the employee number changes (i.e. 1-17 for 17 rows of the same emp_no, then restarts at the next emp number )
select emp_no, salary, row_number() over (partition by emp_no) as row_num
from salaries; 

# allows to order by salary from highest to lowest within row_number 
select emp_no, salary, row_number() over (partition by emp_no order by salary desc) as row_num
from salaries; 

#task: Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
#Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1. Assign that value to the manager with the lowest employee number.
select emp_no, dept_no, row_number() over (order by emp_no asc) as row_num
from dept_manager;

#Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table. Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).
select emp_no, first_name, last_name, row_number() over (partition by first_name order by last_name asc) as row_num 
from employees;

#Using several window functions in a query can get messy, so it's better to only use 
#window specifications requiring identical partitions 

#alternative syntax, not the most professional 
select emp_no, salary, 
row_number() over w as row_num
from salaries 
window w as (partition by emp_no order by salary desc); 

#task: Write a query that provides row numbers for all workers from the "employees" table, 
#partitioning the data by their first names and ordering each partition by their employee number in ascending order.
select emp_no, first_name, last_name, 
row_number() over w as row_num
from employees 
window w as (partition by first_name order by emp_no); 

use employees;
#partition by vs group by
select a.emp_no, max(salary) as max_salary from (
	select emp_no, salary from salaries) a 
    group by emp_no;

select a.emp_no, 
a.salary as max_salary from (
	select emp_no, salary, row_number() over w as row_num
    from salaries 
    window w as (partition by emp_no order by salary desc)) a 
where a.row_num = 1;

#Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery containing a window function, as well as a window specification introduced with the help of the WINDOW keyword.
select a.emp_no, 
min(salary) as min_salary from (
	select emp_no, salary, row_number() over w as row_num
    from salaries 
    window w as (partition by emp_no order by salary)) a 
group by emp_no;

