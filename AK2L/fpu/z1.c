#include <stdio.h>
#include <math.h>

extern int fpuStatus();
//extern void stackOverflow();

float zero = 0.0;
float one = 1.0;
float result = 0.0;

float denormalized=powf(2.0,-140.0);


int main()
{
	printf("Before zero division: %d\n", fpuStatus());

	result=one/zero;		
	
	printf("After zero division: %d\n", fpuStatus());


	printf("Before denorm. op.: %d\n", fpuStatus());

	result=denormalized/one;		
	
	printf("After denorm. op.: %d\n", fpuStatus());





	return 0;
}


/*
	flds	one
	flds	zero
	fdivrp	%st, %st(1)
	fstps	result
*/
