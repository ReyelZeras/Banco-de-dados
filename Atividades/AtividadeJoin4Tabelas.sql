create database apresentacoes;

use apresentacoes;

-- 1. Criar as tabelas no MySQL e executar as instruções relacionadas a seguir. --

create table grupos(
idGrupo int primary key auto_increment,
nomeGrupo varchar(45),
descricaoProjeto varchar(100)
)auto_increment = 1;

create table alunos(
RA int primary key,
nomeAluno varchar(45),
emailAluno varchar(45),
fkGrupo int,
foreign key (fkGrupo) references grupos(idGrupo)
);

create table professores(
idProfessor int primary key auto_increment,
nomeProfessor varchar(45),
disciplina varchar(45)
);

create table avaliacoes(
idAvaliacao int primary key auto_increment,
dataHorario datetime,
nota decimal(5,2),
fkGrupo int,
foreign key (fkGrupo) references grupos(idGrupo),
fkProfessor int,
foreign key (fkProfessor) references professores(idProfessor)
)auto_increment = 1;

--  2. Insira dados nas tabelas, de forma que tenha pelo menos 2 grupos cadastrados. --

insert into grupos values
(null, 'ColorFulLife', 'Cromoterapia para tratamento autistas'),
(null, 'TankSolution', 'Controle de temperatura em taques de peixes'),
(null, 'Lumos', 'Controle de nível de luminosidade');

insert into alunos values
(10001, 'Paulo', 'paulo@bandtec.com', 1),
(10002, 'Carol', 'carol@bandtec.com', 1),
(10003, 'Matheus', 'matheus@bandtec.com', 1),
(10004, 'Pedro', 'pedro@bandtec.com', 2),
(10005, 'Bruno', 'bruno@bandtec.com', 2),
(10006, 'Felipe', 'felipe@bandtec.com', 3),
(10007, 'Henrique', 'henrique@bandtec.com', 2);

insert into professores values
(null, 'Thiago', 'TI'),
(null, 'Alex', 'BD'),
(null, 'Rafael', 'BD'),
(null, 'Frizza', 'Algoritmos'),
(null, 'Brandão', 'PI');

insert into avaliacoes values
(null, '2021-05-31 16:00:00', '9.8', 1, 1),
(null, '2021-05-31 16:00:00', '8.4', 1, 3),
(null, '2021-05-31 17:00:00', '7.2', 2, 2),
(null, '2021-05-31 17:00:00', '10', 2, 4),
(null, '2021-05-31 18:00:00', '9.4', 3, 5),
(null, '2021-05-31 18:00:00', '8.2', 3, 1);


alter table avaliacoes modify column nota decimal (5,2);

-- 3. Exibir todos os dados de cada tabela criada, separadamente. --

select * from grupos;

select * from alunos;

select * from professores;

select * from avaliacoes;

-- 5. Exibir os dados dos grupos e os dados de seus respectivos alunos. --

select * from grupos join alunos on fkGrupo = idGrupo;

select * from grupos where idGrupo in (select fkGrupo from alunos);

mano basicamente serve pra tu acessar uma outra tabela, ex: tu tem uma tabela de jogadores e uma tabela dos clubes, 
tu quer pegar só os jogadores de um clube específico, mas tu não sabe a fk

select * from Jogadores where fkClube = (select idClube from Clube where nomeClube = "São Paulo");



o select dentro do parênteses vai retornar o id do SPFC, fazendo o select de fora funcionar

-- 6. Exibir os dados de um determinado grupo e os dados de seus respectivos alunos. --

select * from grupos join alunos on fkGrupo = idGrupo where idGrupo = 1;

-- 7. Exibir a média das notas atribuídas aos grupos, no geral. --

select avg(nota) from avaliacoes group by fkGrupo;

-- 8. Exibir a nota mínima e a nota máxima que foi atribuída aos grupos, no geral. --
select min(nota), max(nota) from avaliacoes;

-- 9. Exibir a soma das notas dadas aos grupos, no geral que avaliaram cada grupo, os dados dos grupos, --
select sum(nota) from avaliacoes group by fkGrupo;

-- 10. Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupo, a data e o horário da avaliação. --

select p.idProfessor, p.nomeProfessor, p.disciplina, g.nomeGrupo, g.descricaoProjeto, a.dataHorario
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo;


-- 11. Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.   --

select p.idProfessor, p.nomeProfessor, p.disciplina, g.nomeGrupo, g.descricaoProjeto, a.dataHorario, a.nota
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo
	where g.idGrupo = 1;


-- 12. Exibir os nomes dos grupos que foram avaliados por um determinado professor. --

select p.idProfessor, p.nomeProfessor, p.disciplina, g.nomeGrupo
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo
	where p.idProfessor = 1;

-- 13. Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a data e o horário da avaliação. -- 
select g.nomeGrupo, g.descricaoProjeto,
	al.RA, al.nomeAluno, al.emailAluno,
	p.idProfessor, p.nomeProfessor, p.disciplina,  
	a.dataHorario
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo
	join alunos al
	on al.fkGrupo = g.idGrupo;

-- 14. Exibir a quantidade de notas distintas. -- 

select distinct nota from avaliacoes;


-- 15. Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por professor. --
select p.idProfessor, p.nomeProfessor,
	avg(a.nota), sum(a.nota)
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo
	group by p.idProfessor;

-- 16. Exibir a identificação do grupo (pode ser o fk ou o nome), a média das notas e a soma das notas atribuídas, agrupadas por grupo.--

select g.idGrupo, g.nomeGrupo, g.descricaoProjeto,
	avg(a.nota), sum(a.nota)
    from grupos g
    join avaliacoes a
    on g.idGrupo = a.fkGrupo 
	group by g.idGrupo;

-- 17. Exibir a identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor. --
select p.idProfessor, p.nomeProfessor,
	min(a.nota) as menorNota, max(a.nota) as maiorNota
    from professores p
    join avaliacoes a
    on p.idProfessor = a.fkProfessor 
    join grupos g
    on g.idGrupo = a.fkGrupo
	group by p.idProfessor;

-- 18. Exibir a identificação do grupo (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por grupo. --

select g.idGrupo, g.nomeGrupo, g.descricaoProjeto,
	min(a.nota) as menorNota, max(a.nota) as maiorNota
    from grupos g
    join avaliacoes a
    on g.idGrupo = a.fkGrupo 
	group by g.idGrupo;

start transaction;

delete from alunos where RA = 10001;
select avg(temperatura) from sensores;
 
rollback;
commit;
select * from alunos;
drop table alunos;

