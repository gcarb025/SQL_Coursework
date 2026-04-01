select * from employees
order by first_name;

#ASC = "ascending" lowest to highest, default 
#DESC = "descending highest to lowest 

select * from employees
order by first_name ASC;

select * from employees
order by first_name DESC;

# can order by multiple fields alter

select * from employees
order by first_name, last_name ASC;

select * from employees
order by hire_date DESC;