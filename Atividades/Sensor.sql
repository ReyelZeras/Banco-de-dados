create database Faculdade;

use Faculdade;

select sysdate(); -- exibir a data do servidor --
select now(); -- exibir a data do servidor --
select addtime(sysdate(), '-3:00:00'); -- exibir a data do servidor + fuso horário --



create table Sensor(
	idSensor int primary key auto_increment,
	nomeSensor varchar(100),
	localSensor varchar(50),
	temperatura float not null, -- decimal (5, 2, 3)  float (999,99) --
	dataTemp datetime default current_timestamp,
	statusSensor varchar(30)
	check (statusSensor = 'Ativo' or statusSensor = 'Inativo')
) auto_increment = 10000; -- começa a partir de 10000 --

-- float: 7 dígitos (32 bits) --
-- Doble: 15 dígitos (64 bits) --
-- Decimal: 28 dígitos (128 bits) --

-- excluir o check realizado na criação da tabela
-- sendo 'sensor_chk_1' o 

select * from sensor;


insert into Sensor (nomeSensor, localSensor, temperatura, dataTemp, statusSensor) values 
('Paulo', 'Bandtec', 32, now(), 'Ativo'),
('Jorge', 'Etec', 30, now(), 'Ativo'), 
('Henrique', 'Sala1', 20, now(), 'Ativo'),
('Bruno', 'Quarto', 20, now(), 'Ativo')
;

