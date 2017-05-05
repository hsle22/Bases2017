set sql_mode = '';
-- QUERY MEDALLAS POR PAIS
	
-- puestos individuales por pais
(select count(*) as cantidad, nombre  from 

((select  
	case puestoCompetidor when 1 then 'ORO' when 2 then 'PLATA' when 3 then 'BRONCE' else NULL end as medalla,
	Pais.nombre 
	from Alumno 
		inner join compiteEnCompetenciaInd on Alumno.idAlumno = compiteEnCompetenciaInd.dniCompetidor 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais)

union all

-- puestos de team por pais
(select 
	-- Competidor.idEquipo, 
	-- compiteEnCompetenciaTeam.idCompetencia,
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 'ORO' when 2 then 'PLATA' when 3 then 'BRONCE' else NULL end as medalla,
	Pais.nombre 
	from Alumno inner join Competidor on Alumno.idAlumno = Competidor.dniCompetidor 
		inner join compiteEnCompetenciaTeam on Competidor.idEquipo = compiteEnCompetenciaTeam.idEquipo 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Competidor.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R group by R.nombre);
				



-- QUERY MEDALLAS POR ESCUELA
	
-- puestos individuales por pais
(select count(*) as cantidad, nombre  from 

((select  
	case puestoCompetidor when 1 then 'ORO' when 2 then 'PLATA' when 3 then 'BRONCE' else NULL end as medalla,
	Escuela.nombre 
	from Alumno 
		inner join compiteEnCompetenciaInd on Alumno.idAlumno = compiteEnCompetenciaInd.dniCompetidor 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais)

union all

-- puestos de team por pais
(select 
	-- Competidor.idEquipo, 
	-- compiteEnCompetenciaTeam.idCompetencia,
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 'ORO' when 2 then 'PLATA' when 3 then 'BRONCE' else NULL end as medalla,
	Escuela.nombre 
	from Alumno inner join Competidor on Alumno.idAlumno = Competidor.dniCompetidor 
		inner join compiteEnCompetenciaTeam on Competidor.idEquipo = compiteEnCompetenciaTeam.idEquipo 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Competidor.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R group by R.nombre);
