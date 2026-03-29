create table diego_is_annoying
(
	id int primary key, 
    number_of_gf int, 
    girlfriend_ids varchar(25)
    );
    
create table girlfriends 
(
	girlfriend_ids int auto_increment primary key,
    gf_name varchar(25),
    age int, 
    foreign key (girlfriend_ids) references diego_is_anoying(girlfriend_ids)
);