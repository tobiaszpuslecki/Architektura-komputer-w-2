#include <stdio.h>



int fpuStat();
int fpuSetControl();
double f = 1;
double k = 3;
double j = 3;
double res = 0;

int main()
{
	

	printf("%x\n", fpuStat());
	
	res = f/k;
	printf("%x, %x\n", fpuStat(), *(unsigned int*)&res);

	res = 0;
	fpuSetControl();
	res = f / j;	

	printf("%x, %x\n", fpuStat(), *(unsigned int*)&res);

	res = f - k;

	return 0;
}
