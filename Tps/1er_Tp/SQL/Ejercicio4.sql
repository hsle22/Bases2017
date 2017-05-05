-- competidores que compiten posta en individuales
SET @dniCompetidor = 2;
select * from 
(select C.dniCompetidor, CI.puestoCompetidor, M.Modo from Competidor as C 
	inner join compiteEnCompetenciaInd as CI 
	on C.dniCompetidor = CI.dniCompetidor
		inner join Competencia as CMP 
		on CMP.idCompetencia = CI.idCompetencia
			inner join Modalidad M
			on M.idModalidad = CMP.idModalidad
			
union all
		
-- competidores que compiten posta en teams		
select C.dniCompetidor, CT.puestoTeam, M.Modo from Competidor as C 		
	inner join compiteEnCompetenciaTeam as CT
	on C.idEquipo = CT.idEquipo 
		inner join Competencia as CMP 
		on CMP.idCompetencia = CT.idCompetencia
			inner join Modalidad M
			on M.idModalidad = CMP.idModalidad ) as S where S.dniCompetidor = @dniCompetidor;