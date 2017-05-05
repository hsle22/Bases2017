set sql_mode = '';

-- QUERY ARBITROS POR PAIS

select P.`nombre`, A.nombre, A.apellido from Arbitro as A 
	inner join Pais as P on P.`idPais` = A.`idPais`;				

				
				
