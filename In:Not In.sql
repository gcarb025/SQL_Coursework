select * from employees 
where first_name = 'Cathie' or first_name = 'Mark' or first_name = 'Nathan';

select * from employees 
where first_name in ('Cathie','Mark','Nathan');

select * from employees 
where first_name not in ('Cathie','Mark','Nathan');

select * from employees 
where first_name in ('Denis','Elvis');

select * from employees 
where first_name not in ('John','Mark','Jacob');