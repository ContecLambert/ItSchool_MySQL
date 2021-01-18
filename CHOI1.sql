select tablespace_name, status, contents from user_tablespace;

create table star_wars (
    episode_id number(10) constraint star_wars_pk primary key,
    episode_name varchar2(50) not null,
    open_year number(10)
);

--drop table star_wars;

create table characters(
    character_id number(5) constraint characters_pk primary key,
    character_name varchar2(30) not null,
    master_id number(5),
    role_id number(5,0),
    email varchar2(40)
);

--drop table characters;

create table casting(
    episode_id number(5),
    character_id number(5),
    real_name varchar2(30),
    primary key(episode_id, character_id),
    FOREIGN key(episode_id)REFERENCES star_wars(episode_id),
    foreign key(character_id)references characters(character_id)
);

--drop table casting;

--alter table casting add constraint casting_fk1 primary key(episode_id);

--CREATE table star_wars2 as select * from star_wars where 1=0;
--alter table star_wars2 add constraint episode_id primary key(episode_id);
drop table star_wars2;

CREATE table star_wars2 as select * from star_wars;
alter table star_wars2 add primary key(episode_id);

--create table characters2 (
--    character_id number(5),
--    foreign key(character_id) references characters(character_id)
--);
drop table characters2;

create table characters2 as select * from characters  where 1=2;
alter table characters2 add foreign key(character_id) references characters(character_id);

