create database one_to_many_db;
use one_to_many_db;

create table customers(
    id int auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    email varchar(100),
    primary key(id)
);

create table orders(
    id int AUTO_INCREMENT,
    customer_id int,
    order_date date,
    amount decimal(8, 2),
    primary key(id),
    foreign key(customer_id) references customers(id) on delete cascade 
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

# INNER JOINS 
select * from customers as c
inner join orders as o 
on c.id = o.customer_id;

select 
    o.id as order_id,
    o.order_date,
    o.amount
from orders as o 
inner join customers as c 
on o.customer_id = c.id
where c.first_name = 'Boy' and c.last_name = 'George';

select 
    c.id as customer_id,
    sum(o.amount) as total_spent
from orders as o 
inner join customers as c 
on o.customer_id = c.id
group by c.id
order by total_spent desc;

# LEFT JOINS
select * from customers as c
left join orders as o 
on c.id = o.customer_id;

select 
    c.id as customer_id,
    ifnull(sum(o.amount), 0)  as total_spent
from customers as c
left join orders as o 
on c.id = o.customer_id
group by c.id
order by total_spent desc;

drop table orders;
drop table customers;
drop database one_to_many_db;