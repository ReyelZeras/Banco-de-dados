-- 1. Criar o banco de dados ac2seuNome -- 

create database ac2Reyel;

-- 2. Selecionar o bando de dados criado --

use ac2Reyel;

-- 3. criar as tabelas e inserir dados --

create table Clube (
	IdClube int primary key auto_increment,
	Nome varchar(40),
	País varchar(40),
	Divisão varchar(40),
	Competicao_Continental char(3),
    CHECK (Competicao_Continental = 'sim' or Competicao_Continental = 'não')

);

insert into Clube values
(null, 'Santos', 'Brasil', 'Primeira Divisão', 'sim'),
(null, 'São Paulo', 'Brasil', 'Primeira Divisão', 'sim'),
(null, 'Palmeiras', 'Brasil', 'Primeira Divisão', 'sim'),
(null, 'Corinthians', 'Brasil', 'Primeira Divisão', 'sim'),
(null, 'Cruzeiro', 'Brasil', 'Segunda Divisão', 'não');


create table Jogadores (
	IdJogador int primary key auto_increment,
	Nome varchar(40),
	Nacionalidade varchar(40),
	BID int,
	Valor_Mercado double,
	FkClube int, 
    foreign key (FkClube) references Clube(IdClube)
)auto_increment = 100;

insert into Jogadores values
(null, 'João Miranda', 'Brasil', 159997, 300000, 2),
(null, 'Orejuela Garcia', 'Colombia', 1778706, 1700000, 2),
(null, 'Jonathan Copete', 'Colombia', 1564545, 1300000, 1),
(null, 'Luan Peres', 'Brasil', 1654513, 1500000, 1);

-- 4. Exibir os dados das tabelas criadas separadamente --
select * from Clube;
select * from Jogadores;

-- 5. Exibir os dados das tabelas de forma correspondente, ou seja, com a junção entre as duas tabelas --

select * from Clube inner join Jogadores on FkClube = IdClube;

-- 6. Exibir os dados das tabelas, de forma correspondente, ou seja, com a junção entre as duas tabelas e com uma condição de filtro --
select * from Clube inner join Jogadores on FkClube = IdClube where IdClube = 1;

-- 7. Exibir os dados de uma tabela utilizando uma das funções aprendidas (MAX, MIN, SUM, GROUP BY, AVG, COUNT);
select max(Valor_Mercado) from Jogadores;


