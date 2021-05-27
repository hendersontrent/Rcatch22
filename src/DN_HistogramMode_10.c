#include <math.h>
#include <string.h>
#include <time.h>
#include <float.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

#include "stats.h"
#include "histcounts.h"

SEXP C_DN_HistogramMode_10(SEXP x) {
    // we use int in loops
    if (xlength(x) >= INT_MAX) {
        error("x was a long vector, not supported.");
    }
    int size = xlength(x);
    // Don't accept integer vectors -- will be wrong pointer below
    if (TYPEOF(x) != REALSXP) {
        error("x was not a REAL vector.");
    }
    const double * y = REAL(x);
    // NaN check
    for(int i = 0; i < size; i++)
    {
        if(ISNAN(y[i]))
        {
            return ScalarReal(NA_REAL);
        }
    }
    const int nBins = 10;
    int * histCounts;
    double * binEdges;
    histcounts(y, size, nBins, &histCounts, &binEdges);
    double maxCount = 0;
    int numMaxs = 1;
    double out = 0;;
    for(int i = 0; i < nBins; i++)
    {
        // printf("binInd=%i, binCount=%i, binEdge=%1.3f \n", i, histCounts[i], binEdges[i]);
        if (histCounts[i] > maxCount)
        {
            maxCount = histCounts[i];
            numMaxs = 1;
            out = (binEdges[i] + binEdges[i+1])*0.5;
        }
        else if (histCounts[i] == maxCount){
            numMaxs += 1;
            out += (binEdges[i] + binEdges[i+1])*0.5;
        }
    }
    out = out/numMaxs;
    // arrays created dynamically in function histcounts
    free(histCounts);
    free(binEdges);
    return ScalarReal(out);
}
