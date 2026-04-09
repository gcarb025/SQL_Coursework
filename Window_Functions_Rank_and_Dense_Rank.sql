#USING RANK() AND DENSE_RANK()
select emp_no, salary, row_number() over w as row_num
from salaries
where emp_no = 10001
window w as (partition by emp_no order by salary desc);

#shows number of people that have signed more than one contract of the same value 
select emp_no, (count(salary)-count(distinct salary)) as diff
from salaries
group by emp_no
having diff >0
order by emp_no;

select * from salaries 
where emp_no = 11839;

#rows 3 and 4 have the same salary value
select emp_no, salary, row_number() over w as row_num
from salaries
where emp_no = 11839
window w as (partition by emp_no order by salary desc);

#changing row_number() to rank() allows for the contracts with same salary to be ranked the same number
#increments after ranking same values as no different (goes from 3 to 5) 
select emp_no, salary, rank() over w as rank_num
from salaries
where emp_no = 11839
window w as (partition by emp_no order by salary desc);

#dense_rank() takes into account ranking and continues the same pattern (goes from 3 to 4)
select emp_no, salary, dense_rank() over w as rank_num
from salaries
where emp_no = 11839
window w as (partition by emp_no order by salary desc);

#task: Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.
select emp_no, salary, row_number() over w as rank_num
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary desc);

#Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.
SELECT dm.emp_no, (COUNT(salary)) AS no_of_salary_contracts
FROM dept_manager dm
JOIN salaries s ON dm.emp_no = s.emp_no
GROUP BY emp_no
ORDER BY emp_no;

#Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.
select emp_no, salary, rank() over w as rank_num
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary desc);

#Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.
select emp_no, salary, dense_rank() over w as rank_num
from salaries
where emp_no = 10560
window w as (partition by emp_no order by salary desc);

