create database Clinica;

use Clinica;

create table Paciente (
idPaciente int primary key auto_increment,
nomePaciente varchar(45),
telefonePaciente int,
endereco varchar(50)

);

create table Medico (
CRM int primary key,
nomeMedico varchar(45),
especialidade varchar(50),
telefoneMedico int

);

create table Consulta (
idConsulta int primary key auto_increment,
   fkCRM int, 
   foreign key (fkCRM) references Medico(CRM),
   fkPaciente int,
   foreign key (fkPaciente) references Paciente(idPaciente),
	DataConsulta datetime default current_timestamp
 );

insert into Paciente values 
(null, 'Jorge', 55555555, 'São Caetano'),
(null, 'Paulo', 66666666, 'São Bernardo'),
(null, 'Jéssica', 77777777, 'Santo André'),
(null, 'Henrique', 88888888, 'Diadema'),
(null, 'Luana', 99999999, 'Jardins');

select * from Paciente;

insert into Medico values
(123456, 'Felipe', 'Ortopedista', 12354678),
(234567, 'Thiago', 'Pediatra', 87456123),
(345678, 'Júlia', 'Ginecologista', 98745632),
(456789, 'Lucas', 'Neuro', 96547813),
(567890, 'Isabela', 'Otorrinolaringologista', 94561230);

select * from Medico;

insert into Consulta values
(null, 123456, 1, '2021-05-13 16:00:00'),
(null, 234567, 1, '2021-05-13 18:00:00'),
(null, 456789, 2, '2021-05-23 10:00:00'),
(null, 345678, 3, '2021-05-05 22:00:00'),
(null, 567890, 4, '2021-05-10 08:00:00');

select * from Consulta;


select * from Paciente, Medico, Consulta 
   where fkCRM = CRM and fkPaciente = idPaciente;




