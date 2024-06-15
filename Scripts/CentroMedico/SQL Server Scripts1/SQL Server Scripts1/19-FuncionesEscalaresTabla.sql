-- Funciones Escalares y tipo Tabla

-- funciones escalares
create function concatenar(
							@apellido varchar(50),
							@nombre varchar(50)
							)
returns varchar(100)
as
begin
	declare @resultado varchar (100)
	set @resultado = @apellido+' '+@nombre
	return @resultado
end

select dbo.concatenar('Lopez','Roberto')



create function ObtenerPais (@idPaciente int)
returns varchar(50)
as
begin
	declare @pais varchar(50)
	set @pais=(Select Ps.Pais from Paciente P
	inner join Pais Ps on Ps.idPais=P.idPais
	where idPaciente=@idPaciente)
	return @pais
	
end

select dbo.ObtenerPais(2)


-- Funciones tablas

create function listaPaises()
returns @paises table(idPais char(3), pais varchar(50))
as 
begin
	insert into @paises values('ESP','España')
	insert into @paises values('MXM','Mexico')
	insert into @paises values ('PER','PERU')
	return 
end
-- ejecutamos
select * from dbo.listaPaises()