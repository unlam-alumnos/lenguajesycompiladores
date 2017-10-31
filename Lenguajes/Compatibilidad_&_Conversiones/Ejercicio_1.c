#include<stdio.h>

char **a1; /* --> */ char *a2; /* --> */ char a3;
char *b4; /* --> */ char b5;

/*
 * Run @ https://www.jdoodle.com/c-online-compiler
 * 
 * Se debe manipular solo a a1 y b4
 */

void init();

int main() {
   
   init();
   printf("Inicio\n------\n");
   printf("a = %c\n", **a1);
   printf("b = %c\n", *b4);
   
   a1 = &b4;
   printf("\na) Hacer que 1 apunte a 4\n");
   printf("   -------------------------------\n");
   printf("    a1 = &b4; - (0 dereferencing) \n");
   printf("   -------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   b4 = *a1;
   printf("\nb) Hacer que 2 se copie en 4\n");
   printf("   ------------------------------\n");
   printf("    b4 = *a1; - (2 dereferencing) \n");
   printf("   ------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   *a1 = b4;
   printf("\nc) Hacer que 4 se copie en 2\n");
   printf("   -------------------------------\n");
   printf("    *a1 = b4; - (1 dereferencing) \n");
   printf("   -------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   *a1 = b4;
   printf("\nd) Hacer que 2 apunte a 5\n");
   printf("   -------------------------------\n");
   printf("    *a1 = b4; - (1 dereferencing) \n");
   printf("   -------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   b4 = *a1;
   printf("\ne) Hacer que 4 apunte a 3\n");
   printf("   -------------------------------\n");
   printf("    b4 = *a1; - (2 dereferencing) \n");
   printf("   -------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   *b4 = **a1;
   printf("\nf) Copiar 3 en 5\n");
   printf("   ---------------------------------\n");
   printf("    *b4 = **a1; - (3 dereferencing) \n");
   printf("   ---------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   **a1 = *b4;
   printf("\ng) Copiar 5 en 3\n");
   printf("   ---------------------------------\n");
   printf("    **a1 = *b4; - (2 dereferencing) \n");
   printf("   ---------------------------------\n");
   printf("   a1 = %c\n", **a1);
   printf("   a2 = %c\n", *a2);
   printf("   a3 = %c\n", a3);
   printf("   b4 = %c\n", *b4);
   printf("   b5 = %c\n", b5);
   
   init();
   printf("\nh) Copiar 1 en 4\n");
   printf("   No es posible copiar un >> puntero a puntero a char << dentro de un >> puntero a char <<\n");
}

void init() {
   a3 = 'x';
   b5 = 'y';
   a2 = &a3;
   a1 = &a2;
   b4 = &b5;
}