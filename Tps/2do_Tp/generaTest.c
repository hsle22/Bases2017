#include <stdio.h>

int main(int argc, char *argv[])
{

	if(argc != 3){
		printf("Ha olvidado ingresar la cantidad de registros: ./a.out [inicio] [cantRegistros]\n"); 
    		return;
	}

   FILE *fichero;
   char nombre[10] = "test.txt";
   unsigned int i;

   fichero = fopen( nombre, "w" );
   printf( "Fichero: %s (para escritura) -> ", nombre );
   if( fichero )
      printf( "creado (ABIERTO)\n" );
   else
   {
      printf( "Error (NO ABIERTO)\n" );
      return 1;
   }
   int inicio = atoi(argv[1]);
   int cantidad = atoi(argv[2]);

   char competidor[500]="{'competidor_dni': %d, 'escuela':1, 'nombre': 'Roque','apellido': 'Gonzales', 'foto': 'esta1', 'fecha_nacimiento': '1994-07-17', 'nro_itf': 1, 'graduacion':3, 'peso':75, 'medalleroPorModalidad':[{'id_modalidad' : 2}],'medalleroPorCampeonato':[]},";
   //fprintf( fichero, "%s \n", competidor, i );
   //fprintf( fichero, "\t 2\t 3\t 4\n" );
   //fprintf( fichero, "x\tx\tx\tx\n\n" );
   fprintf( fichero, "r.db('TAEKWONDO').table('competidor').insert([" );
   for( i=inicio; i<=cantidad+inicio; i++ )
	fprintf( fichero, "{'competidor_dni': %d, 'escuela':1, 'nombre': 'Roque','apellido': 'Gonzales', 'foto': 'esta1', 'fecha_nacimiento': '1994-07-17', 'nro_itf': 1, 'graduacion':3, 'peso':75, 'medalleroPorModalidad':[{'id_modalidad' : 2}],'medalleroPorCampeonato':[]}, \n", i );
      //fprintf( fichero, "%d\t%d\t%d\t%d\n", i, i*i, i*i*i, i*i*i*i );

   fprintf( fichero, "]);" );
   fprintf( stdout, "Datos guardados en el fichero: %s\n", nombre );
   if( !fclose(fichero) )
      printf( "Fichero cerrado\n" );
   else
   {
      printf( "Error: fichero NO CERRADO\n" );
      return 1;
   }

   return 0;
}
