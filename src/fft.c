#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <R.h>

#include "helper_functions.h"

Rcomplex cexpC(Rcomplex x)
{
    double s, c, u;
    Rcomplex z;
    s = sin(x.i);
    c = cos(x.i);
    u = exp(x.r);
    z.r = u*c;
    z.i = u*s;
    return z;
}

void twiddles(Rcomplex a[], int size)
{

    double myPI = 3.14159265359;

    for (int i = 0; i < size; i++) {
        Rcomplex tmp = { 0, -myPI * i / size };
        a[i] = cexpC(tmp);
    }
}

static void _fft(Rcomplex a[], Rcomplex out[], int size, int step, Rcomplex tw[])
{
    if (step < size) {
        _fft(out, a, size, step * 2, tw);
        _fft(out + step, a + step, size, step * 2, tw);

        for (int i = 0; i < size; i += 2 * step) {
            //Rcomplex t = tw[i] * out[i + step];
            Rcomplex t = _Cmulcc(tw[i], out[i + step]);
            a[i / 2] = _Caddcc(out[i], t);
            a[(i + size) / 2] = _Cminuscc(out[i], t);
        }
    }
}

void fft(Rcomplex a[], int size, Rcomplex tw[])
{
    Rcomplex * out = malloc(size * sizeof(Rcomplex));
    memcpy(out, a, size * sizeof(Rcomplex));
    _fft(a, out, size, 1, tw);
    free(out);
}
