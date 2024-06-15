-- Tablas Temporales en memoria
-- una vez que el script se termine de ejecutar la tabla temporal no existe más

declare @mitable table (id int identity(1,1),
						pais varchar(50));
insert into @mitable values ('Mexico');
insert into @mitable values ('Peru');
insert into @mitable values ('España');
insert into @mitable values ('Argentina');
select * from @mitable;

-- Tabla física
-- va existir mientras no se cierre el motor SQL,despues de reiniciar la tabla se borra
create table #miTabla (id int identity(1,1), -- con # se diferencia entre las reales
						nombre varchar(50),
						apellido varchar(50))

insert into #miTabla values ('Alejandro','Lopes')
insert into #miTabla values ('Roberto','Muñoz')
insert into #miTabla values ('Marcelo','Castillo')
select * from #miTabla

drop table #miTabla; -- borramos la tabla




-- Tablas en un store procedure
-- tabla temporal que alamacena los turnos de todos los pacientes

declare @turnos table (id int identity, idTurno turno, idPaciente paciente)
declare @idPaciente paciente
set @idPaciente=8;

insert into @turnos (idTurno,idPaciente)
	select TP.idTurno,TP.idPaciente from Paciente P
	inner join TurnoPacienteMedico TP on TP.idPaciente=P.idPaciente

declare @i int
set @i=1
while @i <= (select COUNT(*) from @turnos)
begin
	if
	(select idPaciente from @turnos where id=@i)<>8
		delete from @turnos where id=@i
	set @i=1+@i
end