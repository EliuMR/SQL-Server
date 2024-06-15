-- Subconsultas y alias de tablas
use CentroMedico;

select 
apellido,nombre, idPaciente, Observacion,
(	select Pais from Pais where P.idPais=idPais
) as Pais
from Paciente P