-- Funciones texto


-- Funciones RIGHT o LEFT
-- obtener caracteres a la derecha o izquierda de char

declare @var varchar(20)
set @var='Ramiro'
print(left(@var,1)) -- un caracter al inicio
print(right(@var,2)) -- dos caracter antes del final

/*
Obtener un listado de las iniciales de los pacientes, leyendo los 
campos nombre y apellido, utilizando la función LEFT y el operador + 
para concatenar las iniciales y obtener el resultado.
*/
declare @nombre varchar(20);
declare @apellido varchar(20);
declare @conteo int=1;
while @conteo-1<(select COUNT(*) from Paciente)
begin
	set @nombre=(select LEFT(nombre,1) from Paciente where idPaciente=@conteo)
	set @apellido=(select LEFT(apellido,1) from Paciente where idPaciente=@conteo)
	set @conteo=1+@conteo
	print @nombre+@apellido
end
;


-- LEN
-- contar la cantidad de caracteres de una variable var
declare @var varchar(20);
set @var='Ramiro';
print(len(@var));
/*
Obtener un listado de la cantidad de caracteres que tiene 
el campo Domicilio de la tabla Paciente.
*/
select * from Paciente
declare @conteo int=1;
declare @TamanoDomicilio int;
while @conteo-1<(select COUNT(*) from Paciente)
begin
	set @TamanoDomicilio= (select len(domicilio) from Paciente where idPaciente=@conteo);
	print (@TamanoDomicilio);
	set @conteo=1+@conteo
end
;


-- Lower Upper
-- formatear variables de tipo texto
-- lower:todo a minusculas
-- upper: todo a mayusculas

declare @var varchar(20);
set @var='ramiro';
print(Lower(@var));
print(Upper(@var));
print(left(Upper(@var),1)+right(Lower(@var),len(@var)-1));


-- Replace
-- sustituir un valor por otro en texto
declare @var varchar(20);
set @var='ram@ro';
select REPLACE(@var,'@','');


-- Replicate
-- repetir una cantidad de veces un string
print Replicate('9',10)


-- Funciones Ltrim Rtrim
-- eliminar espacios al final o principio

declare @var varchar(20)
set @var='    Ramiro      '
declare @var1 varchar(20)
set @var1='Gonzales        '
select Rtrim(LTRIM(@var)) +' '+RTRIM(@var1)


-- CONCAT
declare @var varchar(20)
set @var='    Ramiro      '
declare @var1 varchar(20)
set @var1='Gonzales        '
select CONCAT(Rtrim(LTRIM(@var)),' ',RTRIM(@var1))



-- GETDATE GATUTCDATE
-- almacenar la fecha y hora de un registro creado
select GETDATE() -- hora del sistema instalado
select GETUTCDATE() -- hora medida por el meridiano


-- DATEADD
-- agregar a una fecha periodos de tiempo
select DATEADD(DAY,-2,GETDATE())
select DATEADD(hour,-2,GETDATE())


-- DATEDIFF
-- diferencia entre dos fechas
-- en que formato, minutos, horas, dias, meses
select DATEDIFF(day,getdate(),DATEADD(DAY,-2,GETDATE()))

-- DATEPART
-- obtener un intervalo en una fecha
select DATEPART(day, getdate())

-- ISDATE
-- evaluar si una fecha especifica tiene el formato específico
print isdate(getdate()) -- retorna 1
print isdate('dasda') -- retorna 0
print isdate('20191215') -- retorna 1
print isdate('20191515') -- retorna 0
print isdate('20191205 12:51:15') -- retorna 1




-- Funciones de conversión
-- CAST: funcion generica convierte en un dato a otro (de decimal a entero)
-- CONVERT: con más detalle realiza tal conversión

declare @numero money;
set @numero=500.40;
select CAST(@numero as int) as numero;
select *,CAST(idPaciente AS money) from Paciente;


declare @numero money;
set @numero=500.40;
select CONVERT(int,@numero) as numero;


declare @fecha datetime;
set @fecha=GETDATE();
print @fecha
select CONVERT(char(18),@fecha);
select CONVERT(char(18),@fecha,104); -- Convierte la fecha al otro tipo de fecha en este caso el 112 de server sql