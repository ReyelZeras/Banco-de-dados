use faculdade;

-- Tabela Aula --

create table aula (
	idAula int primary key auto_increment,
	nomeAula varchar(75),
	tipo char(1),
	check (tipo = 'P' or tipo = 'H' or tipo = 'R'),
	dtAula date,
	mensagem varchar(100)
);

Insert into aula values 
	(null, 'BD', 'R', '2021-02-11', 'Conhecendo BD'),
	(null, 'ArqComp', 'P', '2021-02-25', 'Sensor'),
	(null, 'PI', 'H', '2021-04-11', 'Projeto');

select * from aula;

Insert into aula values 
	(null, 'TI', 'H', '2021-04-25', 'Backlog'),
	(null, 'Alg', 'P', '2021-11-04', 'Select'),
	(null, 'DSF', 'P', '2021-08-30', 'Kodular');


-- Tabela Chamada --

create table chamada (
	iDChamada int primary key auto_increment,
	dtPresenca datetime default current_timestamp,
	presenca char(3)
	check (presenca = 'sim' or presenca = 'não'),
	fkAula int,
	foreign key (fkAula) references aula(iDAula)
) auto_increment = 20000;


select * from chamada; 

insert into chamada (presenca) values 
('sim'), ('não'), ('Sim');

alter table chamada add fkAluno int;
alter table chamada add foreign key(fkAluno) references aluno(iDAluno);


-- Tabela Aluno --

create table aluno(
	iDAluno int primary key auto_increment,
	nome varchar(50)

);

insert into aluno values
	(null, 'Bruno'),
	(null, 'Júlia'),
	(null, 'Felipe'),
	(null, 'Thiago');

select * from aluno;

select * from chamada join aula on fkAula = idAula;

select * from aula;



