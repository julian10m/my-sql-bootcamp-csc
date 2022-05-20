drop database if exists triggers_demo;
create database triggers_demo;
use triggers_demo;

create table users(
    username varchar(100),
    age int
);

delimiter $$
create trigger must_be_adult
    before insert on users for each row
    begin
        if new.age < 18
        then
            signal sqlstate '45000'
                set message_text = 'E: Must be an adult';
        end if;
    end;
$$

delimiter ;

insert into  users values ('bobby', 23);
insert into  users values ('carla', 17);
