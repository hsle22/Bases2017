select Pais.nombre, Equipo.nombre 
	from Equipo 
	inner join Competidor on Competidor.idEquipo = Equipo.idEquipo 
	inner join Alumno on Alumno.idAlumno = Competidor.dniCompetidor 
	inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
	inner join Pais on Pais.idPais = Escuela.idPais
group by Equipo.idEquipo
order by Pais.nombre;
