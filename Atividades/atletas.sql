create database Atleta;

use Atleta;

create table Atletas(
idAtleta int primary key,
nome varchar(40), modalidade varchar(40), 
qtdMedalhas int

);


insert into Atletas values (1, 'Usain Bolt', 'Atletismo', 8), (2, 'Ray Ewry', 'Saltos sem impulso', 8), 
(3, 'Matt Biondi', 'Natação', 11), (4, 'Jenny Thompson', 'Ginástica Artística', 12),
(5, 'Sawao Kato', 'Ginástica Artística', 12), (6, 'Birgit Fischer', 'Canoagem', 12), 
(7, 'Carl Lewis', 'Atletismo', 10), (8, 'Mark Spitz', 'Natação', 11),
(9, 'Larysa Latynina', 'Ginástica Artística', 18), (10, 'Michael Phelps', 'Natação', 28);

select * from Atletas;

select nome, qtdMedalhas from Atletas;

select * from Atletas where modalidade = 'natação';


select * from Atletas order by modalidade;

select * from Atletas order by modalidade desc;

select * from Atletas where nome like '%w%';

select * from Atletas where nome like 'M%';

select * from Atletas where nome like '%n';


select * from Atletas where nome like '%r_';


drop table Atletas;



