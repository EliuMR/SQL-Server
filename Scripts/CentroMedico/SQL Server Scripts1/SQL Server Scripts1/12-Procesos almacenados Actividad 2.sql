-- Procesos almacenados Actividad 2
use CentroMedico;
-- store procedure insertar pacientes 
-- select * from Paciente;
drop proc if exists ALTA_PACIENTE;

CREATE -- crear un store procedure
-- ALTER -- modificar el store procedure
PROC ALTA_PACIENTE(
							@dni varchar(20),
							@nombre varchar (50),
							@apellido varchar(50),
							@fechaNacimiento varchar(8),
							@domicilio varchar(50),
							@idPais char(3),
							@email varchar(20),
							@telefono varchar(20)='',
							@Observacion varchar(1000)=''
						)

AS
if not exists(select * from Paciente where DNI=@dni) -- verificamos si existe
begin
	insert into Paciente (DNI,nombre,apellido,fechaNacimiento,domicilio,idPais,email,telefono,Observacion)
	values (@dni,@nombre,@apellido,@fechaNacimiento,@domicilio,@idPais,@email,@telefono,@Observacion)
	print ('Paciente agregado')
	return
end
else
begin
	print 'El paciente ya se había agregado'
end

exec ALTA_PACIENTE '121+31532d','Jorge','Lopez','20181212','Rrio 12', 'MEX','ere@gmail.com','22225466'
select * from Paciente 








-- STORE PROCEDURO PARA ALMACENAR TURNOS
select * from TurnoPacienteMedico;
select * from Turno;
select * from Medico;
-- estado = 0 pendiente
-- estado = 1 realizado
-- estado = 2 cancelado
-- create 
alter 
proc ALTA_TURNO(
---		@idTurno int,
		@fechaTurno varchar(14), -- 20151231 12:00
		@idPaciente paciente,
		@idMedico medico,
		@observacion observacion=''
)
as 
-- comprobar que no existe ese turno con esa fecha establecida
if not exists(select TOP 1 idTurno from Turno where fechaTurno=@fechaTurno)
begin 
	insert into Turno (fechaTurno,estado,observacion)
	values (@fechaTurno,0,@observacion)
	
	declare @auxidTurno turno
	set @auxidTurno = @@IDENTITY -- obtenemos el ultimo valor insertado con el campo identity on de la tabla Turno

	insert into TurnoPacienteMedico (idTurno,idPaciente,idMedico)
	values (@auxidTurno,@idPaciente,@idMedico)
end

-- probando procedure
exec ALTA_TURNO '20251230 12:00', 5, 1, 'El paciente tiene que estar en ayunas';




/*
Deberás crear un procedimiento que inserte un nuevo Médico en las tablas respectivas:

Medico y MedicoEspecialidad

El procedimiento deberá recibir como parámetros, los siguientes:

@nombre varchar(50)

@apellido varchar(20)

@idespecialidad int

@descripcion varchar(50)

Puedes utilizar como base el procedimiento anterior para crear Turnos.

Nota: Ten en cuenta que el valor de idEspecialidad, deberá existir en la tabla Especialidad, al momento de ejecutar el procedimiento para insertar un nuevo Médico.
*/
select * from Medico;
select *from MedicoEspecialidad;
select *from Especialidad;
alter procedure ALTA_MEDICO(
								@nombre varchar(50),
								@apellido varchar(20),
								@idespecialidad int,
								@descripcion varchar(50)=''
	)
as
if not exists(select * from MedicoEspecialidad where idEspecialidad=@idespecialidad) 
begin
	insert into Medico (Nombre,Apellido) values (@nombre,@apellido)
	declare @auxIdMedico int
	set @auxIdMedico=@@identity
	insert into MedicoEspecialidad (idMedico,idEspecialidad,Descripcion)
	values (@auxIdMedico,@idespecialidad,@descripcion) 
	print 'Insertado'
end
else
	print 'Ya existe'

insert into Especialidad values ('Oftamologo')
exec ALTA_MEDICO 'Pedro','Sanchez',1,''

