-- JOBS

-- Función crear una fecha en formato texto

create function Fun_FechaATexto(@fecha datetime)
returns varchar(60)
as
begin
	declare @dia varchar(20)
	set @dia =(case when DATEPART(dw,@fecha)=1 -- retorna un numero de acuerdo al dia de la semana day weak
						then 'Domingo '+CONVERT(char(2),datepart(dd,@fecha)) 
			when DATEPART(dw,@fecha)=2 then 'Lunes '+CONVERT(char(2),datepart(dd,@fecha))
			when DATEPART(dw,@fecha)=3 then 'Martes '+CONVERT(char(2),datepart(dd,@fecha))
			when DATEPART(dw,@fecha)=4 then 'Miercoles '+CONVERT(char(2),datepart(dd,@fecha))
			when DATEPART(dw,@fecha)=5 then 'Jueves '+CONVERT(char(2),datepart(dd,@fecha))
			when DATEPART(dw,@fecha)=6 then 'Viernes '+CONVERT(char(2),datepart(dd,@fecha))
			when DATEPART(dw,@fecha)=7 then 'Sábado '+CONVERT(char(2),datepart(dd,@fecha))	
			end)
	declare @mes varchar(20)
	set @mes=(case when DATEPART(mm,@fecha)=1 -- retorna un numero de acuerdo al dia de la semana day weak
						then 'Enero '
			when DATEPART(mm,@fecha)=2 then 'Febrero '
			when DATEPART(mm,@fecha)=3 then 'Marzo '
			when DATEPART(mm,@fecha)=4 then 'Abril '
			when DATEPART(mm,@fecha)=5 then 'Mayo '
			when DATEPART(mm,@fecha)=6 then 'Junio '
			when DATEPART(mm,@fecha)=7 then 'Julio '
			when DATEPART(mm,@fecha)=8 then 'Agosto '
			when DATEPART(mm,@fecha)=9 then 'Septiembre '
			when DATEPART(mm,@fecha)=10 then 'Octubre '
			when DATEPART(mm,@fecha)=11 then 'Noviembre '
			when DATEPART(mm,@fecha)=12 then 'Diciembre '
			end)
	declare @fechatexto varchar(100)
	set @fechatexto=@dia+@mes
	return @fechatexto
end

select dbo.Fun_FechaATexto('20191201')


-- JOB
-- Función que cancele turnos vencidos
USE CentroMedico
select * from turno where  CONVERT(char(8),fechaTurno,112) < CONVERT(char(8),GETDATE(),112)
and estado=0; -- turnos sin atender fechar menores a la actual

-- Actualizamos estado
update Turno set estado =2 where CONVERT(char(8),fechaTurno,112) < CONVERT(char(8),GETDATE(),112)
and estado=0; -- turnos sin atender fechar menores a la actual