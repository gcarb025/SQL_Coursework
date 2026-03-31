# <> and != are "not equal"
# >, < is greater and less than, respectively 
# >=, <= is greater and less than or equal to, respectively 


select * from employees 
where first_name != 'Mark';

select * from employees 
where hire_date > '2000-01-01';

select * from employees
where hire_date >= '2000-01-01' and gender = 'F';

select * from salaries 
where salary > 150000;