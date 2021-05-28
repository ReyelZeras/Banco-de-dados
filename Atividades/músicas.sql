create database Musica;

use Musica;

create table Musica(
idMusica int primary key, título varchar(40),
artista varchar(40), genero varchar(40) 


);

insert into Musica values (1, 'Fifa', 'Lagum', 'Rock'), (2, 'Fale mais', 'Lagum', 'Rock'), (3, 'Tempo Perdido', 'Legião Urbana', 'Rock'),
 (4, 'Location', 'Khalid', 'Indie'), (5, 'The Greatest Show', 'Panic! At The Disco', 'Indie'),
 (6, 'Cant Help Falling in Love', 'Elvis Presley', 'Rock'), (7, 'Girassóis de Van Gogh', 'Bacu Exu do Blues', 'Rap'), (8, 'Egóico', 'Sagaz', 'Rap');

select * from Musica; -- a --

select título, artista from Musica; -- b --

select * from Musica where genero = 'Rock'; -- c --

select * from Musica where artista = 'Lagum'; -- d -- 

select * from Musica order by título; -- e -- 

select * from Musica order by artista desc; -- f --

select * from Musica where título like 'T%'; -- g -- 

select * from Musica where artista like '%m'; -- h -- 

select * from Musica where genero like '_o%'; -- i --

select * from Musica where título like '%d_'; -- j --

drop table Musica; -- k --
