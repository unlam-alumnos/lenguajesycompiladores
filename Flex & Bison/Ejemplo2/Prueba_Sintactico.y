%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include "y.tab.h"
int yystopparser=0;
FILE  *yyin;

%}

%token PROGRAM
%token DEFINE
%token ENDDEFINE
%token CONST_INT
%token CONST_REAL
%token CONST_STR
%token REAL
%token INTEGER
%token STRING
%token BEGINP
%token ENDP
%token IF THEN ELSE ENDIF
%token FOR TO DO ENDFOR
%token WHILE ENDW
%token REPEAT UNTIL
%token OP_LOG
%token ID
%token OP_COMPARACION
%token OP_AS
%token OP_SURES
%token OP_MULTDIV
%token COMA
%token P_A P_C
%token C_A C_C
%token LONG
%token IN


%%
programa:  	   
	PROGRAM {printf(" Inicia COMPILADOR\n");} est_declaracion algoritmo    
	{printf(" Fin COMPILADOR ok\n");};

est_declaracion:
	DEFINE {printf("     DECLARACIONES\n");} declaraciones ENDDEFINE {printf(" Fin de las Declaraciones\n");}
        ;

declaraciones:         	        	
             declaracion
             | declaraciones declaracion
    	     ;

declaracion:  
           REAL lista_var 
	   |STRING lista_var 
           |INTEGER lista_var
           ;

lista_var:  
	 ID
	 |ID COMA lista_var 
 	 ;

algoritmo: 
         BEGINP{printf("      COMIENZO de BLOQUES\n");} bloque ENDP
         ;

bloque:  
      sentencia
      |bloque sentencia
      ;

sentencia:
  	 ciclo
	 |seleccion  
	 |asignacion
         
	 ;

ciclo:
     REPEAT { printf("     REPEAT\n");}bloque UNTIL condicion 
          ;

asignacion: 
          ID OP_AS expresion {printf("    ASIGNACION\n");}
	  ;


seleccion: 
    	 IF  condicion THEN bloque ENDIF{printf("     IF\n");}
	| IF  condicion THEN bloque ELSE bloque ENDIF {printf("     IF con ELSE\n");}	 
;

condicion:
         comparacion 
         |comparacion OP_LOG comparacion
	 ;

comparacion:
	   expresion OP_COMPARACION expresion
	   ;

expresion:
         termino
	 |expresion OP_SURES termino
 	 ;

termino: 
       factor
       |termino OP_MULTDIV factor
       ;

factor: 
      ID
      | CONST_INT
      | CONST_REAL
      | CONST_STR  
      ;

%%
int main(int argc,char *argv[])
{
  if ((yyin = fopen(argv[1], "rt")) == NULL)
  {
	printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  }
  else
  {
	yyparse();
  }
  fclose(yyin);
  return 0;
}
int yyerror(void)
     {
       printf("Syntax Error\n");
	 system ("Pause");
	 exit (1);
     }

