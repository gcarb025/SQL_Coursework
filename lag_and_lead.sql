select emp_no, salary, 
	lag(salary) over w as previous_salary,
    lead(salary) over w as next_salary,
    salary-lag(salary) over w as diff_salary_current_previous,
	lead(salary) over w - salary as diff_salary_next_current
from salaries 
where emp_no = 10001
window w as (order by salaries);

#Write a query that can extract the following information from the "employees" database:
#- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive
#- a column showing the previous salary from the given ordered list
#- a column showing the subsequent salary from the given ordered list
#- a column displaying the difference between the current salary of a certain employee and their previous salary
#- a column displaying the difference between the next salary of a certain employee and their current salary
#Limit the output to salary values higher than $80,000 only.
#Also, to obtain a meaningful result, partition the data by employee number.

select 
	emp_no,
    salary,
	lag(salary) over w as previous_salary,
	lead(salary) over w as next_salary,
	salary-lag(salary) over w as diff_salary_current_previous,
	lead(salary) over w - salary as diff_salary_next_current
from salaries
where emp_no between 10500 and 10600
	and salary > 80000
window w as (partition by emp_no order by salary);

#Create a query whose result set contains data arranged by the salary values associated to each employee number (in ascending order). Let the output contain the following six columns:
#- the employee number
#- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)
#- the employee's previous salary
#- the employee's contract salary value preceding their previous salary
#- the employee's next salary
#- the employee's contract salary value subsequent to their next salary
#Restrict the output to the first 1000 records you can obtain.

select 
	emp_no,
    salary,
	lag(salary) over w as previous_salary,
    lag(salary,2) over w as previous_previous_salary,
	lead(salary) over w as next_salary,
	lead(salary,2) over w as salary_after_next
from salaries
where emp_no between 10500 and 10600
	and salary > 80000
window w as (partition by emp_no order by salary);



