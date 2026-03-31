# % sign is a sub for a sequence of characters
# _ is a sub for a single character

select * from employees 
where first_name like ('Mar%');

select * from employees 
where first_name like ('%ar');

select * from employees 
where first_name like ('%ar%');

select * from employees 
where first_name like ('Mar_');

select * from employees 
where first_name like ('Mark%');

select * from employees 
where hire_date like ('%2000%');

select * from employees 
where emp_no like ('1000_');

