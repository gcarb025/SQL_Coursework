#Using ranking window functions and joins together 

select d.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	rank() over w as department_salary_ranking, 
    s.salary, 
    s.from_date as salary_from_date, 
    s.to_date as dalary_to_date,
    dm.from_date as dept_manager_from_date,
    dm.to_date as dept_manager_to_date
from dept_manager dm
	join salaries s on s.emp_no = dm.emp_no
	join dempartments d on d.dept_no = dm.dept_no
window w as (partition by dm.dept_no order by s.salary desc);
#stopping here looks like it gives us what we're looking for, but it includes salaries of contracts of the managers when they weren't managers 


select d.dept_no, 
	d.dept_name, 
	dm.emp_no, 
	rank() over w as department_salary_ranking, 
    s.salary, 
    s.from_date as salary_from_date, 
    s.to_date as dalary_to_date,
    dm.from_date as dept_manager_from_date,
    dm.to_date as dept_manager_to_date
from dept_manager dm
	join salaries s on s.emp_no = dm.emp_no
		and s.from_date between dm.from_date and dm.to_date #drops rows that have salaries outside of the manager datr range 
        and s.to_date between dm.from_date and dm.to_date
	join dempartments d on d.dept_no = dm.dept_no
window w as (partition by dm.dept_no order by s.salary desc);

#Write a query that ranks the salary values in descending order of all contracts signed by employees numbered between 10500 and 10600 inclusive. 
#Let equal salary values for one and the same employee bear the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.
select 
	e.emp_no,
    s.salary,
    rank() over w as employee_salary_ranking
from employees e 
	join salaries s on s.emp_no = e.emp_no 
where e.emp_no between 10500 and 10600
window w as (partition by e.emp_no order by s.salary desc);

#Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:
# -contracts that have been signed by employees numbered between 10500 and 10600 inclusive.
# -contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.
#In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.
select 
	e.emp_no,
    s.salary,
    dense_rank() over w as employee_salary_ranking,
    e.hire_date,
    s.from_date,
    (YEAR(s.from_date) - YEAR(e.hire_date)) AS years_from_start
from employees e 
	join salaries s on s.emp_no = e.emp_no 
		and year(s.from_date) - year(e.hire_date) >= 5
where e.emp_no between 10500 and 10600
window w as (partition by e.emp_no order by s.salary desc);    
    
    
    
    