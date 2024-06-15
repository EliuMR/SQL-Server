-- Vistas
-- almacena una consulta localmente, para que los resultados sean rápidos en posteriores consultas

-- vista para obtener los turnos que están pendientes
create view PacienteYTurnos_pendientes as 
	select P.nombre,P.idPaciente,P.apellido, TP.idTurno, T.estado
	from Paciente P
	inner join TurnoPacienteMedico TP
	on TP.idPaciente=P.idPaciente
	inner join Turno T on
	T.idTurno=TP.idTurno
	where isnull(T.estado,0)=0

-- probar Vista
-- se le da un tratamiento como una tabla
select * from PacienteYTurnos_pendientes;



use CentroMedico
-- vista que almacene medicos con sus especialidades
create view view_MedicoEspecialidad as 
	select M.Nombre,M.idMedico,E.Especialidad from Medico as M
	inner join MedicoEspecialidad ME on ME.idMedico=M.idMedico
	inner join Especialidad E on E.idEspecialidad=ME.idEspecialidad
select * from view_MedicoEspecialidad;
