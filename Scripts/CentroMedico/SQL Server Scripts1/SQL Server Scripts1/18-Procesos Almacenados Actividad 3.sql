-- Procesos Almacenados Actividad 3
-- consulta de los turno de un paciente dado
select * from MedicoEspecialidad
insert into MedicoEspecialidad values (1,1,'')
select * from Especialidad

create proc 
select_TurnoPaciente(@idPaciente paciente)
as 
	set nocount on -- no cuente el numero de registros
	select * from Paciente P
		inner join TurnoPacienteMedico as TP
		on TP.idPaciente=P.idPaciente
		inner join Turno as T
		on T.idTurno=TP.idTurno
		inner join MedicoEspecialidad as ME on
		ME.idMedico=TP.idMedico
	where P.idPaciente=@idPaciente

-- probamos
exec select_TurnoPaciente 2;


-- Procedure: historia clinica para un paciente en particular
-- tablas a vincular
select * from Historia;
select * from HistoriaPacienteMedico;
select * from Paciente;
insert into Historia (fechaHistoria,observacion) values (GETDATE(),'');
insert into HistoriaPacienteMedico values (1,2,1);

alter proc Sel_HistoriaPaciente(@idPaciente paciente)
as
set nocount on -- no regrese la cuenta de registros
if exists(select * from Paciente P
	inner join HistoriaPacienteMedico HP on HP.idPaciente=P.idPaciente
	inner join Historia H on H.idHistoria=HP.idHistoria
	inner join MedicoEspecialidad ME on ME.idMedico=HP.idMedico
	inner join Medico M on M.idMedico=ME.idMedico
	where P.idPaciente=@idPaciente)
		select * from Paciente P
		inner join HistoriaPacienteMedico HP on HP.idPaciente=P.idPaciente
		inner join Historia H on H.idHistoria=HP.idHistoria
		inner join MedicoEspecialidad ME on ME.idMedico=HP.idMedico
		inner join Medico M on M.idMedico=ME.idMedico
		where P.idPaciente=@idPaciente
else
	print 'No hay ese paciente'
-- probamos
exec Sel_HistoriaPaciente 10;

-- Store procedure para obtener la especialidades
alter proc Especialidades
as  
set nocount on
select * from Especialidad E
inner join MedicoEspecialidad ME on ME.idEspecialidad=E.idEspecialidad
inner join Medico M on M.idMedico=ME.idMedico

exec Especialidades ;

-- store procedure para actualizar turnos
select * from Turno
select * from TurnoPacienteMedico
select * from TurnoEstado

create proc Update_Turno(@idTurno int,@estado int, @observacion varchar(1000))
as 
set nocount on
select *
from Turno
if exists(select * from Turno where idTurno=@idTurno)
	update Turno set estado=@estado, observacion=@observacion 
		where idTurno=@idTurno
else
	select 0 as resultado

exec Update_Turno 3,2,'Llamo el paciente'

-- Crear un Stored Procedure para Actualizar un paciente
select * from Paciente;
create proc Update_Paciente_Numero(@idPaciente int, @telefono varchar(20))
as 
set nocount on
if exists (select * from Paciente where idPaciente=@idPaciente)
begin
	update Paciente set telefono=@telefono where idPaciente=@idPaciente
end
else
	print 'No existe tal paciente'

exec Update_Paciente_Numero 3,'5554568945';

-- Store procedure para eliminar turno
-- tablas involucradas turno y turnoPaciente
select * from Turno;
select * from TurnoPacienteMedico;

alter proc Delete_Turno(@idTurno int)
as 
set nocount on
select *
from Turno
if exists(select * from Turno where idTurno=@idTurno)
begin
	delete from TurnoPacienteMedico where idTurno=@idTurno
	delete from Turno where idTurno=@idTurno
	
end
else
	select 0 as resultado

exec Delete_Turno 9;