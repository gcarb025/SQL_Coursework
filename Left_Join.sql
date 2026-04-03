delete from dept_manager_dup 
where emp_no = '110228';

delete from departments_dup
where dept_no = 'd009';

insert into dept_manager_dup
values ('110228','d003','1992-03-21','9999-01-01');

insert into departments_dup
values ('d009','Customer Service');

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
join departments_dup d on m.dept_no = d.dept_no #adds rows that are in the m table but not the d table have been added 
#group by m.emp_no prevents duplicate rows from accidentally creating multiple dusplicates in the joined table
order by m.dept_no;

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
left join departments_dup d on m.dept_no = d.dept_no #adds rows that are in the m table but not the d table have been added 
order by m.dept_no;

#order of tables matters 
select d.dept_no, m.emp_no, d.dept_name #first selection should be retrieved from first table set 
from departments_dup d 
left join dept_manager_dup m on m.dept_no = d.dept_no #adds rows that are in the d table but not the m table have been added 
order by d.dept_no;

select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
left join departments_dup d on m.dept_no = d.dept_no #adds rows that are in the m table but not the d table have been added 
where dept_name is null #only shows rows that are specific to the left table (m)
order by m.dept_no;

select e.emp_no, e.first_name, e.last_name, m.dept_no, m.from_date
from employees e
left join dept_manager_dup m on e.emp_no = m.emp_no 
where e.last_name = 'Markovitch' 
order by dept_no desc, emp_no;






