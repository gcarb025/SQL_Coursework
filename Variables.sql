#local variables 
drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql reads sql data 
begin
declare v_avg_salary decimal(10,2); #v_avg_salary is a local variable, cannot be called outside of begin/end block
select avg(s.salary)
into v_avg_salary 
from employees e
join salaries s on e.emp_no = s.emp_no 
where e.emp_no = p_emp_no;
return v_avg_salary;
end$$
delimiter ;

drop function if exists f_emp_avg_salary;
delimiter $$
create function f_emp_avg_salary (p_emp_no integer) returns decimal (10,2)
deterministic no sql reads sql data 
begin
declare v_avg_salary decimal(10,2);
begin 
declare v_avg_salary_2 decimal(10,2);
end;
select avg(s.salary)
into v_avg_salary 
from employees e
join salaries s on e.emp_no = s.emp_no 
where e.emp_no = p_emp_no;
return v_avg_salary_2; #should give na error bc variable is not in scope of function and cannot be called outside of its own begin/end black
end$$
delimiter ;

#session variables
#sessions begin when you open the work area on workbench 

set @s_var1 = 3;
select @s_var1; #returns 3, if connection were closed or new one were to open then it would return null bc it is outside the session 

#global variables 
#appky to all connections in a specific server 
#cannot set any variable as global, must be a systems variable 

set global max_conenctions = 1000;
set @@global.max_connections = 1; #prevents multiple connections from being open in a single server 
						#(if i tried to open another connection it would say that there are too many connections bc the limit was set to 1

#user-defined vs. system variables 
#ocal variables can only be user-defined, and global variables can only be sysem variables
#session variables can be either but with limitations 

set session max_connections = 1000; #gives an error, cannot work as a session variable, only global 

set session sql_mode = 'strict_trans_tables,no_zero_date,no_engine_substitution'; #sql_mode can be session or global variable 
set global sql_mode = 'strict_trans_tables,no_zero_date,no_engine_substitution';select






