-- Operadores lógicos

-- AND
-- OR

-- IN
-- se encuentre
select * from turno where estado in (0,1,2,3);
select * from paciente where apellido in ('Lopez','Ramirez');

-- Like
-- patrones de busqueda
select * from Paciente where nombre like '%A%';

-- NOT
-- negar cualquier operador anterior, in o like
select * from turno where estado not in (0,1,2,3);
select * from paciente where apellido not in ('Lopez','Ramirez');
select * from Paciente where nombre not like '%E%';

-- Between
-- filtrar registros en un determinado rango
select * from Paciente where nombre between 'Carl' and 'Cecilia'; -- se basa en el abecedario texto entre dos cadenas
select * from Paciente where fechaNacimiento between '1990-01-01' and '2005-01-01';

-- Combinación
select * from Paciente where nombre not like '%E%' or fechaNacimiento between '1990-01-01' and '2005-01-01'; 

