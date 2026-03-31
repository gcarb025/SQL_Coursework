select * from employees
where first_name = 'Denis' and (gender = 'M' or gender = 'F');

select * from employees
where gender = 'F' and (first_name = 'Kellie' or first_name = 'Aruna');