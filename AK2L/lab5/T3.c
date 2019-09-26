#include <stdio.h>
extern short aShort;
extern char aCharPtr[];

short cShort = 10;
char* cCharPtr= "string";

extern fun();



int main(){
  printf("%d\n", aShort);
  printf("%s\n", aCharPtr);


  fun();
  printf("%d %s", cShort, cCharPtr);
  return 0;
}
