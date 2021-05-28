create database ac2Julia;
use ac2Julia;

drop database ac2Julia;

create table salão (
	idProfissional int primary key auto_increment,
    nomeProfissional varchar(25),
    tipo varchar(25),
    atendimento varchar(40),
    confirmacaoCliente varchar(30),
    totalCliente int,
    check (confirmacaoCliente = 'não' or confirmacaoCliente = 'sim')
);

insert into salão values 
(null, 'Andressa', 'Manicure', 'esmaltação', 'não', 1),
(null, 'Isabella', 'Cabeleleira', 'escova', 'sim', 2),
(null, 'Andressa', 'Manicure', 'esmaltação', 'sim', 2),
(null, 'Fernanda', 'Cabeleleira', 'tintura', 'sim', 4);


create table cliente (
	idCadastro int primary key auto_increment,
    nome varchar(100),
    telFixo varchar(20),
    telCel varchar(20),
    endereço varchar(50),
    bairro varchar(50),
    fk_Salao int,
    foreign key (fk_Salao) references salão (idProfissional)
)auto_increment 100; 


insert into cliente values (null, 'Alexandra Morin', '56624875', '11987456321' , 'Rua socrates', 'Vila Sofia', 1);
insert into cliente values (null, 'Adriana Silva', '56628945', 11987654321, 'Rua da alegria', 'Itam Bibi', 2);
insert into cliente values (null, 'Amelia Morin', '5623489', '1198652314', 'Rua das felicitações', 'Alegria Paulista', 3); 



select * from salão;
select * from cliente;

select * from salão join cliente on fk_Salao = idProfissional; -- mostrando tudo



select nome, telFixo, telCel, endereço, salão.* from cliente join salão on fk_Salao = idProfissional where idCadastro = 102;



select sum(totalCliente) from salão;














