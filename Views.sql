select * from dept_emp;

select emp_no, from_date, to_date, count(emp_no) as Num
from dept_emp
group by emp_no
having Num > 1;

#view the latest contract dates (from_date and to_date) for each employee
create or replace view v_dept_emp_latest_date as
select emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no;

select emp_no, max(from_date) as from_date, max(to_date) as to_date
from dept_emp
group by emp_no;

#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.
create or replace view v_managers_avg_salary as
select round(avg(s.salary),2) as avg_salary 
from salaries s
join dept_manager m on s.emp_no = m.emp_no;