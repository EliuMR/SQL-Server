-- Backup

-- creando backup
backup database CentroMedico
to disk ='C:\Users\elium\Documents\SQLServer\Backup\CentroMedicoBP1.bak'
with no_compression, name='CentroMedicoBP1' -- sin compresion y nombre del backup

-- backup dinamico
declare @fecha varchar(12);
declare @path varchar(100);	-- path
declare @name varchar(20);  -- nombre de la base de datos
set @fecha=convert(char(8),GETDATE(),112)+ -- fecha formato yyyymmdd
			replace(convert(char(5),GETDATE(),108),':','') -- hora:minutos y eliminamos los dos puntos
set @path= 'C:\Users\elium\Documents\SQLServer\Backup\CentroMedico'+@fecha+'.bak'
set @name = 'CentroMedico'+@fecha

backup database CentroMedico
to disk= @path
with no_compression, name=@name -- sin compresion y nombre del backup
