create database Times;

use Times;

create table Times(
idTime int primary key, nome varchar(40),
títulos int, ídolo varchar(40)

);

insert into Times values (1, 'Santos', 305, 'Pelé'), (2, 'Real Madrid', 92, 'Cristiano Ronaldo'), 
(3, 'Juventus', 51, 'Nedved');

select * from Times;

select nome, ídolo from Times;

select * from Times where ídolo like '%d';

insert Times values (4, 'Borussia Dortmund', 24, 'Reus'), (5, 'Spurs', 24, 'Heung-Min Son');

update Times set ídolo = 'Pelé' where idTime = 1;

alter table Times add Fundação int;

update Times set Fundação = 1912 where idTime = 1;

select ídolo from Times where nome like '%a%';

desc Times;

alter table TImes modify nome varchar(40) not null;

insert Times values (6, 'Barcelona', 90, 'Messi', 1900), (7, 'São Paulo', 300, 'Rogério Ceni', 1935);


