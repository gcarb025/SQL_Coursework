

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join departments_dup d on m.dept_no = d.dept_no
order by m.dept_no;

#joins can be also presented with where 
select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m, departments_dup d 
where m.dept_no = d.dept_no
order by m.dept_no;

select m.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from dept_manager_dup m, employees e
where m.emp_no = e.emp_no
order by m.emp_no;

select e.emp_no, e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary > 145000; # where can be used as a conditional rather than a replacements for join

select e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no = t.emp_no
where first_name = 'Margareta' and last_name = 'Markovich';
