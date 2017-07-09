1)
r.db('TAEKWONDO').table('competencia').filter(function (c) { return c("campeonato")("campeonato_id").eq(2);})
.concatMap(function (elem){
  return elem('encuentrosGanadores');
}).group(r.row('competidor_dni')).ungroup().map(
    function (doc) {
        return { dni: doc('group'), total: doc('reduction').sum(
            function (set) {
                return set('gano').add();
            }
        )};
    }
);

2)
r.db('TAEKWONDO').table('Escuela').map(function(elem) {return {id: elem('id_escuela') , nombre: elem('nombre') , cantidadTotal: elem('cantMedallas').sum('medallas')}});

3)r.db('TAEKWONDO').table('Escuela').map(function(elem) 
{var res = elem('cantMedallas').max('medallas');
return {id: elem('id_escuela') , nombre: elem('nombre') , campeonatoMasMedallas: res('campeonato_id')}});

4)r.db('TAEKWONDO').table('Arbitro').filter( function(elem)
{return elem('Campeonato').count().ge(4);});

5)r.db('TAEKWONDO').table('campeonato').map(function(elem) 
{var res = elem('escuelas').max('CantidadDeInscriptos');
return {id: elem('id_campeonato') , nombre: elem('nombre') , EscuelaConMayorCantInscript: res('escuela_id')}});

6)r.db('TAEKWONDO').table('Modalidad').pluck('id_modalidad','CompetidorEnMedalleroHistorico');


