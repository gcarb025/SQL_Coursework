#find the average salary of all men and all women in the company 
select e.gender, avg(s.salary) as average_salary
from employees e
join salaries s on e.emp_no = s.emp_no
group by gender;

select e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
from employees e
join dept_manager m on e.emp_no = m.emp_no
join departments d on m.dept_no = d.dept_no;

select e.first_name, e.last_name, e.hire_date, m.from_date, d.dept_name
from employees e
join dept_manager m on e.emp_no = m.emp_no
join departments d on m.dept_no = d.dept_no;

SELECT e.first_name,e.last_name,e.hire_date,t.title, m.from_date,d.dept_name
FROM employees e
JOIN dept_manager m ON e.emp_no = m.emp_no
JOIN departments d ON m.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

select d.dept_name, avg(s.salary) as average_salary
from departments d
join dept_manager m on d.dept_no = m.dept_no
join salaries s on m.emp_no = s.emp_no
group by d.dept_name #group by clause must be included to run query 
having average_salary > 60000 #having is "where" for group by
order by d.dept_no; # can be ordered by department name even if it's not explicitly included in query/results table

select e.gender, count(m.emp_no) as gender_count 
from employees e 
join dept_manager m on e.emp_no = m.emp_no
group by gender;
