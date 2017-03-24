/*
 * lab3.c
 *
 *  Created on: Feb 11, 2013
 *      Author: Zhang Yang
 */
#include <stdio.h>

void main(void)
{
	int a = 1;
	int b = 2;
	float c = 1.1;
	float d = 2.2;
	char e = 'a';
	char f = 'b';
	int* intP;
	float* fP;
	char* charP;

	/** do stuff */
	intP = &a;
	printf("a = "%d, *intP);
	intP = &b;
	printf("b = "%d, *intP);

	fP = &c;
	printf("a = "%f, *fP);
	fP = &d;
	printf("b = "%f, *fP);

	charP = &e;
	printf("a = "%c, *charP);
	charP = &f;
	printf("b = "%c, *charP);

	int a1= 25;
	int b1= 16;
	int c1= 7;
	int d1= 4;
	int e1= 9;
	int result;
	int* a1P= &a1;
	int* b1P= &b1;
	int* c1P= &c1;
	int* d1P= &d1;
	int* e1P= &e1;
	result = (*a1P-*b1P)*(*c1P+*d1P)/(*e1P);
	printf("(A-B)*(C+D)/E =  "%d, result);
}

