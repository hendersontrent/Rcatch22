#include <stdio.h>
#include "stats.h"

double DN_Spread_Std(const double a[], const int size)
{
    double sd = 0.0;
    double xbar = mean(a, size);

    for (int i = 0; i < size; i++) {
        sd += (a[i]-xbar)*(a[i]-xbar);
    }

    sd = sqrt(sd);
    return sd;
}
