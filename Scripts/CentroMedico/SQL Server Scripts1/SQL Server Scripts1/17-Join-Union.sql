-- INNER JOIN
select * from paciente;
select * from TurnoPacienteMedico;

select P.idPaciente,P.nombre,
M.idMedico,
M.idTurno
from Paciente P
inner join TurnoPacienteMedico M on
M.idPaciente=P.idPaciente;


-- LEFT JOIN
select * 
from Paciente P
LEFT JOIN TurnoPacienteMedico M on
M.idPaciente=P.idPaciente;


-- RIGHT JOIN
select *
from Paciente P
RIGHT JOIN TurnoPacienteMedico M on
M.idPaciente=P.idPaciente;


-- UNION
select * from Turno where idTurno<5
union
select * from Turno where idTurno>=5

select * from Turno where idTurno>=5
union all
select * from Turno where idTurno<5