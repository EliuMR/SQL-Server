select * from Especialidad;
insert into Especialidad values ('General')

-- Roles
-- Pemisos a un grupo de usuario para no ir uno por uno
-- Agrupar privilegios
 
 -- crando un rol
 create role Pagos authorization dbo;
 -- asignando role 
 alter role Pagos add Member UsuarioPrueba2; 