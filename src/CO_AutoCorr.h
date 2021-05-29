#ifndef CO_AUTOCORR_H
#define CO_AUTOCORR_H

#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "stats.h"
#include "fft.h"
#if __cplusplus
#   include <complex>
#else
#   include <complex.h>
#endif

extern int nextpow2(int n);

#if defined(__GNUC__) || defined(__GNUG__)
extern void dot_multiply(double _Complex a[], double _Complex b[], int size);
#elif defined(_MSC_VER)
extern void dot_multiply(_Dcomplex a[], _Dcomplex b[], int size);
#endif

extern double * CO_AutoCorr(const double y[], const int size, const int tau[], const int tau_size);
extern double * co_autocorrs(const double y[], const int size);
extern int co_firstzero(const double y[], const int size, const int maxtau);
extern double CO_Embed2_Basic_tau_incircle(const double y[], const int size, const double radius, const int tau);
extern double CO_Embed2_Dist_tau_d_expfit_meandiff(const double y[], const int size);
extern int CO_FirstMin_ac(const double y[], const int size);
extern double CO_trev_1_num(const double y[], const int size);
extern int CO_f1ecac(const double y[], const int size);
extern double CO_HistogramAMI_even_2_5(const double y[], const int size);

#endif
