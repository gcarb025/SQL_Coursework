#having is like where but applied to the group by block 
#input between group by and order by 
use employees;

select * from employees 
where hire_date >= '2000-01-01';

select * from employees 
having hire_date >= '2000-01-01'; #has same output as where 

select first_name, count(first_name) as names_count from employees 
group by first_name
having count(first_name) > 250 #using where (in the right place) gives you an error bc count is an aggregate function
order by first_name;

select emp_no, avg(salary) from salaries
group by emp_no
having avg(salary) > 120000 
order by emp_no;

#having vs where
select first_name, count(first_name) as names_count from employees 
where hire_date > '1999-01-01'
group by first_name
having count(first_name) < 200 #cannot have an aggregated and nonaggregated function in the having clause
order by first_name desc;

select emp_no, count(dept_no) as contracts_count from dept_emp 
where from_date > '2000-01-01'
group by emp_no
having count(dept_no) > 1 #cannot have an aggregated and nonaggregated function in the having clause
order by emp_no;

select * from dept_emp;

