select * from departments_dup
order by dept_no;

select dept_no, ifnull(dept_name, 'Department name not provided') as department_name
from departments_dup
order by dept_no;

#ifnull cannot contains more than 2 parameters, coalesce is basically ifnull with more than 2 parameters 

#works the same as ifnull if there are only 2 parameters 
select dept_no, coalesce(dept_name, 'Department name not provided') as department_name
from departments_dup
order by dept_no;

select dept_no, dept_name, coalesce(manager, dept_name,'N/A') as dept_manager
from departments_dup
order by dept_no asc;

#one parameter can create a "hypothetical" column 
select dept_no, dept_name, coalesce('department manager name') as fake_col
from departments_dup;

select dept_no, dept_name, coalesce(dept_no, dept_name) as dept_info
from departments_dup;