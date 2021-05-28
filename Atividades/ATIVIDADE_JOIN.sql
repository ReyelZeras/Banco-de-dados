-- Desenvolvido por Reyel R. Soares da Conceição - RA: 01211118. -- 

-- Enunciado --

create database AlunoProjeto;

use AlunoProjeto;

-- Criar as tabelas equivalentes à modelagem. --

create table Projetos(
	idProjeto int primary key auto_increment,
	Nome varchar(45),
	Descricao varchar(100)
);

create table Alunos(
	RA int primary key auto_increment,
	Nome varchar(45),
	Telefone numeric,
	FkProjeto int, 
	foreign key (FkProjeto) references Projetos(idProjeto),
	FkRepresentante int, 
	foreign key (FkRepresentante) references Alunos(RA)
);

create table Acompanhantes(
	idAcompanhante int primary key auto_increment,
	Nome varchar(45),
	Relacionamento varchar(45),
	FkAluno int, 
	foreign key (FkAluno) references Alunos(RA)

);

-- Inserir dados nas tabelas. --

insert into Projetos values
(null, 'ColorFul Life', 'Cromoterapia para tratamento de crise de autistas'),
(null, 'Tank Solutions', 'Medição de temperatura para tanque de peixes (psicultura)'),
(null, 'Ledzinho', 'Fitas de LED'),
(null, 'La Chiken', 'Medição de temperatura de de frangos'),
(null, 'Utzinho', 'Grupo para auxílio de jogadores de fifa'),
(null, 'Lummoss', 'Medição de luminosidade nas ruas');


insert into Alunos values
(null, 'Kauã', '123456789', 5, null),
(null, 'Felipe', '987654321', 6, null),
(null, 'Matheus', '789456123', 5, 1),
(null, 'Carol', '321654987', 1, 2),
(null, 'Thiago', '963852741', 2,2),
(null, 'Giovanna', '123456789', 4,1);

insert into Acompanhantes values
(null, 'Leonardo', 'irmão', 2),
(null, 'Ingrid', 'Mãe', 2),
(null, 'Débora', 'Namorada', 5),
(null, 'Kátia', 'mãe', 1),
(null, 'Perpétua', 'mãe', 3),
(null, 'Marcelo', 'pai', 6),
(null, 'Fernando', 'amigo', 4);

-- Exibir todos os dados de cada tabela criada, separadamente.--

select * from Alunos where RA in
		(select FkAluno from Acompanhantes where
		Relacionamento = 'Namorada');



select * from Projetos;

select * from Alunos;

select * from Acompanhantes;

-- Exibir os dados dos alunos e dos projetos correspondentes --

select * from Alunos join Projetos on FkProjeto = idProjeto;

-- Exibir os dados dos alunos e dos seus acompanhantes. --

select * from Acompanhantes join Alunos on FkAluno = RA;

-- Exibir os dados dos alunos e dos seus representantes. --

select * from Alunos as Aluno join Alunos as Representante on Aluno.FkRepresentante = Representante.RA;

/* Exibir os dados dos alunos e dos projetos correspondentes, mas somente de
um determinado projeto (indicar o nome do projeto na consulta). */

select * from Alunos join Projetos on FkProjeto = idProjeto where Projetos.Nome = 'ColorFul Life';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes. --

select * from Alunos join Projetos on FkProjeto = idProjeto join Acompanhantes on FkAluno = RA;
