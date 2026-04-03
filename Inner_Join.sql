select m.dept_no, m.emp_no, d.dept_name
from dept_manager_dup m
inner join departments_dup d on m.dept_no = d.dept_no
group by m.emp_no #prevents duplicate rows from accidentally creating multiple dusplicates in the joined table
order by m.dept_no;

#inner joins extract only records in which the values in the related columns match, which is why no rows with differing values show update
#null values or values appearing in just one of the two tables are not displayed 

SELECT e.emp_no, e.first_name,e.last_name,dm.dept_no,e.hire_date
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no;

insert into dept_manager_dup
values('110228','d003','1992-03-21','999-01-01');

insert into departments_dup
values ('d009', 'Customer Service');
