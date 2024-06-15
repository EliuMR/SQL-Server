-- DDL sentencias

-- editando tabla
-- agregando un campo
alter table Paciente add estado smallint;
select * from Paciente;
-- cambiando el tipo de dato
alter table Paciente alter column estado bit;
-- eliminando campo
alter table paciente drop column estado;


-- Creando una foregin key
-- tabla paciente a tabla Pais, previamente borrando dicha tabla
-- Tener cuidado desde dónde va la referencia (tabla)
Alter table Paciente
add foreign key (idPais) references Pais(idPais)

/*
Deberás crear el Tipo de Dato Especialidad INT
Una vez creado el tipo Especialidad, deberás asignarlo en el campo idEspecialidad de las tablas Especialidad y MedicoEspecialidad.
Recuerda: No dudes en consultar cualquier duda que tengas.
*/
select * from Especialidad;
alter table Especialidad alter column idEspecialidad Especialidad;
select * from MedicoEspecialidad;
alter table MedicoEspecialidad alter column idEspecialidad Especialidad;


-- CREATE Función
create function fun1(@var int)
returns  int -- tipo de dato que retorna
as
begin
	set @var=@var+5
	return @var
end

-- la llamanos
select dbo.fun1(246);


-- DROP
-- borrar tablas o bases de datos
-- Tabla de ejemplo
create table Ejemplo (campo int, campo1 int)
drop table Ejemplo;
select * from Ejemplo;


-- TRUNCATE
-- eliminar registros de una tabla
-- Tabla de ejemplo
create table Ejemplo (campo int, campo1 int);
insert into Ejemplo(campo,campo1) values (1,2),(2,3);
select * from Ejemplo;
truncate table Ejemplo; -- Reinicia

