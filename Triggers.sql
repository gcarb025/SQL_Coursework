delimiter $$

CREATE TRIGGER trig_ins_dept_mng
AFTER INSERT ON dept_manager
FOR EACH ROW
BEGIN
	DECLARE v_curr_salary int;
    
    SELECT 
		MAX(salary)
	INTO v_curr_salary FROM
		salaries
	WHERE
		emp_no = NEW.emp_no;

	IF v_curr_salary IS NOT NULL THEN
		UPDATE salaries 
		SET 
			to_date = SYSDATE()
		WHERE
			emp_no = NEW.emp_no and to_date = NEW.to_date;

		INSERT INTO salaries 
			VALUES (NEW.emp_no, v_curr_salary + 20000, NEW.from_date, NEW.to_date);
    END IF;
END $$


create trigger check_hire_date
after insert on employees
for each row 
begin 
	declare v_curr_hire_date date;
    
    if new.hire_date > date_format(sysdate(), '%Y-%m-%d') then 
        set hire_date = date_format(sysdate(), '%Y-%m-%d');
        
	end if;
end$$

delimiter ; 
    
INSERT employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2027-01-01');  

SELECT  * from employee
ORDER BY emp_no DESC;
    
    
    
    
    
    
