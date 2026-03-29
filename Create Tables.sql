CREATE table Sales 
(
	purchase_number int auto_increment,
    date_of_purchase date,
    customer_id int,
    item_code varchar(10),
primary key (purchase_number)
);

alter table sales 
add foreign key (customer_id) references customers(customer_id) on delete cascade;

create table Customers
(
	customer_id INT,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

CREATE TABLE  Items
(
	item_code varchar(255),
	item varchar(255),
    unit_price NUMERIC(10,2) ,
    company_id VARCHAR(255),
    primary key (item_code)
);

CREATE TABLE Companies 
(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number int(12),
    primary key (company_id)
);


