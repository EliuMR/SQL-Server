-- Select * from sys.databases 



-- Crear database
-- Create database CentroMedico;
use CentroMedico;

drop table if exists Paciente;
 CREATE table Paciente(
	idPaciente int not null IDENTITY(1,1),
	DNI varchar(20) not null,
	nombre varchar(50) not null,
	apellido varchar(50) null,
	fechaNacimiento date null,
	domicilio varchar(50) null,
	idPais char(3) null,
	email varchar(30) null,
	observacion varchar(200) null,
	fechaAlta date not null,

	constraint pk_idPaciente primary key(idPaciente) 
 );
 
drop table if exists Historia;
create table Historia(
	idHistoria int not null primary key identity(1,1),
	fechaHistoria datetime null,
	observacion varchar(2000) null
);

drop table if exists Pais;
create table Pais (
	idPais char(3) not null primary key, 
	Pais varchar(30) null
);

drop table if exists TurnoEstado;
create table TurnoEstado(
	idEstado smallint not null primary key,
	descripcion varchar(50)
);

drop table if exists Especialidad;
create table Especialidad(
	idEspecialidad int not null primary key identity(1,1),
	Especialidad varchar(30)
);

drop table if exists Pago;
create table Pago(
	idPago int not null primary key identity(1,1),
	concepto tinyint not null,
	fecha date not null,
	mono money not null,
	estado tinyint,
	obervacion varchar(1000)
);

drop table if exists PagoPaciente;
create table PagoPaciente(
	idPago int not null,
	idPaciente int not null,
	idTurno int not null

	primary key(idPago,idPaciente,idTurno)
);

drop table if exists Medico;
create table Medico(
	idMedico int not null identity(1,1),
	Nombre  VARCHAR(50) not null,
	Apellido VARCHAR(50) not null

	primary key(idMedico)
);

drop table if exists MedicoEspecialidad;
create table MedicoEspecialidad(
	idMedico int not null identity(1,1),
	idEspecialidad int not null,
	Descripcion VARCHAR(50) not null

	primary key(idMedico,idEspecialidad)
);

drop table if exists Concepto;
create table Concepto(
	idConcepto tinyint not null identity(1,1),
	Descripcion VARCHAR(100) not null

	primary key(idConcepto)
);