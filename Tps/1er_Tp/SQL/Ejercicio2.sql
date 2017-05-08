set sql_mode = '';
-- QUERY MEDALLAS POR PAIS
-- Falta tomar maximo de cada columna	
-- puestos individuales por pais
(select 
sum(oro) as oro, sum(plata) as plata,sum(bronce) as bronce , nombre  
from
((select  
	case puestoCompetidor when 1 then 1 else 0 end as oro,
	case puestoCompetidor when 2 then 1 else 0 end as plata,
	case puestoCompetidor when 3 then 1 else 0 end as bronce,

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
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 1 else 0 end as oro,
	case compiteEnCompetenciaTeam.puestoTeam when 2 then 1 else 0 end as plata,
	case compiteEnCompetenciaTeam.puestoTeam when 3 then 1 else 0 end as bronce,

	Pais.nombre 
	from compiteEnCompetenciaTeam
		inner join Equipo on compiteEnCompetenciaTeam.idEquipo = Equipo.idEquipo 
		inner join Competidor on Equipo.idEquipo = Competidor.idEquipo 
			inner join Alumno on Competidor.dniCompetidor = Alumno.idAlumno 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Equipo.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R 
 group by R.nombre 
 order by oro desc, plata desc, bronce desc
);



