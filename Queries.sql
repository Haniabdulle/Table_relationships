insert into blogger (username, password, name, created_at, email)
values ('hani_abdulle', '1024', 'Hani', '2022-10-24', 'hani@email.com'),
('said_abdulle', '0805', 'Said', '2022-10-24', 'said@email.com'),
('siham_abdulle', '0516', 'Siham', '2022-10-24', 'siham@email.com');

insert into blog_post (blogger_id, title, content, created_at)
values (1, 'Title number one', 'Hello Im one', '2022-10-24'),
(1, 'Title number two', 'Hello Im two', '2022-10-24'),
(2, 'Title number three', 'Hello Im three', '2022-10-24'),
(2, 'Title number four', 'Hello Im four', '2022-10-24'),
(3, 'Title number five', 'Hello Im five', '2022-10-24'),
(3, 'Title  number six', 'Hello Im six', '2022-10-24');

insert into blog_post_comment (blogger_id, blog_post_id, content, created_at)
values (3, 1, 'Number three here bla bla bla', '2022-10-24'),
(2, 3, 'Number two here bla bla bla', '2022-10-24'),
(1, 5, 'Number one here bla bla bla', '2022-10-24');

insert into blog_post_comment (blogger_id, blog_post_id, content, created_at)
values (3, 1, 'Number three here bla bla bla', '2022-10-24'),
(3, 1, 'Number three here bla bla bla', '2022-10-24');

select blogger.name from blogger where created_at >= '2020-01-01';

update blogger set password = 'bad_password' where password = 'pass';

select bp.content, bp.title, b.username from blogger b inner join blog_post bp on b.id = bp.blogger_id;

select b.username, bp.title, bpc.content from blog_post_comment bpc
inner join blogger b on b.id = bpc.blogger_id
inner join blog_post bp on bpc.blog_post_id = bp.id; 

delete from blog_post_comment where content = 'delete me';

select count(bpc.blog_post_id),  b.username, bp.content, bp.title from blog_post bp 
inner join blog_post_comment bpc on bpc.blog_post_id = bp.id 
inner join blogger b on bp.blogger_id = b.id
group by bpc.blog_post_id having count(bpc.blog_post_id) >= 3;



