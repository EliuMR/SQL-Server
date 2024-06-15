-- Clausulas SQL
-- TOP
-- Order by
-- Disitinct
-- Group by
-- Where


-- TOP
select top 1 * from Paciente; -- retorna el primer registro
select top 2 * from Paciente; -- retorna el segundo registro

-- Order by
select * from Paciente order by fechaNacimiento asc; -- ordena la tabla paciente en order acendente con la columa fecha nacimiento

-- Top  y Order by
select top 1* 
from Paciente 
order by fechaNacimiento desc;

-- Distinct
select distinct idPais from Paciente; -- retorna todos lo valores idPais diferentes en la tabla Pacientes

-- Group by
-- Agrupa valores de determinado campo
select count(*) from paciente group by idPais;

-- where
-- filtrar o buscar determinados registros
select * from Paciente
where idPais='COL'; -- pacientes que sean COL

select * from Paciente
where apellido='Lopez';

select * from Paciente
where idPaciente=4; -- buscar el paciente con id 4


