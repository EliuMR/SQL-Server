-- Un tipo definido por el usuario (UDT) es un tipo de datos que deriva de tipos de datos existentes, 
-- pero que, sin embargo, se considera independiente e incompatible de ellos.
-- Creando tipos de datos, para usarlo en todo el ciclo de vida de la base de datos


create type paciente from int not null; -- para id medico
create type medico from int not null; -- para id medico
create type turno from int not null; -- para turno
create type historia from int not null; -- para idHistoria
create type observacion from varchar(1000); -- para observaciones
create type  Especialidad from int not null; -- para especialidad