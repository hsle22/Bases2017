select distinct Arbitro.nroPlacaArbitro, Arbitro.nombre, Arbitro.apellido 
	from puestoArbitroEnRing 
	inner join Arbitro on puestoArbitroEnRing.nroPlacaArbitro = Arbitro.nroPlacaArbitro 
	inner join arbitrosEnCompetencias on arbitrosEnCompetencias.nroPlacaArbitro = Arbitro.nroPlacaArbitro 
	inner join Competencia on Competencia.idCompetencia = arbitrosEnCompetencias.idCompetencia 
	inner join Modalidad on Modalidad.idModalidad = Competencia.idModalidad 
	where puestoArbitroEnRing.puesto = 'JEFE' and Modalidad.Modo = 'Combate';
