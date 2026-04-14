#Task: Obtain a list containing the highest contract salary values signed by all F employees who have worked in the company 

#Temporary tables are only valid within the scope of a SQL session and not beyond 

create temporary table f_highest_salaries
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'F'
group by s.emp_no; 

select * from f_highest_salaries;

select * from f_highest_salaries
where emp_no <= 10010;

drop table if exists f_highest_salaries;

#Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
create temporary table male_max_salaries
select s.emp_no, max(s.salary) as m_highest_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'M'
group by s.emp_no; 

#Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries 
#temporary table you created in the previous exercise.

select * from male_max_salaries;

#Other Features of Temporary Tables 
#Temp tables can only be invoked once, ie cannot be used in self-joins nor with a union or union al operators 
	#workaround requires using a CTE

create temporary table f_highest_salaries
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'F'
group by s.emp_no
limit 10; 

#make the second one a cte so they can be joined as if they were a self-join 
with cte as (
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'F'
group by s.emp_no
limit 10)
select * from f_highest_salaries c1 join cte c;

#same case for union all 
#should give 20 rows as you are combining 2 sets of 10 rows 
with cte as (
select s.emp_no, max(s.salary) as f_highest_salary
from salaries s 
join employees e on e.emp_no = s.emp_no and e.gender = 'F'
group by s.emp_no
limit 10)
select * from f_highest_salaries c1 union all select * from cte;

#workaround does not always work, such as in this example 
create temporary table dates 
select 
	now() as current_date_and_time,
	date_sub(now(),interval 1 month) as a_month_earlier,
	date_sub(now(), interval -1 year) as one_year_later;
    
select * from dates;

#both queries will provide an error saying "can't reopen table: 'd1'"
select * from dates d1 
join dates d2;

select * from dates d1
union select * from dates d2;

#trying the workaround
with cte as (
select 
	now() as current_date_and_time,
	date_sub(now(),interval 1 month) as a_month_earlier,
	date_sub(now(), interval -1 year) as one_year_later)
select * from dates d1 join cte c;

with cte as (
select 
	now() as current_date_and_time,
	date_sub(now(),interval 1 month) as a_month_earlier,
	date_sub(now(), interval -1 year) as one_year_later)
select * from dates d1 union all select * from cte c;

#cleaning up work 
drop table if exists f_highest_salaries;
drop temporary table if exists dates;

