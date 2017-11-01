// Run @ https://www.jdoodle.com/c-online-compiler

#include <stdio.h>
#include <stdlib.h>

int main() {
    int **a, **b, **c, *x;
    
    // int en heap (contador de x en 1), puntero a int en pila
    x = malloc(sizeof(int)); 
    *x = 10;
    
    // Puntero a int en heap, puntero a puntero a int en pila
    a = malloc(sizeof(int*)); 
    b = malloc(sizeof(int*));
    c = malloc(sizeof(int*));
    
    // Apunto los punteros en el heap al enterio (todo dentro del heap)
    *a = x; // (contador de x en 2)
    *b = x; // (contador de x en 3)
    *c = x; // (contador de x en 4)
    
    // Elimino la referencia de la pila al int del heap (contador de x en 3)
    printf("x = %d\n", *x);
    x = NULL;

    printf("\nx = NULL;\n");    
    printf("-------\n");
    printf("a: %d\n", **a);
    printf("b: %d\n", **b);
    printf("c: %d\n", **c);
    
    // Libero un puntero de x en el heap (contador de x en 2)
    free(a);
    a = NULL;
    printf("\nfree(a);\n");
    printf("-------\n");
    printf("b: %d\n", **b);
    printf("c: %d\n", **c);
    
    // Libero un puntero de x en el heap (contador de x en 1)
    free(b);
    b = NULL;
    printf("\nfree(b);\n");
    printf("-------\n");
    printf("c: %d\n", **c);
    
    // Libero un puntero de x en el heap (contador de x en 0). El bloque x pasa a la lista de libres
    free(c);
    c = NULL;
    printf("\nfree(c);\n");
    printf("-------\n");
}

/*

  Resultado de la ejecución:
  
    x = 10

    x = NULL;
    -------
    a: 10
    b: 10
    c: 10

    free(a);
    -------
    b: 10
    c: 10

    free(b);
    -------
    c: 10

    free(c);
    -------

*/
