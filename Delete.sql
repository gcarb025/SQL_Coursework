use employees; 
commit;

select * from employees 
where emp_no = 999903;

delete from employees 
where emp_no = 999903;

rollback;