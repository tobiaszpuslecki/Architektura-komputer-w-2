#include <stdio.h>



extern void setRound(int mode);


unsigned int option;


double f = 1.0;
double k = 3.0;
double res = 0;


int main(void)
{


	setRound(0);
	res = f/k;
	printf("Nearest: %1.32f\n", res);
	res=0;

	setRound(1);
	res = f/k;
	printf("Down: %1.32f\n", res);
	res=0;

	setRound(2);
	res = f/k;
	printf("Up      : %1.32f\n", res);
	res=0;

	setRound(3);
	res = f/k;
	printf("Truncate: %1.32f\n", res);
	res=0;





 
    return 0;
}




























































	


	























