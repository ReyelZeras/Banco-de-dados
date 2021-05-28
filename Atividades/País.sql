use faculdade;


-- 1 --

create table País (
	iDPais int primary key auto_increment,
	Nome varchar(40),
	Continente varchar(30),
	Idioma varchar(30),
	Moeda varchar(30)

);

insert into País values 
(null, 'Brasil', 'América do Sul', 'Português', 'Real'),
(null, 'Argentina', 'América do Sul', 'Espanhol','Peso'),
(null, 'Alemanha', 'Europa', 'Alemão', 'Euro'),
(null, 'Bélgica', 'Europa', 'Francês, Alemão e Holandes', 'Euro'),
(null, 'Japão', 'Ásia', 'Japonês', 'Iene');


select * from País;

-- 2 -- 

create table Atleta (
	iDAtleta int primary key auto_increment,
	Nome varchar(40),
	Idade int,
	Modalidade varchar(30),
	Medalhas int,
	fkPaís int, 
    foreign key (fkPaís) references País(iDPais)
);


insert into Atleta values 
(null, 'Neymar', 29, 'Futebol', 1, 1),
(null, 'Marcelo', 32, 'Futebol', 0, 1),
(null, 'Dybala', 27, 'Futebol', 0, 2),
(null, 'Schumacher', 52, 'Fórmula 1', 0, 3),
(null, 'Goku', 30, 'Artes Marciais', 1, 5);

select * from Atleta;

-- 3 --

select Atleta.iDAtleta, Atleta.Nome, Atleta.Idade, Atleta.Modalidade, Atleta.Medalhas, País.Nome, País.Continente  
from Atleta inner join País on iDPais= fkPaís;

-- 4 --

select Atleta.Nome, Atleta.Modalidade, País.Continente from Atleta inner join País on iDPais= fkPaís;

-- Desafio --

-- 5 --

create table Modalidade (
	iDModalidade int primary key auto_increment,
	Nome varchar(30),
	Qtd_Jogadores int,
	Data_Criação date,
	Olímpica char(3) check (Olímpica = 'sim' or Olímpica = 'não'),
	fkPaís int, 
    foreign key (fkPaís) references País(iDPais),
	fkAtleta int, 
    foreign key (fkAtleta) references Atleta(iDAtleta)

);

desc Modalidade;


select * from Modalidade;

insert into Modalidade values 
(null, 'Futebol', 11, '1830-10-26', 'sim', 1, 1),
(null, 'Fórmula 1', 20, '1950-05-13', 'não', 3, 4),
(null, 'Artes Marciais', 2, '1850-07-25', 'não', 5, 5)
;

-- 6 --

select * from Modalidade inner join Atleta on iDAtleta = fkAtleta;

/* 
7- Regra de Negócio:

Cada modalidade pode receber 0 ou N Atletas;
Cada modalidade pode receber 0 ou N Países;
Cada País pode ter 0 ou N Atletas.

*/
