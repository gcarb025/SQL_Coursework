select first_name, count(first_name) as names_count from employees
group by first_name
order by first_name; 

#aliases are used to rename a selection in a query, uses "as" 

select salary, count(emp_no) as emps_with_same_salary from salaries
where salary > 80000
group by salary
order by salary;