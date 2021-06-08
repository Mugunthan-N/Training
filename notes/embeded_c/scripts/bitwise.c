#include<stdio.h>

typedef unsigned char       BYTE;

BYTE setbit( BYTE ch, int i, int val)

{
	BYTE mask = 1 << i;
	if( val == 1) return ch | mask;
	return ch & mask;
}

int bin(int n)
{
    if (n > 1)
        bin(n >> 1);
 
    printf("%d", n & 1);
    return 0;
}

int main()

{
	int x=3, y=2; // x = 0011 | y = 0010
	printf(" x = 3 = 0011\n x = 2 = 0010\n\n");
	printf(" x & y = %d\n",x&y); 
	printf(" x | y = %d\n",x|y);
	printf(" ~ x   = %d\n\n",~x);

	printf(" x << y   = %d\n",x << y);
	printf(" x >> y   = %d\n",x >> y);

	float f = 2.8;
	printf(" Shifting bits for a float no.\n");
	int *ptr = (int *) (&f);
	*ptr <<= x;
	printf(" *ptr << x or 2.8 << 3 = %f\n",f);

	printf("\n XOR ");
	printf(" x ^ y = %d\n", x ^ y);

	printf(" Swapping two nums\n");
	printf(" Before Swapping x = %d y = %d \n",x,y);
	x=x^y;
	y=x^y;
	x=x^y;
	printf(" After Swapping x = %d y = %d \n",x,y);

	printf("\n Mask \n\n");
	x=57,y=86;

	printf(" x = ");
	bin(x);
	printf("\n y = ");
	bin(y);

	printf("\n Setting bit 5 in x high \n");
	printf(" Now after setting bit \n");
	printf(" x = ");
	bin(setbit(x,2,1));
	printf("\n\n Setting bit 4 in y low\n");
	printf(" Now after setting bit \n");
	printf(" y = ");
	bin(setbit(y,3,1));
	printf("\n");
}