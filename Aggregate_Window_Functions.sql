select sysdate();

select emp_no, salary, from_date, to_date
from salaries
where to_date > sysdate();

#make sure to get all currently employed employees, not just contracts with max end date that may have signed another contract afterwards 
select s1.emp_no, s.salary, s.from_date, s.to_date
from salaries s
	join (select emp_no, max(from_date) as from_date
		from salaries
	group by emp_no) s1 on s.emp_no = s1.emp_no
where s.to_date > sysdate()
	and s.from_date = s1.from_date;

#ensure that the salary matches the department the employee is working in for that salary 
select de.emp_no, de.dept_no, de.from_date, de.to_date
from dept_emp de
	join (select emp_no, max(from_date) as from_date
		from dept_emp
	group by emp_no) de1 on de.emp_no = de1.emp_no
where de.to_date > sysdate()
	and de.from_date = de1.from_date;

#Combine everything together 
select de2.emp_no, de.dept_no, de.from_date, de.to_date, avg(s2.salary) over w as average_salary_per_dept
from (select de.emp_no, de.dept_no, de.from_date, de.to_date
from dept_emp de
	join (select emp_no, max(from_date) as from_date
		from dept_emp
	group by emp_no) de1 on de.emp_no = de1.emp_no
where de.to_date > sysdate()
	and de.from_date = de1.from_date) de2
    join (select s1.emp_no, s.salary, s.from_date, s.to_date
from salaries s
	join (select emp_no, max(from_date) as from_date
		from salaries
	group by emp_no) s1 on s.emp_no = s1.emp_no
where s.to_date > sysdate()
	and s.from_date = s1.from_date) on s2.emp_no = de.emp_no
		join departments d on d.dept_no = de2.dept_no
group by de2.emp_no, d.dept_name
window w as (partition by de.dept_no)
order by de2.emp_no;












    
#Create a query that upon execution returns a result set containing the employee numbers, 
#contract salary values, start, and end dates of the first ever contracts that each employee signed for the company.

select s1.emp_no, s.salary, s.from_date, s.to_date
from salaries s
	join (select emp_no, min(from_date) as from_date
		from salaries
	group by emp_no) s1 on s.emp_no = s1.emp_no
where s.to_date > sysdate()
	and s.from_date = s1.from_date;