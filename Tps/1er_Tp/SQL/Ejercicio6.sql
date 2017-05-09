set sql_mode = '';

-- QUERY ARBITROS POR PAIS

select P.`nombre`, A.apellido, A.nombre 
from Arbitro as A inner join Pais as P on P.`idPais` = A.`idPais` 
order by P.nombre, A.apellido, A.nombre;
				
				
