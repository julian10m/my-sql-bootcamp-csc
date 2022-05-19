select * from users
order by created_at limit 5;

select
    dayname(created_at) as day,
    count(id) as number
from users group by day
order by number desc;
    
select 
    u.id,
    u.username
from users as u
left join photos as p
    on u.id = p.user_id
where p.id is null;

select 
    users.id as user_id,
    users.username,
    photos.id as photo_id,
    photos.image_url,
    count(likes.user_id) as likes
from likes
inner join photos
    on likes.photo_id = photos.id
inner join users
    on photos.user_id = users.id
group by photos.id
order by likes desc
limit 1;

select (select count(*) from photos) 
/ (select count(*) from users) as avg;

select 
    tag_name, 
    count(*) as q_used
from tags
inner join photo_tags
    on photo_tags.tag_id = tags.id
group by tags.id
order by q_used desc
limit 5;

select
    users.username,
    count(*) as total_likes
from users
inner join likes
    on users.id = likes.user_id
group by users.id
having 
    total_likes = (select count(*) from photos)
order by total_likes desc;