create database app_db;
use app_db;

create table employees(
    id int auto_increment,
    last_name varchar(20) not null,
    first_name varchar(20) not null,
    middle_name varchar(20),
    age int not null,
    current_status varchar(20) not null default 'employed',
    primary key(id)
);

insert into employees(last_name, first_name, age) 
values 
    ('Cartas', 'Pedro', 40),
    ('Mora', 'Analia', 20);
    
insert into employees(last_name, first_name, middle_name, age) 
values ('Shu', 'Cho', 'Ko', 24);

insert into employees(last_name, first_name, middle_name, age, current_status) 
values ('Untz', 'Martin', 'James', 32, 'unemployed');

desc employees;
select * from employees;

drop table employees;
drop database app_db;