set sql_mode = '';

-- QUERY ARBITROS POR PAIS

select P.`nombre`, A.nombre, A.apellido as CantArbitros from Arbitro as A 
	inner join Pais as P on P.`idPais` = A.`idPais` group by P.nombre;				

				
				
