#ifndef FFT_H
#define FFT_H
#if __cplusplus
#   include <complex>
#else
#   include <complex.h>
#endif

#include <stdlib.h>
#include <string.h>

#if defined(__GNUC__) || defined(__GNUG__)
#ifndef CMPLX
#define CMPLX(x, y) ((double _Complex)((double)(x) + _Complex_I * (double)(y)))
#endif
#elif defined(_MSC_VER)
#ifndef CMPLX
#define CMPLX(x, y) ((_Dcomplex)((double)(x) + _Complex_I * (double)(y)))
#endif
#endif

#if defined(__GNUC__) || defined(__GNUG__)
extern void twiddles(double _Complex a[], int size);
extern void fft(double _Complex a[], int size, double _Complex tw[]);
extern void ifft(double _Complex a[], int size, double _Complex tw[]);
#elif defined(_MSC_VER)
extern void twiddles(_Dcomplex a[], int size);
extern void fft(_Dcomplex a[], int size, _Dcomplex tw[]);
extern void ifft(_Dcomplex a[], int size, _Dcomplex tw[]);
#endif
#endif
