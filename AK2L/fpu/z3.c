#include <stdio.h>



extern void setPrecision(int mode);


unsigned int option;


double f = 1.0;
double k = 27.0;
double res = 0;


int main(void)
{


	setPrecision(0);
	res = f/k;
	printf("Single    : %1.64f\n", res);
	res=0;

	setPrecision(2);
	res = f/k;
	printf("Double    : %1.64f\n", res);
	res=0;

	setPrecision(3);
	res = f/k;
	printf("Double Ex.: %1.64f\n", res);
	res=0;





 
    return 0;
}

























































	


	























