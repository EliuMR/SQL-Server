-- Estructura de control

-- SENTENCIA IF
declare @idPaciente int -- declaramos una variable
declare @idturno int

set @idPaciente=2 -- asignamos un valor

if @idPaciente=2  -- si se cumple la condición ejecuta todo el bloque begin-end
begin
	set @idturno=3
	select * from Paciente where idPaciente=@idPaciente
	print @idturno
end
else -- cuando la condición de if no se cumple
begin
	print 'No se cumple la condición'
end


-- Función EXISTS
-- exiten objetos a determinada consulta

if exists(select * from Paciente where idPaciente=2)
	print 'existe'


-- Estructra WHILE
-- se ejecuta codigo hasta que se cumple una condición
declare @contador int=0
while @contador <= 10
begin
	print @contador
	set @contador=1+@contador
end


-- Condicional CASE
declare @valor int
declare @resultado char(10)=''
set @valor=20

set @resultado=(case
				when @valor =10 then 'rojo'
				when @valor = 20 then 'verde'
				else 'naranja'
				end)
print @resultado

-- usando CASE en una consulta
select *, (case
				when estado =10 then 'rojo'
				when estado = 20 then 'verde'
				else 'naranja'
				end) as Color from Turno

-- RETURN
-- salir del script
-- si estoy en un procedimiento almacenado, se sale forsozamente a la consola
declare @contador int=0
while @contador <= 10
begin
	print @contador
	set @contador=1+@contador
	if @contador=3
		return 
	print 'Antes de salir'
end

-- BREAK
-- Va salir el bucle antes, pero ejecuta el resto
declare @contador int=0
while @contador <= 10
begin
	print @contador
	set @contador=1+@contador
	if @contador=3
		break
	print 'Antes de salir'
end
print('Sigue ejecutando')


-- TRY CATCH
-- manejo de errrores en el tiempo de ejecución, devolver un error más específico
declare @contador int

begin try  --  si exite un error en el tiempo de ejecución se lo manda al catch para saber qué hacer
	set @contador='texto'
end try

begin catch
	print 'No fue posible tal asignación'
end catch