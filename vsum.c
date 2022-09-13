#include <stdio.h>

int vsum(int *addr, int n)
{
    int sum = 0;
    int i;
    for (i = 0; i < n; i++)
    {
        sum += *addr;
        addr++;
    }
    return sum;
}

int main(void)
{
    int a[3] = {1, 3, 5};
    printf("%d\n", vsum(&a[0], 3));
}