create database shirts_db;
use shirts_db;

create table shirts(
    shirt_id int auto_increment,
    article varchar(100) not null,
    color varchar(20) not null,
    shirt_size varchar(4) not null,
    last_worn int not null,
    primary key(shirt_id)
);

# +-------+--------------+------+-----+---------+----------------+
# | Field | Type         | Null | Key | Default | Extra          |
# +-------+--------------+------+-----+---------+----------------+
# | id    | int(11)      | NO   | PRI | NULL    | auto_increment |
# | name  | varchar(100) | YES  |     | NULL    |                |
# | breed | varchar(100) | YES  |     | NULL    |                |
# | age   | int(11)      | YES  |     | NULL    |                |
# +-------+--------------+------+-----+---------+----------------+

insert into shirts(article, color, shirt_size, last_worn)
values
    ('t-shirt', 'white', 'S', 10),
    ('t-shirt', 'green', 'S', 200),
    ('polo shirt', 'black', 'M', 10),
    ('tank top', 'blue', 'S', 50),
    ('t-shirt', 'pink', 'S', 0),
    ('polo shirt', 'red', 'M', 5),
    ('tank top', 'white', 'S', 200),
    ('tank top', 'blue', 'M', 15);
    
insert into shirts(article, color, shirt_size, last_worn) 
values
    ('polo shirt', 'purple', 'M', 50);
 
# +----------+------------+--------+------------+-----------+
# | shirt_id | article    | color  | shirt_size | last_worn |
# +----------+------------+--------+------------+-----------+
# |        1 | t-shirt    | white  | S          |        10 |
# |        2 | t-shirt    | green  | S          |       200 |
# |        3 | polo shirt | black  | M          |        10 |
# |        4 | tank top   | blue   | S          |        50 |
# |        5 | t-shirt    | pink   | S          |         0 |
# |        6 | polo shirt | red    | M          |         5 |
# |        7 | tank top   | white  | S          |       200 |
# |        8 | tank top   | blue   | M          |        15 |
# |        9 | polo shirt | purple | M          |        50 |
# +----------+------------+--------+------------+-----------+

select article, color from shirts;
select article, color, shirt_size, last_worn 
from shirts where shirt_size = 'M';

update shirts set shirt_size = 'L'
where article = 'polo shirt';
update shirts set last_worn = 0
where shirt_id = 8;
update shirts 
set 
    shirt_size = 'XS', 
    color = 'off white'
where 
    color = 'white';
select * from shirts;

delete from shirts where last_worn = 200;
select * from shirts;
delete from shirts where article = 'tank top';
select * from shirts;
delete from shirts;
select * from shirts;

drop table shirts;
drop database shirts_db;