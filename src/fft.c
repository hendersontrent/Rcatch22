#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <complex.h>

#ifndef CMPLX
#define CMPLX(x, y) ((double _Complex)((double)(x) + _Imaginary_I * (double)(y)))
#endif

#include "helper_functions.h"

void twiddles(double _Complex a[], int size)
{

    double PI = 3.14159265359;

    for (int i = 0; i < size; i++) {
        // double _Complex tmp = { 0, -PI * i / size };
        double _Complex tmp = 0.0  - PI * i / size * I;
        a[i] = cexp(tmp);
        //a[i] = cexp(-I * M_PI * i / size);
    }
}

static void _fft(double _Complex a[], double _Complex out[], int size, int step, double _Complex tw[])
{
    if (step < size) {
        _fft(out, a, size, step * 2, tw);
        _fft(out + step, a + step, size, step * 2, tw);

        for (int i = 0; i < size; i += 2 * step) {
            //double _Complex t = tw[i] * out[i + step];
            double _Complex t = _Cmulcc(tw[i], out[i + step]);
            a[i / 2] = _Caddcc(out[i], t);
            a[(i + size) / 2] = _Cminuscc(out[i], t);
        }
    }
}

void fft(double _Complex a[], int size, double _Complex tw[])
{
    double _Complex * out = malloc(size * sizeof(double _Complex));
    memcpy(out, a, size * sizeof(double _Complex));
    _fft(a, out, size, 1, tw);
    free(out);
}
