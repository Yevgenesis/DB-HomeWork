create table comments
(
    id         int,
    created_at timestamp,
    author_id  int,
    content    text,
    video_id   int
);

create table reactions
(
    id         int,
    created_at timestamp,
    author_id  int,
    value    int,
    video_id   int

);

insert into comments (id,created_at,author_id,content,video_id)
values
    (1,now(),2,'coll video', 34),
    (2,now(),2,'Like!', 7);

insert into reactions(id,created_at,author_id,value,video_id)
values
    (1,now(),2,1,34),
    (1,now(),2,0,3);

