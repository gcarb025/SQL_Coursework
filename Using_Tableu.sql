use employees_mod;

#Task 1: Create a visualization on Tableau that provides a breakdown between the male and female employees working in the company each year, starting from 1990. 
#First, extracting the necessary data from the employees_mod database on SQL (number of employees divided by year and gender)
select 
		year(de.from_date) as calendar_year,
        e.gender,
        count(e.emp_no) as num_of_emp
from t_employees e
join t_dept_emp de 
on e.emp_no = de.emp_no
group by calendar_year, e.gender
having calendar_year >= 1990
order by calendar_year;

#Data exported as a CSV and imported into Tableau Public as a text file. Bar chart divided by gender created on platform. 


#TASK 2: Compare the number of male managers to the number of female managers from different departments for each year, starting from 1990.

select 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    case
        when year(dm.to_date) >= e.calendar_year and year(dm.from_date) <= e.calendar_year then 1
        else 0
    end as active
from
    (select 
        year(hire_date) as calendar_year
    from
        t_employees
    group by calendar_year) e
        cross join
    t_dept_manager dm
        join
    t_departments d on dm.dept_no = d.dept_no
        join 
    t_employees ee on dm.emp_no = ee.emp_no
order by dm.emp_no, calendar_year;

#TASK 3: Compare the average salary of female versus male employees in the entire company until year 2002, 
#and add a filter allowing you to see that per each department.

select 
	e.gender, 
    d.dept_name, 
    round(avg(salary),2) as salary, 
    year(s.from_date) as calendar_year
emp_nothe
    group by d.dept_no, e.gender, calendar_year
    having calendar_year <= 2002
    order by d.dept_no;
    
#TASK 4:Create an SQL stored procedure that will allow you to obtain the average male and female salary per department within a 
#certain salary range. Let this range be defined by two values the user can insert when calling the procedure.
 
DELIMITER $$
CREATE PROCEDURE filter_salary (IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN
SELECT 
    e.gender, d.dept_name, AVG(s.salary) as avg_salary
FROM
    t_salaries s
        JOIN
    t_employees e ON s.emp_no = e.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d ON d.dept_no = de.dept_no
    WHERE s.salary BETWEEN p_min_salary AND p_max_salary
GROUP BY d.dept_no, e.gender;
END$$

DELIMITER ;

CALL filter_salary(50000, 90000);


