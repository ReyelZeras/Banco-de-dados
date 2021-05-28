create database Petshop;

use Petshop;


-- Crie as tabelas equivalentes à modelagem -- 

create table Clientes (
	iDCliente int primary key auto_increment,
	Nome varchar(40),
	Telefone_Celular char(11),
	Telefone_Fixo char(8),
	Endereço varchar(80)
	
);

create table Pet (
	IDPet int primary key auto_increment,
	Tipo_animal varchar(45),
	Nome varchar(45),
	Raça varchar(45),
	DataNasc datetime default current_timestamp,
	FkCliente int, 
    foreign key (FkCliente) references Clientes(iDCliente)

)auto_increment = 101;

-- Insira dados nas tabelas --
insert into Clientes values
(null, 'Jorge Soares', '11123456789', '1232458', 'Rua 123'),
(null, 'Pedro Soares', '11987654321', '874561', 'Rua 456'),
(null, 'Paula Campos', '11789456123', '321654', 'Rua 789'),
(null, 'Felipe Salles', '1178945643', '545646', 'Rua 987'),
(null, 'Matheus Queiroz', '11568145345', '546891', 'Rua 465');


insert into Pet (Tipo_animal, Nome, Raça, DataNasc, FkCliente) values 
('Cachorro', 'Bart', 'Golden', '2010-07-25', 1),
('Cachorro', 'Pipoca', 'Pastor Alemão','2010-07-25', 2),
('Gato', 'Spok', 'Maine Coon', '2010-07-25', 4),
('Gato', 'Ash', 'Persa', '2010-07-25', 5),
('Peixe', 'Peixonauta', 'beta', '2010-07-25', 4);

-- Exibir os dados das tabelas -- 

select * from Pet;

select * from Clientes;

-- Altere o tamanho da coluna nome do cliente --

alter table Clientes modify nome varchar(50);

-- Exibir apenas o nome e a data de nascimento dos pets --

select Nome, DataNasc from Pet;


