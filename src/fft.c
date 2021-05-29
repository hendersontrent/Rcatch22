#include <stdlib.h>
#include <string.h>
#include <math.h>
#if __cplusplus
#   include <complex>
#else
#   include <complex.h>
#endif

#if defined(__GNUC__) || defined(__GNUG__)
#ifndef CMPLX
#define CMPLX(x, y) ((double _Complex)((double)(x) + _Imaginary_I * (double)(y)))
#endif
#elif defined(_MSC_VER)
#ifndef CMPLX
#define CMPLX(x, y) ((_Dcomplex)((double)(x) + _Imaginary_I * (double)(y)))
#endif
#endif

#include "helper_functions.h"

#if defined(__GNUC__) || defined(__GNUG__)
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
#elif defined(_MSC_VER)
void twiddles(_Dcomplex a[], int size)
{

    double PI = 3.14159265359;

    for (int i = 0; i < size; i++) {
        // double _Complex tmp = { 0, -PI * i / size };
        _Dcomplex tmp = 0.0  - PI * i / size * I;
        a[i] = cexp(tmp);
        //a[i] = cexp(-I * M_PI * i / size);
    }
}

static void _fft(_Dcomplex a[], _Dcomplex out[], int size, int step, _Dcomplex tw[])
{
    if (step < size) {
        _fft(out, a, size, step * 2, tw);
        _fft(out + step, a + step, size, step * 2, tw);

        for (int i = 0; i < size; i += 2 * step) {
            //double _Complex t = tw[i] * out[i + step];
            _Dcomplex t = _Cmulcc(tw[i], out[i + step]);
            a[i / 2] = _Caddcc(out[i], t);
            a[(i + size) / 2] = _Cminuscc(out[i], t);
        }
    }
}

void fft(_Dcomplex a[], int size, _Dcomplex tw[])
{
    _Dcomplex * out = malloc(size * sizeof(_Dcomplex));
    memcpy(out, a, size * sizeof(_Dcomplex));
    _fft(a, out, size, 1, tw);
    free(out);
}
#endif
