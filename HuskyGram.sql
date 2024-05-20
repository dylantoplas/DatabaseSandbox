drop database if exists HuskyGram;
Create database if not exists HuskyGram;

USE HuskyGram;

drop table if exists users;
create table if not exists users (
    username varchar(255) unique not null,
    created_at datetime,
    id int,
    primary key (id)
);

drop table if exists follows;
create table if not exists follows (
    created_at datetime,
    follower_id int,
    followee_id int,
    primary key (follower_id, followee_id),
    foreign key (follower_id) references users(id),
    foreign key (followee_id) references users(id)
);

drop table if exists photos;
create table if not exists photos (
    image_url varchar(255) not null,
    user_id int not null,
    created_at datetime,
    id int primary key,
    foreign key (user_id) references users(id)

);

drop table if exists tags;
create table if not exists tags (
    tag_name varchar(255) unique,
    created_at datetime,
    id int primary key
);

drop table if exists photo_tags;
create table if not exists photo_tags (
    photo_id int,
    tag_id int,
    primary key (photo_id, tag_id),
    foreign key (photo_id) references photos(id),
    foreign key (tag_id) references tags(id)
);

drop table if exists likes;
create table if not exists likes
(
    created_at datetime,
    user_id    int,
    photo_id   int,
    primary key (user_id, photo_id),
    foreign key (user_id) references users (id),
    foreign key (photo_id) references photos (id)
);

drop table if exists comments;
create table if not exists comments (
    comment_text varchar(255) not null,
    user_id int not null,
    photo_id int not null,
    created_at datetime,
    id int primary key,
    foreign key (user_id) references users (id),
    foreign key (photo_id) references photos (id)
);

insert into users values ('dylan', '2012-12-20-20-21-40', 20),
                         ('milo', '2014-12-06-20-21-40', 30);

insert into follows values ('2015-12-20-20-21-40', 20, 30),
                         ('2015-12-06-20-21-40', 30, 20);

insert into photos values ('photo1.com', 20,'2012-12-20-20-21-40', 200),
                         ('photo2.com', 30, '2014-12-06-20-21-40', 300);

insert into tags values ('milo', '2012-12-20-20-21-40', 21),
                         ('dylan', '2014-12-06-20-21-40', 31);

insert into photo_tags values (200, 21),
                         (300, 31);

insert into likes values ('2022-12-20 20:21:40', 20, 200)
, ('2023-12-06-20-21-40', 30, 300);

insert into comments values ('nice', 20, 300, NOW(), 22),
                            ('cool', 30, 200, NOW(), 32);
