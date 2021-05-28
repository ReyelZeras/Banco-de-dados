create database Gasto;

use Gasto;

create table Pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
dataNasc date,
profissao varchar(45)

);

-- • Insira dados nas tabelas. --

insert into Pessoa values 
(null, 'Felipe', '2003-02-08', 'Professor'),
(null, 'Thiago', '2002-09-02', 'Professor'),
(null, 'Júlia', '2003-08-02', 'Professora'),
(null, 'Isabela', '1995-11-05', 'Médica'),
(null, 'Lucas', '1990-06-30', 'Barman');

-- Exiba os dados de cada tabela individualmente. --

select * from Pessoa;


create table Gastos(
idGastos int primary key auto_increment,
dataGasto date,
valor double,
descricao varchar(50),
fkPessoa int,
foreign key (fkPessoa) references Pessoa(idPessoa)
);

-- • Insira dados nas tabelas. --

insert into Gastos values
(null, '2021-04-30', 100.00, 'Maquiagem', 3),
(null, '2021-05-01', 45.00, 'Fastfood', 3),
(null, '2021-04-27', 80.00, 'Iluminação', 2),
(null, '2021-04-29', 40.00, 'Cabeleleiro', 2),
(null, '2021-04-30', 250.00, 'Jogo PS4', 1);

-- Exiba os dados de cada tabela individualmente. --

select * from Gastos;

/* Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela
(por exemplo, as pessoas de alguma profissão, etc). */

select * from Pessoa where profissao = 'Professor';
select * from Gastos where dataGasto = '2021-04-30';

-- • Exiba os dados das pessoas e dos seus gastos correspondentes.--

select * from Gastos join Pessoa on fkPessoa = IdPessoa;

-- • Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes. --

select * from Gastos join Pessoa on fkPessoa = IdPessoa where idPessoa = 2;

-- • Atualize valores já inseridos na tabela. --

update Gastos SET valor = 245.00 where idGastos = '5';

-- • Exclua um ou mais registros de alguma tabela. --

delete from Gastos where idGastos = '5';
