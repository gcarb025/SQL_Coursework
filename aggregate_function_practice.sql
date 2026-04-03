# the * can be used in count to replace the argument, and count can be used for numeric and non-numeric data. 
# these only apply to the count, not any other aggregate functions seen here 

select sum(salary) from salaries; #add up all the values in the column 

select sum(salary) from salaries 
where from_date > '1997-01-01';

select max(salary) from salaries; 
select min(salary) from salaries;

select min(emp_no) from employees;
select max(emp_no) from employees;

select round(avg(salary),2) from salaries
where from_date > '1997-01-01';

