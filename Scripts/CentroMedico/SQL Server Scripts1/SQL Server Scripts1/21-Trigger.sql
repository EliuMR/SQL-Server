-- TRIGGERS
-- Disparador ante un evento como: insert, update y delete

-- Trigger insert para guardar un log para alamacenar un suceso en una tabla si el paciente es de MXN

create table Paciente_Log(idPaciente paciente,
				idPais char(3),
				fechaAlta datetime)


create Trigger PacienteCreado on Paciente -- cuando la tabla Paciente registre un cambio se aejecuta el trigger
after insert -- despues de insert
as
	if (select idPais from inserted)='MEX'-- ultimo registro insertado
		insert into Paciente_Log (idPaciente,idPais,fechaAlta)
			select i.idPaciente,i.idpais, getdate() from inserted i

-- probando trigger
select * from Paciente
insert into Paciente values ('123135','Jose','Carillo','1998-11-05','Cactus 16','PER','','','');
select * from Paciente_Log;
insert into Paciente values ('0123135','Jose','Carillo','1998-11-05','Cactus 16','MEX','','','');
select * from Paciente_Log;

-- Trigger update
-- un registro modificado
alter table Paciente_Log add fechaModificacion Datetime;
select * from Paciente_Log

create trigger PacientesModificados on Paciente
after update
as
if exists (select idPaciente from Paciente_Log
			where idPaciente=(select idPaciente from inserted))
	update Paciente_Log set fechaModificacion= GETDATE()
		where idPaciente=(select idPaciente from inserted)
else
	insert into Paciente_Log (idPaciente,idPais,fechaModificacion)
	select idPaciente, idPais, GETDATE() from inserted

update Paciente set nombre='Ivan' where idPaciente=1;
select * from Paciente_Log;


/*
El objetivo de esta clase es crear un Trigger de tipo DELETE, que deberá actualizar la tabla
PacienteLog, en la cuál deberán agregar un nuevo campo fechaBaja, que se actualizará al eliminar
un Paciente.
Para este ejercicio solo se debe utilizar la tabla Paciente.
1. Insertar un nuevo Paciente en la tabla Paciente, que se utilizará para probar el 
funcionamiento del Trigger.
2. Agregar un nuevo campo fechaBaja en la tabla PacienteLog.
3. Crear el Trigger utilizando las sentencias FOR DELETE y FROM DELETED, basándose 
en el ejemplo anterior UPDATE
4. Eliminar el paciente de la tabla Paciente.
5. Comprobar que se haya insertado el registro en PacienteLog
Nota: No se utiliza AFTER DELETE, ya que en ese caso perderíamos los datos antes de
actualizar nuestro Log.
*/
alter table Paciente_Log add fechaBaja Datetime;
select * from Paciente_Log

create Trigger Paciente_Baja on Paciente
For Delete
as 
if exists (select idPaciente from Paciente_Log
			where idPaciente=(select idPaciente from deleted))
	update Paciente_Log set fechaBaja= GETDATE()
		where idPaciente=(select idPaciente from deleted)
else
	insert into Paciente_Log (idPaciente,idPais,fechaBaja)
	select idPaciente, idPais, GETDATE() from deleted

delete Paciente where DNI='123135';
select * from Paciente_Log;