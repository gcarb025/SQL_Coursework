use employees;

update employees 
set 
	first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
where 
	emp_no = 999901;
    
select * from departments_dup
order by dept_no;

commit;

update departments_dup
set
	dept_no = 'd011',
    dept_name = "Quality Control"; #changes all rows to d0ll and Quality Control instead of adding a row 
    
rollback;

commit;

update departments
set 
	dept_name = "Data Analysis"
where 
	dept_no = "d010";
    
select * from departments 