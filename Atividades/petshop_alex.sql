create database AlunoDisciplinaTurmaA;
use AlunoDisciplinaTurmaA;

-- criação da tabela Aluno
create table Aluno (
  ra int primary key auto_increment,
  nomeAluno varchar(45),
  bairro varchar(45)
  ) auto_increment = 53000;
  
-- criaÃ§Ã£o da tabela Disciplina
create table Disciplina (
  idDisc int primary key auto_increment,
  nomeDisc varchar(45)
 ) auto_increment = 100;

-- criaÃ§Ã£o da tabela associativa entre Aluno e Disciplina
-- esta tabela terÃ¡ uma chave estrangeira para Aluno e uma chave estrangeira para Disciplina
-- a chave primÃ¡ria dessa tabela serÃ¡ composta por essas 2 chaves estrangeiras:fkRA e fkDisc
-- Obs: estamos assumindo que cada aluno sÃ³ farÃ¡ uma disciplina uma vez 
create table AlunoDisc (
   fkRa int, 
   foreign key (fkRa) references Aluno(ra),
   fkDisc int,
   foreign key (fkDisc) references Disciplina(idDisc),
   primary key(fkRa,fkDisc),
   nota decimal(4,2),
   qtdFalta int
 );
 
 -- insere dados de alunos
 insert into Aluno values
    (null, 'Maria Teixeira', 'Cambuci'),
    (null, 'João Oliveira', 'Vila Mariana'),
    (null, 'Katia Souza', 'Tatuapé'),
    (null, 'Claudio Silva', 'Paraíso');


 select * from Aluno;   

-- insere dados de disciplina
insert into Disciplina values
    (null, 'Banco de Dados'), (null,'Algoritmos'),
    (null, 'Arquitetura'), (null,'Pesquisa e Inovação');
select * from Disciplina;
    
-- insere dados na tabela associativa
insert into AlunoDisc values
    (53000,100,8,2), (53000,101,7.5,4), (53000,102,6,5),
    (53001,100,9,6), (53001,101,8, 10), (53001,103,6,7),
    (53002,100,8,4), (53002,102,7.5, 5), (53002,103,4,10),
    (53003,100,9,0), (53003,101,9.5,0), (53003,102,5,4);
select * from AlunoDisc; 

-- exibir os dados dos alunos e das disciplinas correspondentes,
-- alÃ©m das notas e das quant de faltas de cada aluno em cada disc.
select * from Aluno, Disciplina, AlunoDisc 
   where fkRa = ra and fkDisc = idDisc;

-- idem ao comando anterior, mas usando JOIN
select * from Aluno
         join AlunoDisc on fkRa = ra 
         join Disciplina on fkDisc = idDisc;

-- exibir os dados dos alunos e das disciplinas correspondentes,
-- alÃ©m das notas e das quant de faltas, mas sem repetir as colunas
-- fkRA e fkDisc
select Aluno.*, Disciplina.*, nota, qtdFalta 
   from Aluno, Disciplina, AlunoDisc 
   where fkRa = ra and fkDisc = idDisc;

-- idem ao anterior, usando JOIN   
select Aluno.*, Disciplina.*, nota, qtdFalta from Aluno
     join AlunoDisc on fkRa = ra 
     join Disciplina on fkDisc= idDisc;

-- exibir os dados dos alunos somente de Banco de Dados   
select Aluno.*, Disciplina.*, nota, qtdFalta 
   from Aluno, Disciplina, AlunoDisc 
   where fkRa = ra and fkDisc = idDisc and nomeDisc= 'Banco de Dados';

-- idem ao comando anterior, usando JOIN
select Aluno.*, Disciplina.*, nota, qtdFalta from Aluno
     join AlunoDisc on fkRa = ra 
     join Disciplina on fkDisc= idDisc
      where nomeDisc = 'Banco de Dados';

-- exibir os dados das disciplinas da aluna Katia Souza   
select Aluno.*, Disciplina.*, nota, qtdFalta 
   from Aluno, Disciplina, AlunoDisc 
   where fkRa = ra and fkDisc = idDisc and nomeAluno='Katia Souza';

-- idem ao comando anterior, usando JOIN
select Aluno.*, Disciplina.*, nota, qtdFalta from Aluno
     join AlunoDisc on fkRa = ra 
     join Disciplina on fkDisc= idDisc
     where nomeAluno='Katia Souza';