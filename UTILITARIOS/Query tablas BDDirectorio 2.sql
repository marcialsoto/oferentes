
-- Creación de tablas, Proyecto Oferentes Agro Rural --
-- Por: FERNÁNDEZ REYES, Angel

use BDDirectorio

--alter table ubigeo
--add Constraint PK_Ubigeo Primary Key (cod_ubigeo)

-- ************** Creación tabla Estudio ************** --



create table Estudio
(
	cod_estudio char(2) Constraint PK_Estudio Primary Key ,
	nivel varchar(10) not null,
	grado varchar(15) not null
)
insert into Estudio values('00','Ninguno',' ');
insert into Estudio values('11','Primaria','Completa');
insert into Estudio values('12','Primaria','Incompleta');
insert into Estudio values('21','Secundaria','Completa');
insert into Estudio values('22','Secundaria','Incompleta');
insert into Estudio values('31','Técnico','Completo');
insert into Estudio values('32','Técnico','Incompleto');
insert into Estudio values('33','Técnico','Título');
insert into Estudio values('41','Superior','Concluido');
insert into Estudio values('42','Superior','Inconcluso');
insert into Estudio values('43','Superior','Bachiller');
insert into Estudio values('44','Superior','Titulado');

-- ************** *************************************** ************* --

-- ************** Creación tabla Residencia ************** --

create table Residencia
(
	cod_resid int identity(1,1) Constraint PK_Residencia Primary Key,
	nombre varchar(20) not null
)


insert into Residencia values ('Anexo');
insert into Residencia values ('Asentamiento Humano');
insert into Residencia values ('Centro poblado');
insert into Residencia values ('Comunidad');
insert into Residencia values ('Localidad');

-- ************** *************************************** ************* --

-- ************** Creación tabla Estado Civil ************** --

create table Estado_Civil
(
	cod_estcivil int identity(1,1) Constraint PK_EstCivil Primary Key,
	nombre varchar(20) not null
)

insert into Estado_Civil values ('Soltero');
insert into Estado_Civil values ('Casado');
insert into Estado_Civil values ('Viudo');
insert into Estado_Civil values ('Divorciado');

-- ************** *************************************** ************* --

-- ************** Creación tabla Idioma ************** --

create table Idioma
(
	cod_Idioma int identity(1,1) Primary Key,
	nombre varchar(30) not null

)
insert into Idioma values('Aymara');
insert into Idioma values('Castellano');
insert into Idioma values('Quechua');

-- ************** *************************************** ************* --

-- ************** Creación tabla Actividad ************** --

create table Actividad
(
	cod_activ int identity(1,1) Primary Key,
	nombre varchar(50) not null
)

insert into Actividad values('Crianza de Truchas');
insert into Actividad values('Crianza de Ganado');
insert into Actividad values('Crianza de Carneros');
-- ************** *************************************** ************* --


-- ************** Creación tabla Organización Atendida ************** --

create table Org_Atendida
(
	cod_orgatend int identity(1,1) Primary Key,
	nombre varchar(50) not null
)

insert into Org_Atendida values('ONG Vida Sana');
-- ************** *************************************** ************* --

-- ************** Creación tabla Talento ************** --

create table Talento
(
	num_dni numeric(8,0) Constraint PK_Talento Primary Key,
	apellidos varchar(30) not null,
	nombres varchar(20) not null,
	fecha_nac datetime not null,
	lugar_nac char(6) not null Constraint FK_Talento_lugarnac Foreign Key References Ubigeo(cod_ubigeo),
	sexo varchar(10) not null,
	estado_civil int not null Constraint FK_Talento_estcivil Foreign Key References Estado_Civil(cod_estcivil),
	residencia int Constraint FK_Talento_residencia Foreign Key References Residencia(cod_resid),
	direccion varchar(150) not null,
	ubigeo char(6) not null Constraint FK_Talento_residubigeo Foreign Key References Ubigeo(cod_ubigeo),
	telefono_fijo numeric(10,0),
	telefono_celular numeric(12,0),
	correo varchar(30),
	estudio char(2) not null Constraint FK_Talento_estudio Foreign Key References Estudio(cod_estudio),
	lect_esc varchar(20),
	idioma int not null Constraint FK_Talento_idioma Foreign Key References Idioma(cod_Idioma),
	fecha_reg datetime not null,
	estado char(1) default '1'
)


-- ************** *************************************** ************* --


-- ************** Creación tabla Experiencia ************** --

create table Experiencia
(
	num int identity(1,1),
	num_dni numeric(8,0)  not null Constraint FK_Exp_numdni Foreign Key References Talento(num_dni),
	actividad int not null Constraint FK_Exp_actividadi Foreign Key References Actividad(cod_activ),
	duracion varchar(30) not null,
	certificado varchar(50),
	lugar_activ char(6) not null Constraint FK_Exp_lugaractiv Foreign Key References Ubigeo(cod_ubigeo),
	organizacion_atendida int not null  Constraint FK_Exp_orgatendida Foreign Key References Org_Atendida(cod_orgatend),
	referente varchar(100) not null,
	reconocimientos varchar(200),
	fecha_reg datetime not null,
	estado char(1) default '1',
	Primary Key (num, num_dni)
)

-- ************** *************************************** ************* --
--
 --drop table Experiencia
 --drop table Talento
 --drop table Estudio
 --drop table Residencia
 --drop table Estado_Civil
 -- drop table Idioma
-- drop table Actividad
-- drop table Org_Atendida


