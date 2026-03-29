
create table Customers
(
	customer_id INT auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

alter table customers
add column gender enum("M","F")AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0)
;