select first_name from employees; 

select first_name from employees
group by first_name; 

select first_name, count(first_name) from employees
group by first_name; 

#including the column you're grouping by in the "select" allows it to show 
# up in the results table 


select first_name, count(first_name) from employees
group by first_name
order by first_name desc; 

# flow is important: select, then from, then, where, then group by, then order by
# not all have to be present every time but it's important to keep this order 