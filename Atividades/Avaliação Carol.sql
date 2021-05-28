create database  ac2carolinebeiraosouza;

use ac2carolinebeiraosouza;

create table conquistas(
    idConquistas int primary key auto_increment,
    titulo varchar(30),
    ano date,
    valorPremio decimal(2),
    organizador varchar(30)
) auto_increment = 100;

create table times(
    idTime int primary key auto_increment,
    nome varchar(30),
    dataFund date,
    ct varchar(40),
    serie char(1),
    check (serie = 'A' or serie = 'B')
); 


insert into times values
    (null, 'São Paulo','1930-01-02','são paulo','A' ),
    (null,'Palmeiras','1914-02-03','palestra italia', 'A'), 
    (null,'Botafogo','1980-03-20','rio de janeiro','B'),
    (null,'Avaí','1996-03-17','avai','B' );

insert into conquistas values 
    (null, 'libertadores', '1998-10-03', 50, 'comenbol' ),
    (null, 'Paulistão', '1996-04-29', 20, 'FBC' ),
    (null, 'Bolamucha', '2020-01-10', 10, 'ABC');

select * from conquistas;
select * from times;

alter table conquistas add fk_times int;
alter table conquistas add foreign key (fk_times) references times (idTime);

update conquistas set fk_times = 1 where idConquistas in (100);
update conquistas set fk_times = 2 where idConquistas in (101);
update conquistas set fk_times = 3 where idConquistas in (102);



select * from conquistas inner join times on fk_times = (idTime);

select * from conquistas inner join times on fk_times = IdTime where titulo = 'libertadores';
