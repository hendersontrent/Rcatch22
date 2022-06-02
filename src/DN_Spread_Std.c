#include <stdio.h>
#include "stats.h"

double DN_Spread_Std(const double a[], const int size)

{

    double sd = stddev(a, size);
    return sd;
}
