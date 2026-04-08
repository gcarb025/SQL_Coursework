select * from employees 
where hire_date > '2000-01-01';

#creating an using an index reduced the fetch time of te above query from 0.35 sec to 0.0035 sec
create index i_hire_date on employees(hire_date); 

create index i_composite_name on employees(first_name, last_name);

select * from employees 
where first_name = 'Georgi' and last_name = 'Facello';

show index from employees from employees; #shows list of indexes in desired table from desired database 

alter table employees
drop index i_hire_date;

select * from salaries
where salary > 89000;

create index i_salary on salaries(salary);