#include <stdio.h>
#include "stats.h"

double DN_Spread_Std(const double a[], const int size)
{
    // Calculate sum

    double sigma = 0.0;
    double sd = 0.0;

    for (int i = 0; i < size; i++) {
        sigma += a[i];
    }

    // Calculate mean

    double xbar = sigma / size;

    // Calculate variance

    for (int i = 0; i < size; i++) {
        sd += (a[i]-xbar)*(a[i]-xbar);
    }

    // Return SD

    sd = sqrt(sd);
    return sd;
}
