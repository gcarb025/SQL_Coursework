

select emp_no, first_name, last_name, 
case 
	when gender = 'M' then 'Male'
    else 'Female'
end as gender
from employees;

select emp_no, first_name, last_name, 
case gender # does not work with is null/is not null comparisons 
	when 'M' then 'Male'
    else 'Female'
end as gender
from employees;

select e.emp_no, e.first_name, e.last_name,
case 
	when dm.emp_no is not null then 'Manager'
    else 'Employee'
end as is_manager
from employees e
left join dept_manager dm on dm.emp_no = e.emp_no 
where e.emp_no > 109990;

select emp_no, first_name, last_name,
if (gender = 'M', 'Male', 'Female') as gender #if the first value is true then the second value is returned, if it's false the third value is returned 
from employees;

# if only has one conditional statements, case can use multiple 

select e.emp_no, e.first_name, e.last_name,
max(s.salary) - min(s.salary) as salary_difference, 
case 
	when max(s.salary) - min(s.salary) > 30000 then 'Salary raised by more than $30,000'
    when max(s.salary) - min(s.salary) between 20000 and 30000 then 'Salary raised between $20,000 and $30,000'
    else 'Salary raised by less than $20,000'
end as salary_increase
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no 
group by s.emp_no;

#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column, called “current_employee” saying 
#“Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.

SELECT e.emp_no, e.first_name, e.last_name,
CASE
	WHEN MAX(de.to_date) > SYSDATE() THEN 'Is still employed'
	ELSE 'Not an employee anymore'
END AS current_employee
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
GROUP BY de.emp_no
LIMIT 100;

