set sql_mode = '';

-- QUERY RANKIN PUNTAJE POR ESCUELA				
				

-- puestos individuales por escuela
select sum(R.medallaPuntaje) as puntajeTotal, R.nombre from
((select  
	case puestoCompetidor when 1 then 3 when 2 then 2 when 3 then 1 else NULL end as medallaPuntaje,
	Escuela.nombre
	from Alumno 
		inner join compiteEnCompetenciaInd on Alumno.dniAlumno = compiteEnCompetenciaInd.dniCompetidor 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais)

union all

-- puestos de team por escuela
(select 
	-- Competidor.idEquipo, 
	-- compiteEnCompetenciaTeam.idCompetencia,
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 3 when 2 then 2 when 3 then 1 else NULL end as medallaPuntaje,
	Escuela.nombre 
	from Alumno inner join Competidor on Alumno.dniAlumno = Competidor.dniCompetidor 
		inner join compiteEnCompetenciaTeam on Competidor.idEquipo = compiteEnCompetenciaTeam.idEquipo 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Competidor.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R group by R.nombre order by puntajeTotal desc;
				
				

-- QUERY RANKIN PUNTAJE POR PAIS				
				

-- puestos individuales por pais
select sum(R.medallaPuntaje) as puntajeTotal, R.nombre from
((select  
	case puestoCompetidor when 1 then 3 when 2 then 2 when 3 then 1 else NULL end as medallaPuntaje,
	Pais.nombre
	from Alumno 
		inner join compiteEnCompetenciaInd on Alumno.dniAlumno = compiteEnCompetenciaInd.dniCompetidor 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais)

union all

-- puestos de team por pais
(select 
	-- Competidor.idEquipo, 
	-- compiteEnCompetenciaTeam.idCompetencia,
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 3 when 2 then 2 when 3 then 1 else NULL end as medallaPuntaje,
	Pais.nombre 
	from Alumno inner join Competidor on Alumno.dniAlumno = Competidor.dniCompetidor 
		inner join compiteEnCompetenciaTeam on Competidor.idEquipo = compiteEnCompetenciaTeam.idEquipo 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Competidor.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R group by R.nombre order by puntajeTotal desc;
				



				
