-- Store procedure
-- se almacenda dentro de SQL server
-- procedimientos almacenados
-- generar un proceso de almacen, borrado, update

create procedure sp_paciente( 
							@idPaciente int) -- parametros
as 
select * from Paciente where idPaciente=@idPaciente
go -- cualquier otro procedure es independiente, es decir, es fin del procedure

exec sp_paciente 3; -- llamar el store procedure
go-- Asegúrate de que el lote anterior haya terminado

-- modificando procedure que retorne solo el nombre
alter PROCEDURE sp_paciente 
    @idPaciente INT
AS
BEGIN
    SELECT nombre 
    FROM Paciente 
    WHERE idPaciente = @idPaciente;
END;

exec sp_paciente 3;
go

-- VARIABLES y ISNULL

declare @ordenamiento char(1) -- variable
declare @ordenamiento1 char(1) 
set  @ordenamiento1  = isnull(@ordenamiento,'A') -- pregunta si el valor de la variables es nulo da un valor por defecto
print @ordenamiento1


DECLARE @entero INT
SET @entero = NULL
SELECT ISNULL(@entero, 0) AS Valor


DECLARE @decimal DECIMAL(10,2)
SET @decimal = NULL
SELECT ISNULL(@decimal, 0.00) AS Valor


DECLARE @fecha DATETIME
SET @fecha = NULL
SELECT ISNULL(@fecha, GETDATE()) AS Valor