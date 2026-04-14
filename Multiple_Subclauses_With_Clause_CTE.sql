#How many female employees' highest contract salary values were higher than the all-time company salary average across all genders? 

#getting all-time avg

select avg(salary) as avg_salary
from salaries;

#getting highest salary from each female employee working in the company 
select s.emp_no, max(s.salary) as max_salary
from salaries s
	join employees e on s.emp_no = e.emp_no and gender = 'F'
group by s.emp_no;

#combining everything together 
with cte_avg_salary as ( #can't use multiple with clauses, so instead we use subclauses 
select avg(salary) as avg_salary
from salaries),
cte_f_max_salary as (
select s.emp_no, max(s.salary) as f_max_salary
from salaries s
	join employees e on s.emp_no = e.emp_no and e.gender = 'F'
group by s.emp_no)
select
sum(case when c2.f_max_salary > c1.avg_salary then 1 else 0 end) as f_highest_salaries_above_avg,
count(e.emp_no) as total_no_female_contracts,
concat(round((sum(case when c2.f_max_salary > c1.avg_salary then 1 else 0 end) / count(e.emp_no)) * 100,2),'%') as 'percentage' #makes it a percentage
from employees e 
	join cte_f_max_salary c2 on c2.emp_no = e.emp_no
    cross join cte_avg_salary c1;
    













