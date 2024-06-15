-- DML Manipulación de datos

select * from Paciente;

-- UPDATE: actualizar o modificar registros
-- actualizar la columna Obsevaciones de la tabla Paciente
update Paciente set Observacion='Sin observación';
-- es importante filtrar para no hacer una manipulación masiva en la base de datos

update Paciente set email='ejemplo@gmail.com' where idPaciente=2;

-- cambiar varios campos de un registro
update Paciente set email='ejemplo@gmail.com',domicilio='Plantas 3' where idPaciente=2;

-- DELETE:  eliminar registros

-- eliminar todos los registros de la tabla
delete from Paciente; 

-- eliminar el registro con idPaciente 5
delete from Paciente where idPaciente=5;

--Deberás insertar un nuevo Turno, utilizando cualquiera de los dos métodos de Inserción (SSMS o comando) con los siguientes valores:
insert into Turno(fechaTurno,estado,observacion)
values ('2019-01-22 10:00',0,'Turno pendiente de aprobación');

select * from Turno;
insert into TurnoPacienteMedico(idTurno,idPaciente,idMedico)
values(6,4,1);

