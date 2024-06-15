-- Funciones de agregado

-- MAX
select * from Pago;
-- seleccionar la fecha más reciente
select max(fecha) from Pago;

-- MIN
-- seleccionar el menor monto
select min(mono) from Pago;

-- SUM
-- sumatoria de un campo numérico
select sum(mono) as SumaMonto from Pago;
-- suma 20 a cada registro y luego suma todo el campo
select sum(mono+20) as SumaMonto from Pago;

-- AVG
-- average, promedio de un campo
select avg(mono) as MontoPromedio from Pago;

-- Count
-- cuenta el numero de registros
select count(*) as CantidadPacientes from Paciente;

-- having
select estado from Turno
group by estado
having count(estado)>1;