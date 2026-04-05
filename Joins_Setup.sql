drop table departments_dup; 
drop table dept_manager_dup;

create table departments_dup
(dept_no char(4) null, dept_name varchar(40) null);

insert into departments_dup
(dept_no, dept_name)
select * from departments;

select * from departments_dup
order by dept_no;

insert into departments_dup (dept_name)
values ('Public Relations');

delete from departments_dup
where dept_no = 'd002';

insert into departments_dup (dept_no)
values ('d010');

insert into departments_dup (dept_no)
values ('d011');

select * from departments_dup
order by dept_no;

create table dept_manager_dup
(emp_no int(11) not null, 
dept_no char(4) null, 
from_date date not null, 
to_date date null);

insert into dept_manager_dup
select * from dept_manager;

insert into dept_manager_dup(emp_no, from_date)
values (999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01');

delete from dept_manager_dup
where dept_no = 'd001';

select * from dept_manager_dup
order by dept_no;
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');












