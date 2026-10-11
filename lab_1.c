#include <stdio.h>
#include <time.h>

int main() 
{
    const long long N = 2000000000LL;

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    double s = 0.0;
    int sign = 4;
    for (long long i = 0; i < N; i++) 
    {
        s += sign / (double)(2*i + 1);
        sign *= -1;
    }

    clock_gettime(CLOCK_MONOTONIC, &end);

    double time = (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;

    printf("Result: %.15f\n", s);
    printf("Time: %.3f sec\n", time);

    return 0;
}
