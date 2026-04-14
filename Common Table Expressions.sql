#How many salary contracts signed by female employees have been valued above the all-time average contract salary value of the company? 


with cte as (
select avg(salary) as avg_salary from salaries)
select
sum(case when s.salary > c.avg_salary then 1 else 0 end) as no_f_salaries_above_avg,
count(s.salary) as total_no_salary_contracts
from salaries s 
	join employees e on s.emp_no = e.emp_no and e.gender = 'F'
    cross join cte c;
    
#alternative answer 
with cte as (
select avg(salary) as avg_salary from salaries)
select
sum(case when s.salary > c.avg_salary then 1 else 0 end) as no_f_salaries_above_avg_w_sum,
count(case when s.salary > c.avg.salary then s.salary else null end) as no_f_salaries_above_avg_w_count,
count(s.salary) as total_no_salary_contracts
from salaries s 
	join employees e on s.emp_no = e.emp_no and e.gender = 'F'
    cross join cte c;
    
    
#task: Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement 
#in a query to find out how many salary contracts signed by male employees had a salary value below or equal to the all-time company average.

with cte as (
select avg(salary) as avg_salary from salaries)
select
sum(case when s.salary < c.avg_salary then 1 else 0 end) as no_m_salaries_below_avg,
count(s.salary) as total_no_salary_contracts
from salaries s 
	join employees e on s.emp_no = e.emp_no and e.gender = 'M'
    cross join cte c;
    
#Use a CTE (a Common Table Expression) and at least one COUNT() function in the SELECT statement of a query 
#to determine how many salary contracts signed by male employees had a salary value below or equal to the all-time company salary average.

with cte as (
select avg(salary) as avg_salary from salaries)
select
sum(case when s.salary < c.avg_salary then 1 else 0 end) as no_m_salaries_below_avg_w_sum,
count(case when s.salary < c.avg_salary then s.salary else null end) as no_m_salaries_below_avg_w_count,
count(s.salary) as total_no_salary_contracts
from salaries s 
	join employees e on s.emp_no = e.emp_no and e.gender = 'M'
    cross join cte c;
    
#referring to CTEs in a With Clause 
#only previously defined CTEs can be referenced 
with emp_hired_from_jan_2000 as (
	select * from employees where hire_date > '2001-01-01'),
highest_contract_salary_values as (
	select e.emp_no, max(s.salary) 
	from salaries s join emp_hired_from_jan_2000 e on e.emp_no = s.emp_no group by e.emp_no)
select * from highest_contract_salary_values;


    
    
