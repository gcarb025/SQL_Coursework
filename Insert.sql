select * from employees 
limit 10;

insert into employees 
(
	emp_no, 
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) Values 
(
	999901,
    '1986-21-04',
    'John',
    'Smith',
    "M",
    '2011-01-01'
);

select * from titles;

insert into titles 
(
	emp_no,
    title,
    from_date,
    to_date
) values 
(	
	999903,
    "Senior Engineer",
    "1997-10-01",
    '9999-01-01'
);

select * from departments;

create table departments_dup
(
	dept_no char(4) not null,
    dept_name varchar(40) not null
);

select * from departments_dup;

insert into departments_dup
(
	dept_no,
    dept_name
)
select * from departments;

select * from departments_dup;