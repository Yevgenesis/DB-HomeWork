create table videos (
                        id int,
                        created_at timestamp,
                        author_id int,
                        title varchar(64),
                        duration_secs int
);

insert into videos  (id, created_at, author_id, title, duration_secs)
values (1, now(), 1, 'Super video', 12345),
       (2, now(), 1, 'Super video2', 54321);

update videos set title = 'New title'
WHERE id = 2;

delete from videos where id=2;

select u.user_name, v.title
from users u
join videos v on u.id = v.author_id;




