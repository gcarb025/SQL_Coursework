drop table customers ;

create table customers
(
	customer_id INT auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int default 0,
    primary key (customer_id)
);

drop table customers;

create table customers
(
	customer_id INT auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

alter table customers
change column number_of_complaints number_of_complaints int default 0;

insert into customers (first_name, last_name)
values ('Peter', 'Figaro')
;

select *from customers;

alter table customers
alter column number_of_complaints drop default;


create table companies 
(
	company_id varchar(255) primary key,
    company_name varchar(255) default "X",
    hq_phone_number varchar(255) unique key
);

drop table companies;