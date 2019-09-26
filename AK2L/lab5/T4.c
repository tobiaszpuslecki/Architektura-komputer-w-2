#include <stdlib.h>

extern long long stamp();

extern int registerOp();
extern int writeOp();
extern int memoryOp();
extern int printOp();

long long registerTimeVar, memoryTimeVar, printfTimeVar, writeTimeVar;



int main()
{

  for(int i=0; i<100; i++)
  	registerTimeVar+=registerOp();
  printf("Avg time of registerOp: %lld", registerTimeVar/100);

  for(int i=0; i<100; i++)
  	memoryTimeVar+=memoryOp();
  printf("Avg time of memoryOp: %lld", memoryTimeVar/100);

  for(int i=0; i<100; i++)
  	printTimeVar+=printOp();
  printf("Avg time of printOp: %lld", printTimeVar/100);

  for(int i=0; i<100; i++)
  	writeTimeVar+=writeOp();
  printf("Avg time of writeOp: %lld", writeTimeVar/100);


return 0;
}
