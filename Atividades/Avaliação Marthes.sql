create database ac2Matheus;

use ac2Matheus;

create table Dependente (
    idDependente int not null primary key auto_increment,
    Nome varchar(45) not null,
    Data_nasc date not null,
    Sexo varchar(10),
    Faltas int(3)
    ) auto_increment = 100; 

insert into Dependente(Nome, Data_nasc, Sexo, Faltas) values
    ('João Souza', '2014-02-24', 'Masculino', 2),
    ('Gabriela Conceição', '2014-12-02', 'Feminino', 3),
    ('Guilherme Brasil', '2015-07-25', 'Masculino', 1),
    ('Matheus Lima', '2015-05-13', 'Masculino', 2),
    ('Matheus Ferreira', '2014-03-28', 'Masculino', 4),
    ('Leila Machado', '2016-04-15', 'Feminino', 2),
    ('Letícia Brasil', '2013-08-14', 'Feminino', 3);


create table Responsavel (
    idResponsavel int not null primary key auto_increment,
    Nome varchar(45) not null,
    Data_nasc date not null,
    Telefone varchar(11) not null,
    Endereco varchar(45),
    Biologico char(3),
    check (Biologico = 'SIM' or Biologico = 'NAO'),
	FkDependente int, 
    foreign key (FkDependente) references Dependente(idDependente)
    );

insert into Responsavel(Nome, Data_nasc, Telefone, Endereco, Biologico, FkDependente) values
    ('Emanoel Souza', '1970-07-21', 11966174456, 'Rua das amoras numero 10', 'SIM', 100),
    ('Maria Conceição', '1980-08-03', 1140028922, 'Rua Hebert Spencer numero 15', 'SIM', 100),
    ('Welligton Brasil', '1978-05-24', 1145623265, 'Rua das goiabas numero 1005', 'NAO', 105),
    ('Joyce Ferreira', '1985-11-25', 1187958421, 'Rua das Jangadas numero 250', 'SIM', 105),
    ('Cleber Machado', '1980-12-12', 1185242632, 'Rua das belezas numero 14', 'SIM', 102);

select * from Responsavel;

select * from Dependente;

select * from Dependente inner join Responsavel on FkDependente = idDependente;
select * from Dependente inner join Responsavel on FkDependente = idDependente where IdDependente = 100;

select sum(Faltas) from Dependente;

