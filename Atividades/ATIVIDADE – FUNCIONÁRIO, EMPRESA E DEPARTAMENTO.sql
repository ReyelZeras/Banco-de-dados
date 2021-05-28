create database Empresa;

use Empresa;

-- Criando tabelas --

create table Empresa(
	IdEmpresa int primary key auto_increment,
	Nome varchar(45),
	CNPJ char(14),
	Telefone numeric,
	Endereco varchar(45)
	
)auto_increment = 1;

create table Departamento(
	IdDepartamento int primary key auto_increment,
	Nome varchar(45)

)auto_increment = 1;


create table teste(
	idteste int primary key auto_increment,
	Nome varchar(45)

);

insert into teste(nome) values 
('reyel2');

select * from teste;

create table Funcionarios(
	IdFuncionario int primary key auto_increment,
	Nome varchar(45),
	Telefone numeric,
	CPF char(11),
	Endereco varchar(45),	
	FkEmpresa int,
	foreign key (FkEmpresa) references Empresa(IdEmpresa),
	FkDepartamento int,
	foreign key (FkDepartamento) references Departamento(IdDepartamento),
	FkChefe int,
	foreign key (FkChefe) references Funcionarios(IdFuncionario),
	Salario double

)auto_increment = 1;

drop table Empresa;
drop table Departamento;
drop table funcionarios;

-- Inserindo dados --

insert into Empresa values 
(null, 'Amazon', '01234567891234', '123456789', 'Rua Edifício JK, Av. Chedid Jafet, 200'),
(null, 'BandTec', '04895451256054', '987456123', 'Rua Haddock Lobo, 595'),
(null, 'C6 Bank', '78915606547894', '321654987', 'Av. Nove de Julho, 3186'),
(null, 'Banco Safra', '15648641654879', '741852963', 'Av. Paulista, 2150 - Bela Vista'),
(null, 'TIVIT', '45649816849896', '456987312', 'Av. das Nações Unidas, 17891'),
(null, 'GETNET', '89746505848464', '369852147', 'Av. Pres. Juscelino Kubitschek, 2235'),
(null, 'Accenture', '45678761657487', '159753486', 'Rua Alexandre Dumas, 2051');


insert into Departamento values
(null, 'Recursos Humanos'),
(null, 'Gerência'),
(null, 'Administrativo'),
(null, 'Financeiro'),
(null, 'Marketing');


insert into Funcionarios values 
(null, 'Felipe', '964589410', '15648498198', 'São Paulo', 1, 2, null, '5000.00'),
(null, 'Maria Clara', '987456130', '12345678901', 'São Bernardo', 1, 1, 1, '4000.00'),
(null, 'Thiago', '915156456', '67487489641', 'São Caetano', 1, 5, 1, '3500.00'),
(null, 'Isabela', '956465110', '44896165796', 'São Paulo', 2, 2, null,'2000.00'),
(null, 'Isadora', '946487307', '52318979848', 'Jaú', 2, 1, 4, '5450.00'),
(null, 'Kauã', '997897250', '46451678977', 'São Caetano', 2, 3, 4, '3500.00'),
(null, 'Mateus', '985213646', '46546546125', 'São Paulo', 3, 4, null, '4000.00'),
(null, 'Lucas', '919684984', '98794098485', 'Santo André', 4, 5, null, '6000.00'),
(null, 'Júlia', '902132549', '67894180489', 'São Bernardo', 5, 2, null, '3800.00'),
(null, 'Matheus', '965784156', '79861566479', 'São Paulo', 6, 3, null, '4000.00'),
(null, 'Rafael', '9365478940', '15758465165', 'São Paulo', 7, 1, null, '5000.00');


-- Select Individuais --

select * from Empresa;
select * from Departamento;
select * from Funcionarios;


-- Select das três tabelas --
select * from Funcionarios join Departamento on FkDepartamento = IdDepartamento join Empresa on FkEmpresa = IdEmpresa;


-- Select da tabela com auto relacionamento -- 
select * from Funcionarios as Funcionarios join Funcionarios as Chefe on Chefe.FkChefe = Funcionarios.IdFuncionario;

-- Select com Left join
select * from Funcionarios as Funcionarios left join Funcionarios as Chefe on Chefe.FkChefe = Funcionarios.IdFuncionario;


select sum(Salario) from funcionarios;
select sum(Salario) from funcionarios where FkChefe = 1;
select sum(Salario) from funcionarios group by FkChefe;

