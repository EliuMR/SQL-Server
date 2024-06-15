-- Operadores Ariméticos

-- Suma +

DECLARE @num1 DECIMAL(4,2) = 2.00;
DECLARE @num2 DECIMAL(4,2) = 7.00;
DECLARE @result DECIMAL(4,2);

SET @result = @num1 + @num2;

SELECT @result AS Result;

Select ('dasd'+'dasda¿') AS Result; --concatena

-- Resta 
SET @result = @num1 - @num2;

SELECT @result AS Result;

-- Modulo
SET @result = @num1%@num2;

SELECT @result AS Result;


-- Operadores de igualdad
 

DECLARE @num1 DECIMAL(4,2) = 2.00;
DECLARE @num2 DECIMAL(4,2) = 7.00;
if @num1<@num2
	print 'Valor uno mayor'
if @num1<>@num2
	print 'Valores distintos'
DECLARE @cad1 varchar(20) = 'PEDRO';
DECLARE @cad2 varchar(20) = 'JUAN';
if @cad1>@cad2
	print 'Nombre uno mayor'
if @cad1<>@cad2
	print 'Nombres diferentes'
 
