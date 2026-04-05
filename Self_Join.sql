select * from emp_manager
order by emp_manager.emp_no;

select e1.* from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;

select distinct e1.* from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no;

select e1.* from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no
where e2.emp_no in (select manager_no from emp_manager);