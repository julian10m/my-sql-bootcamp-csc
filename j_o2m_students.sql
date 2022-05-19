create database students_db;
use students_db;

create table students(
    id int auto_increment,
    first_name varchar(100),
    primary key(id)
);

create table papers(
    id int auto_increment,
    title varchar(100),
    grade int,
    student_id int not null,
    primary key(id),
    foreign key(student_id) 
        references students(id)
        on delete cascade
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select
    s.first_name as first_name,
    p.title as title,
    p.grade as grade
from papers as p
inner join students as s
    on p.student_id = s.id
order by grade desc;

select
    s.first_name as first_name,
    ifnull(p.title, 'MISSING') as title,
    ifnull(p.grade, 0) as grade
from papers as p
right join students as s
    on p.student_id = s.id
order by grade desc;

select
    s.first_name,
    ifnull(avg(p.grade), 0) as average
from students as s
left join papers as p
    on s.id = p.student_id
group by s.id
order by average desc;

select
    s.first_name,
    ifnull(avg(p.grade), 0) as average,
    case
        when avg(p.grade) >= 75 then 'PASSING'
        else 'FAILING'
    end as passing_status
from students as s
left join papers as p
    on s.id = p.student_id
group by s.id
order by average desc;


drop database students_db;