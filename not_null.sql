
create table companies
(
	company_id int auto_increment,
    hq_phone_number varchar(255),
    company_name varchar(255) not null,
    primary key (company_id)
);

alter table companies 
modify company_name varchar(255) null;

alter table companies
change column company_name company_name varchar(255) not null;

insert into companies (hq_phone_number,company_name)
values ('+1 (123) 456-7890)', 'Company A')
;