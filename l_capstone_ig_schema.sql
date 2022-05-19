create database ig_db;
use ig_db;

create table users(
    id int AUTO_INCREMENT,
    username varchar(100) unique not null,
    created_at timestamp default now(),
    primary key(id)
);

create table photos(
    id int AUTO_INCREMENT,
    image_url varchar(200) not null,
    user_id int not null,
    created_at timestamp default now(),
    primary key(id),
    FOREIGN key(user_id) 
        REFERENCES users(id)
        on delete cascade
);

create table comments(
    id int AUTO_INCREMENT,
    comment_text varchar(200) not null,
    created_at timestamp default now(),
    user_id int not null,
    photo_id int not null,
    primary key(id),
    FOREIGN key(user_id) 
        REFERENCES users(id)
        on delete cascade,
    FOREIGN key(photo_id)
        REFERENCES photos(id)
        on delete cascade
);

create table likes(
    photo_id int not null,
    user_id int not null,
    created_at timestamp default now(),
    foreign key(user_id) 
        REFERENCES users(id)
        on delete cascade,
    foreign key(photo_id)
        references photos(id)
        on delete cascade,
    primary key(photo_id, user_id)
);

create table follows(
    follower_id int not null,
    followee_id int not null,
    created_at timestamp default now(),
    foreign key(follower_id) 
        references users(id)
        on delete cascade,
    foreign key(followee_id) 
        references users(id)
        on delete cascade,
    primary key(follower_id, followee_id)
);

create table tags(
    id int AUTO_INCREMENT,
    tag_name varchar(100) unique,
    primary key(id)
);

create table photo_tags(
    photo_id int not null,
    tag_id int not null,
    foreign key(photo_id)
        references photos(id)
        on delete cascade,
    foreign key(tag_id)
        references tags(id)
        on delete cascade,
    primary key(photo_id, tag_id)
);

insert into users(username) VALUES 
('BlueTheCat'), 
('CharlieBrown'), 
('ColtSteele');

insert into photos(image_url, user_id) VALUES 
('/dsada', 1),
('/rrrtta', 2),
('/htthth', 2);

insert into comments(comment_text, user_id, photo_id) VALUES
('Meow!', 1, 2),
('Amazing shot', 3, 2),
('I <3 this!', 2, 1);

insert into likes(user_id, photo_id) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(3, 3);

insert into follows(follower_id, followee_id) values
(1, 2),
(1, 3),
(3, 1),
(2, 3);

insert into tags(tag_name) values
('adorable'),
('cute'),
('sunrise');

insert into photo_tags(photo_id, tag_id) values
(1, 1),
(1, 2),
(2, 3),
(3, 2);

select * from users;
select * from photos;
select * from comments;
select * from likes; 
select * from follows; 
select * from tags;
select * from photo_tags;

drop database ig_db;