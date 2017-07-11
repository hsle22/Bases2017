1)
r.db('TAEKWONDO').table('Competencia').filter(function (c) { return c("campeonato")("campeonato_id").eq(1);})
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
r.db('TAEKWONDO').table('Escuela').map(function(elem) {return {id: elem('id_escuela') , nombre: elem('nombre') , cantidadTotal: elem('cantMedallasPorCampeonato').sum('medallas')}});

3)r.db('TAEKWONDO').table('Escuela').map(function(elem) 
{var res = elem('cantMedallasPorCampeonato').max('medallas');
return {id: elem('id_escuela') , nombre: elem('nombre') , campeonatoMasMedallas: res('campeonato_id')}});

4)r.db('TAEKWONDO').table('Arbitros').filter( function(elem)
{return elem('Campeonato').count().ge(4);});

4) con map reduce:
r.db('TAEKWONDO').table('Arbitros').filter( function(momo) {return momo('Campeonato').map(function (elem) {return 1}).reduce(function(left,right) {return left.add(right);}).ge(4)});

5)r.db('TAEKWONDO').table('Campeonato').map(function(elem) 
{var res = elem('escuelas').max('CantidadDeInscriptos');
return {id: elem('id_campeonato') , nombre: elem('nombre') , EscuelaConMayorCantInscript: res('escuela_id')}});

6)r.db('TAEKWONDO').table('Modalidad').pluck('id_modalidad','CompetidorEnMedalleroHistorico');


