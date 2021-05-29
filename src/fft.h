#ifndef FFT_H
#define FFT_H
#include <complex.h>

#include <stdlib.h>
#include <string.h>
#ifndef CMPLX
#define CMPLX(x, y) ((double _Complex)((double)(x) + _double _Complex_I * (double)(y)))
#endif
extern void twiddles(double _Complex a[], int size);
// extern void _fft(double _Complex a[], double _Complex out[], int size, int step, double _Complex tw[]);
extern void fft(double _Complex a[], int size, double _Complex tw[]);
extern void ifft(double _Complex a[], int size, double _Complex tw[]);
#endif
