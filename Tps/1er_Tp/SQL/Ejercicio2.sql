(select count(*) as cantidadMedallas, nombre

from
((select  
	case puestoCompetidor when 1 then 'ORO' when 2 then 'PLATA' 
		when 3 then 'BRONCE' else NULL end as medalla,
	Pais.nombre 
	from Alumno 
		inner join compiteEnCompetenciaInd on Alumno.dniAlumno = compiteEnCompetenciaInd.dniCompetidor 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais)

union all

-- puestos de team por pais
(select 
	case compiteEnCompetenciaTeam.puestoTeam when 1 then 'ORO' 
		when 2 then 'PLATA' when 3 then 'BRONCE' else NULL end as medalla,
	Pais.nombre 
	from compiteEnCompetenciaTeam
		inner join Equipo on compiteEnCompetenciaTeam.idEquipo = Equipo.idEquipo 
		inner join Competidor on Equipo.idEquipo = Competidor.idEquipo 
			inner join Alumno on Competidor.dniCompetidor = Alumno.dniAlumno 
			inner join Escuela on Alumno.idEscuela = Escuela.idEscuela 
				inner join Pais on Escuela.idPais = Pais.idPais 
				group by Equipo.idEquipo, compiteEnCompetenciaTeam.idCompetencia)) as R 
where not isNull( medalla)
group by R.nombre

order by cantidadMedallas desc limit 1
);

