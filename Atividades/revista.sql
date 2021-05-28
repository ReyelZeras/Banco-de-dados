create database Revista;

use Revista;

create table Revista (
iDRevista int primary key auto_increment, 
nome varchar(40), categoria varchar(30)

)auto_increment = 1;

insert into Revista (Nome) values 
('Forbes'), ('Veja'), ('O Globo'), ('Lance!');

select * from revista;

update Revista set categoria = 'Economia' where iDRevista = 1;
update Revista set categoria = 'Noticias' where iDRevista in (2, 3);
update Revista set categoria = 'Esportes' where iDRevista = 4;

insert into Revista (nome, categoria) values 
('Veja', 'Noticias'), ('Época', 'Noticias'), ('Recreio', 'Infantil');

desc revista; 

alter table Revista modify categoria varchar(40);

alter table Revista add periodicidade varchar(15);

alter table Revista drop periodicidade;



create table Editora(
iDEditora int primary key auto_increment, 
nomeEditora varchar(40), dataFund date

)auto_increment = 1000;

insert into Editora (nomeEditora, dataFund) values
('Abril', '1998-11-16'), ('Globo', '1950-04-3'), ('Escala', '1935-02-25');

select * from Editora;

alter table Revista add fkEditora int;
alter table Revista add foreign key(fkEditora) references Editora(iDEditora);

select * from Revista;

update revista set fkeditora = 1000 where idRevista in (1,3,2);
update revista set fkeditora = 1001 where idRevista in (6,7,8);
update revista set fkeditora = 1002 where idRevista in (4,5);


select * from Revista;

select * from Revista, Editora where fkEditora = idEditora and nomeEditora = "Abril";

select * from Revista, Editora where fkEditora = idEditora;

select * from Editora join Revista on iDEditora = fkEditora;
alias 