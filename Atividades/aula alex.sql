create database facul;

use facul;

create table Aluno(
iDAluno int primary key auto_increment,
nome varchar(45),
telefone varchar(12)
);

insert into Aluno values 
(null, 'Felipe', 957478654),
(null, 'Fernando', 957464787),
(null, 'Gustavo', 955645454),
(null, 'Bruno', 926899795),
(null, 'Caio', 946546554);


select * from Aluno;

create table Disciplina(
iDDisciplina int primary key auto_increment,
nome varchar(45),
CargaHoraria int
);

insert into Disciplina values 
(null, 'Algoritmos', 10),
(null, 'Arquitetura Computacional', 5),
(null, 'Banco de Dados', 5),
(null, 'Desenvolvimento Socioemocional', 5),
(null, 'Pesquina e Inovação', 5),
(null, 'Tecnologia da Informação', 5);

select * from Disciplina;

Create table Turma(
iDTurma int primary key auto_increment,
Nome varchar(45),
Nota decimal,
FkAluno int,
foreign key (FkAluno) references Aluno(iDAluno),
FkDisciplina int,
foreign key (FkDisciplina) references Disciplina(iDDisciplina)

);

drop table Turma;

insert into Turma values 
(null, 'ADS A', 9.9, 2, ),

