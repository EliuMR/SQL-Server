-- TRANSACCIONES
-- actualizar tablas
-- validar tablas
-- todo lo que tenga que ver con la alteración de tablas

select * from Paciente;

begin transaction
	update Paciente set telefono='4444' where idPaciente=1; -- se debe terminar la transacción para seguir usando la tabla
if @@ROWCOUNT = 1 -- cuantos registros fueron cambiados en la intrucción inmediata anterior
	commit transaction -- confirmar el update, si no no se hace el cambio
else -- por ejemplo si se hace cambio a dos registros
	rollback transaction -- cancelar update y regresa a como estaba
select * from Paciente;


begin transaction
	update Paciente set telefono='4444' where NOMBRE='Carlos'; -- se debe terminar la transacción para seguir usando la tabla
if @@ROWCOUNT = 1 -- cuantos registros fueron cambiados en la intrucción inmediata anterior
	commit transaction -- confirmar el update, si no no se hace el cambio
else -- por ejemplo si se hace cambio a dos registros
	rollback transaction -- cancelar update y regresa a como estaba


select * from Turno;
begin transaction
	delete from Turno where estado=0
if @@ROWCOUNT=1
	commit transaction
else
	rollback transaction

