create database cats_app;
use cats_app;

create table cats(
    id int auto_increment,
    name varchar(100),
    breed varchar(100),
    age int,
    primary key(id)
);

# +-------+--------------+------+-----+---------+----------------+
# | Field | Type         | Null | Key | Default | Extra          |
# +-------+--------------+------+-----+---------+----------------+
# | id    | int(11)      | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(100) | YES  |     | NULL    |                |
# | breed | varchar(100) | YES  |     | NULL    |                |
# | age   | int(11)      | YES  |     | NULL    |                |
# +-------+--------------+------+-----+---------+----------------+

insert into cats(name, breed, age) 
values ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);

# +----+----------------+------------+------+
# | id | name           | breed      | age  |
# +----+----------------+------------+------+
# |  1 | Ringo          | Tabby      |    4 |
# |  2 | Cindy          | Maine Coon |   10 |
# |  3 | Dumbledore     | Maine Coon |   11 |
# |  4 | Egg            | Persian    |    4 |
# |  5 | Misty          | Tabby      |   13 |
# |  6 | George Michael | Ragdoll    |    9 |
# |  7 | Jackson        | Sphynx     |    7 |
# +----+----------------+------------+------+

select id from cats;
select name, breed from cats;
select name, age from cats where breed = 'Tabby';
select * from cats where id = age;

update cats set name = 'Jack'
where id = 7;
update cats set breed = 'British Shorthair'
where id = 1;
update cats set age = 12
where breed = 'Maine Coon';
select * from cats;

delete from cats where age = 4;
delete from cats where age = id;
select * from cats;

drop table cats;
drop database cats_app;