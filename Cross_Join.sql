
#essentially combines two whole tables
select m.*, d.* 
from dept_manager m
cross join departments d
order by m.emp_no, d.dept_no;

select m.*, d.* 
from dept_manager m, departments d
order by m.emp_no, d.dept_no;

select m.*, d.* 
from dept_manager m
join departments d
order by m.emp_no, d.dept_no;

#remove the row that includes the department the manager actuallt works in 
select m.*, d.* 
from dept_manager m
cross join departments d
where m.dept_no <> d.dept_no
order by m.emp_no, d.dept_no;

#join multiple tables 
select m.*, d.* 
from dept_manager m
cross join departments d
join employees e on m.emp_no = e.emp_no
where m.dept_no <> d.dept_no
order by m.emp_no, d.dept_no;

select m.*, d.* 
from dept_manager m
cross join departments d
where m.dept_no = 'd009'
order by m.emp_no, d.dept_no;

#select first ten employees and all the departments they can be assigned to
select e.*, d.* 
from employees e
cross join departments d
where e.emp_no <10011
order by e.emp_no, d.dept_name;

