 select 
     date_format(min(created_at), '%M %D %Y') as earliest_date 
from users;

select * from users 
where 
    created_at = (select min(created_at) from users);
    
select
    monthname(created_at) as month,
    ifnull(count(email), 0) as count
from users
group by month
order by count desc;

select
    count(*) as yahoo_users
from users where email like '%@yahoo.com%';

select 
    case
        when email like '%@gmail.com%' then 'gmail'
        when email like '%@yahoo.com%' then 'yahoo'
        when email like '%@hotmail.com%' then 'hotmail'
        else 'other'
    end as provider,
    count(*) as total_users
from users
group by provider
order by total_users desc;
