#include <stdio.h> 
#include <string.h> 
#include <alloc.h> 
#include <process.h> 

int main(void) {
	struct uno {
		int i;
		char * f;
	} a;
	union dos {
		int i;
		char * f;
	} b, c;
	union tres {
		int i;
		char * f;
	} d;
	
  a.i = 4000 ;                                  // 1
  a.f = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" ; // 2
  b.i = 5000 ;                                  // 3
  b.f = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb" ; // 4
  d = b ;                                       //5
  
	return 0;
}