-- categorias correspondientes a competencias individuales
select Modalidad.idModalidad, Modalidad.Modo, 
	Modalidad.edadMinima, Modalidad.edadMaxima,
	Modalidad.pesoMinimo, Modalidad.pesoMaximo,
	Modalidad.sexo,
	Alumno.nombre, Alumno.apellido, 
	null equipo 
	from compiteEnCompetenciaInd ind 
	inner join Competencia on Competencia.idCompetencia = ind.idCompetencia
	inner join Modalidad on Competencia.idModalidad = Modalidad.idModalidad
	inner join Alumno on ind.dniCompetidor = Alumno.idAlumno 
union all
-- categorias correspondientes a competencias por equipo
select Modalidad.idModalidad, Modalidad.Modo, 
	Modalidad.edadMinima, Modalidad.edadMaxima,
	Modalidad.pesoMinimo, Modalidad.pesoMaximo,
	Modalidad.sexo,
	Alumno.nombre, Alumno.apellido, 
	Equipo.nombre 
	from compiteEnCompetenciaTeam team 
	inner join Equipo on Equipo.idEquipo = team.idEquipo 
	inner join Competencia on Competencia.idCompetencia = team.idCompetencia 
	inner join Modalidad on Competencia.idModalidad = Modalidad.idModalidad 
	inner join Competidor on Competidor.idEquipo = Equipo.idEquipo 
	inner join Alumno on Alumno.idAlumno = Competidor.dniCompetidor 
order by 2; -- ordeno por categoria 
