#include <stdio.h>

int main()
{
	printf("Fizzbang Demo\n");
  int j = 1;
  int fizzcount = 0;
  int bangcount = 0;
  do  //start of  loop
  {
		if(j%15 == 0)
		{
		printf("fizzbang\n"); // if j is a multiple of 15, print fizzbang
		fizzcount++; // increments the values of fizz and bang trackers
		bangcount++;
		}
		else if  (j%5 == 0) // if j is a multiple of 5, print bang
		{
		printf("bang\n");
		bangcount++; // increments the value of bang tracker 
		}
		else if  (j%3 == 0) // if j is a multiple of 3, print fizz
		{
		printf("fizz\n");
		fizzcount++; // increments the value of fizz tracker
		}
		else
		printf("%d\n", j); // if none of the above parameters at met prints the value of J
		j++; 	
  } 
  while (j<=20); // when j is greater than or equal to 20 prints the values of the counters and ends the program
  printf("%d\n", fizzcount);
  printf("%d\n", bangcount);
  return 0;
}
