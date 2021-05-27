#ifndef HELPER_FUNCTIONS_H
#define HELPER_FUNCTIONS_H
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "stats.h"
#include <R.h>

extern void linspace(double start, double end, int num_groups, double out[]);
extern double quantile(const double y[], const int size, const double quant);
extern void sort(double y[], int size);
extern void binarize(const double a[], const int size, int b[], const char how[]);
extern double f_entropy(const double a[], const int size);
extern void subset(const int a[], int b[], const int start, const int end);

extern Rcomplex _Cminuscc(const Rcomplex x, const Rcomplex y);
extern Rcomplex _Caddcc(const Rcomplex x, const Rcomplex y);
extern Rcomplex _Cdivcc(const Rcomplex x, const Rcomplex y);
extern Rcomplex _Cmulcc(const Rcomplex x, const Rcomplex y);

#endif
