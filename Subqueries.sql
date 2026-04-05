select * from dept_manager; 

#select the first and last names from the employees table from the same emp numbers found in the dept_managers table 
#using where/in
select e.first_name, e.last_name
from employees e 
where e.emp_no in (select m.emp_no from dept_manager m);

#select data about department managers whose hire dates are in between 1990-01-01 and 1995-01-01
select * from dept_manager 
where emp_no in (select emp_no from employees 
				where hire_date between '1990-01-01' and '1995-01-01');
                
#using exists/not exists 
select e.first_name, e.last_name
from employees e 
where exists (select * from dept_manager m
				where m.emp_no = e.emp_no);
                
#select the information for employees whose job title is "assistant engineer"
select *
from employees e 
where exists (select * from titles t
				where t.emp_no = e.emp_no and 
                t.title = 'Assistant Engineer');
                
#subqueries nested in select and from alter

#task: assign employee number 110022 as a manager to all employees from 10001-10020 and employee number 110039 as a manager to 100021-10040


select A.* from
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110022) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no <= 10020
		group by e.emp_no
		order by e.emp_no) as A
union select B.* from
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110039) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no > 10020
		group by e.emp_no
		order by e.emp_no
		limit 20) as B;
        
        
drop table if exists emp_manager; 

create table emp_manager
	(emp_no int(11) not null,
    dept_no char(4) null,
    manager_no int(11) not null);

#Task: Fill emp_manager with data about employees, the number of the department they are working in, and their managers.


insert into emp_manager 
select U.* from 
(select A.* from
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110022) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no <= 10020
		group by e.emp_no
		order by e.emp_no) as A
union select B.* from
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110039) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no > 10020
		group by e.emp_no
		order by e.emp_no
		limit 20) as B
union select C.* from 
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110039) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no = 110022
		group by e.emp_no
		order by e.emp_no
		limit 20) as C
union select D.* from 
(select e.emp_no as employee_ID, 
	min(de.dept_no) as department_code,
	(select emp_no from dept_manager 
		where emp_no = 110022) as manager_ID
		from employees e 
		join dept_emp de on e.emp_no = de.emp_no
		where e.emp_no = 110039
		group by e.emp_no
		order by e.emp_no
		limit 20) as D) as U;
        
select * from emp_manager;



