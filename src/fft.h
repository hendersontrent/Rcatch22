#ifndef FFT_H
#define FFT_H

#include <stdlib.h>
#include <string.h>
#include <R.h>

extern Rcomplex cexpC(Rcomplex x);
extern void twiddles(Rcomplex a[], int size);
extern void fft(Rcomplex a[], int size, Rcomplex tw[]);
extern void ifft(Rcomplex a[], int size, Rcomplex tw[]);
#endif
