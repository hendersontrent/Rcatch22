#ifndef HELPER_FUNCTIONS_H
#define HELPER_FUNCTIONS_H
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "stats.h"

#if __cplusplus
#   include <complex>
#else
#   include <complex.h>
#endif

extern void linspace(double start, double end, int num_groups, double out[]);
extern double quantile(const double y[], const int size, const double quant);
extern void sort(double y[], int size);
extern void binarize(const double a[], const int size, int b[], const char how[]);
extern double f_entropy(const double a[], const int size);
extern void subset(const int a[], int b[], const int start, const int end);

#if defined(__GNUC__) || defined(__GNUG__)
extern double _Complex _Cminuscc(const double _Complex x, const double _Complex y);
extern double _Complex _Caddcc(const double _Complex x, const double _Complex y);
extern double _Complex _Cdivcc(const double _Complex x, const double _Complex y);
extern double _Complex _Cmulcc(const double _Complex x, const double _Complex y);
#elif defined(_MSC_VER)
extern _Dcomplex _Cminuscc(_Dcomplex x, _Dcomplex y);
extern _Dcomplex _Caddcc(_Dcomplex x, _Dcomplex y);
extern _Dcomplex _Cdivcc(_Dcomplex x, _Dcomplex y);
extern _Dcomplex _Cmulcc(_Dcomplex x, _Dcomplex y);
#endif

#endif
