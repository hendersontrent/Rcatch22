//
//  MD_hrv.c
//  C_polished
//
//  Created by Carl Henning Lubba on 22/09/2018.
//  Copyright © 2018 Carl Henning Lubba. All rights reserved.
//

#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>
#include "MD_hrv.h"
#include "stats.h"

SEXP C_MD_hrv_classic_pnn40(SEXP y[]){

    // we use int in loops
    if (xlength(y) >= INT_MAX) {
        error("y was a long vector, not supported.");
    }
    int size = xlength(y);
    // Don't accept integer vectors -- will be wrong pointer below
    if (TYPEOF(y) != REALSXP) {
        error("y was not a REAL vector.");
    }
    const double * x = REAL(y);
    // NaN check
    for(int i = 0; i < size; i++)
    {
        if(ISNAN(x[i]))
        {
            return ScalarReal(NA_REAL);
        }
    }

    const int pNNx = 40;

    // compute diff
    double * Dy = malloc((size-1) * sizeof(double));
    diff(y, size, Dy);

    double pnn40 = 0;
    for(int i = 0; i < size-1; i++){
        if(fabs(Dy[i])*1000 > pNNx){
            pnn40 += 1;
        }
    }

    free(Dy);

    return ScalarReal(pnn40/(size-1));
}
