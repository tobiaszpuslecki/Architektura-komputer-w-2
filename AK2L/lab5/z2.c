#include <stdio.h>


unsigned int ts1=0;

extern unsigned long long stamp();

/*unsigned int stamp()
{
	unsigned int ts=0;
	 __asm__(

	      "xor %%eax, %%eax \n"
	      "cpuid \n"
	      "rdtsc \n"
	      :"=a"(ts)
	      :
	      );	
	return ts;
}*/






int main(void)
{

for(int i =0; i<10;i++)
{
  printf("T[]: %lu\n",stamp());
}

  return 0;
}











 
