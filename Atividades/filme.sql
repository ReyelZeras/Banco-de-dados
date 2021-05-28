create database Filme;

use filme;

create table filmes(
idFilme int primary key,
título varchar(50),
gênero varchar(50),
diretor varchar(50)


);

insert into filmes values (1, '500 dias com ela', 'Romance', 'Mark Webb');
insert into filmes (idFilme, título) values (2, 'Questão de tempo');
insert into filmes (idFilme, título) values (3, 'La la Land'), (4, 'Intersrtellar'), (5, 'Get out');

select * from filmes;

select * from filmes where idFilme = 2; -- igual --
select * from filmes where idFilme >= 2; -- maior igual --
select * from filmes where idFilme <> 2; -- diferente --
select * from filmes where título like 'L%'; -- encontra dados que começam com determinada letra --
select * from filmes where título like '%a'; -- encontra dados que terminam com determinada letra --
select * from filmes where título like '%a%'; -- encontra dados que possuam determinada letra no meio --
select * from filmes where título like '_a%'; -- encontra dados que a segunda letra seja determinada --
select * from filmes where título like '__t%'; -- encontra dados que a terceira letra seja determinada --
update filmes SET título = 'Us' where idFilme = '5';

select * from filmes;

update filmes SET gênero = 'Romance', diretor = 'Richard Curtis' where idFilme = '2'; -- atualizar dados -- 
update filmes SET gênero = 'Romance', diretor = 'Damian Chazelle' where idFilme = '3';
update filmes SET gênero = 'Ficção', diretor = 'Christopher Nolan' where idFilme = '4';
update filmes SET gênero = 'Terror', diretor = 'Jordan Peele' where idFilme = '5';

insert filmes values (6, 'Doctor Strange', 'Ação', 'Scott Derrickson');

delete from filmes where idFilme = '6'; -- apaga determinado dado --

drop table filme;

update filmes set diretor = 'Damien Chazelle' where idFilme in (3, 6); -- 
update filmes set diretor = 'mark webb' where idFilme = 3 or idFilme = 6;

insert filmes values (6, 'Doctor Strange', 'Ação', 'Scott Derrickson'), (7, 'Get Out', 'Terror', 'Jordan Peel'), (8, 'Guardiões da Gálaxia', 'Ação', 'James Gunn');

select * from filmes;

alter table filmes add ano int;

update filmes set ano = 2016 where idFilme in (3, 6);
update filmes set ano = 2009 where idFilme = 1;
update filmes set ano = 2014 where idFilme in (4, 8);
update filmes set ano = 2019 where idFilme = 5;
update filmes set ano = 2017 where idFilme = 7;
update filmes set ano = 2013 where idFilme = 2;

alter table filmes modify título varchar(72); -- altera algum campo-- 

desc filmes; -- mostra os campos -- 
describe filmes;

select * from filmes;

alter table filmes drop ano; -- exlcuir coluna --

select * from filmes order by título desc; -- ordenar a ordem que aparece (desc pra inverter)--
