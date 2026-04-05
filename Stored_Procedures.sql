use employees; 

drop procedure if exists select_employees;

#create a stored procedure thats returns the first 1000 rows from the employees table 
delimiter $$
create procedure select_employees()
begin 
	select * from employees
    limit 1000;
end$$
delimiter ;

#call or invoke stored procedure select_employees

#1 - call database.stored_procedure();
call employees.select_employees();

#2 - can skip the database name bc we already established what database we are looking at 
call select_employees();

#3 - select lightning bold next to select_employees in schemas secyion under stored_procedures

#task: Create a procedure that will provide the average salary of all employees. Then, call the procedure.

drop procedure if exists avg_salary;

delimiter $$
create procedure avg_salary()
begin 
	select round(avg(salary),2) from salaries;
end$$
delimiter ;

call avg_salary;

#drop stored procedures
drop procedure select_employees;

#stored procedures with input parameters 
drop procedure if exists emp_salary; 

delimiter $$
use employees $$
create procedure emp_salary(in p_emp_no integer)
begin
select e.first_name, e.last_name, s.salary, s.from_date, s.to_date
from employees e
join salaries s on e.emp_emp_salaryno = s.emp_no 
where e.emp_no = p_emp_no;
end$$
delimiter ;

drop procedure if exists emp_avg_salary; 

delimiter $$
use employees $$
create procedure emp_avg_salary(in p_emp_no integer)
begin
select e.first_name, e.last_name, avg(s.salary)
from employees e
join salaries s on e.emp_no = s.emp_no 
where e.emp_no = p_emp_no;
end$$
delimiter ;

call emp_avg_salary(11300);

#stored procedures with output parameters 

drop procedure if exists emp_avg_salary_out; 

delimiter $$
use employees $$
create procedure emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
begin
select avg(s.salary)
into p_avg_salary 
from employees e
join salaries s on e.emp_no = s.emp_no 
where e.emp_no = p_emp_no;
end$$
delimiter ;

#task:Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.


delimiter $$
use employees $$
create procedure emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_number integer)
begin
select e.emp_no
into p_emp_number 
from employees e
where e.first_name = p_first_name and e.last_name = p_last_name;
end$$
delimiter ;

#variables 

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary; 

set @v_emp_no = 0;
call emp_info('Aruna','Journel',@v_emp_no);
select @v_emp_no;

#functions 

delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql reads sql data #need to add this to prevent 1418 error 
begin
declare v_avg_salary decimal(10,2);
select avg(s.salary)
into v_avg_salary 
from employees e
join salaries s on e.emp_no = s.emp_no 
where e.emp_no = p_emp_no;
return v_avg_salary;
end$$
delimiter ;

select f_emp_avg_salary(11300);

#task: Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
# and returns the salary from the newest contract of that employee.

drop function if exists f_emp_info;

delimiter $$ 
create function f_emp_info (p_first_name varchar(255), p_last_name varchar(255)) returns decimal(10,2)
deterministic no sql reads sql data
begin
declare v_max_from_date date;
declare v_salary decimal(10,2);
select max(s.from_date)
	into v_max_from_date
	from salaries s 
	join employees e on s.emp_no = e.emp_no 
	where e.first_name = p_first_name and e.last_name = p_last_name;
select s.salary 
	into v_salary from employees e 
    join salaries s on e.emp_no = s.emp_no 
    where e.first_name = p_first_name and e.last_name = p_last_name and s.from_date = v_max_from_date;
return v_salary;
end$$
delimiter ;

SELECT f_EMP_INFO('Aruna', 'Journel');







