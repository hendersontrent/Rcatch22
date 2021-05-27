#include <math.h>
#include <string.h>
#include <time.h>
#include <float.h>
#include "stats.h"
#include "histcounts.h"

double C_DN_HistogramMode_5(const double y[], const int size)
{

    // NaN check
    for(int i = 0; i < size; i++)
    {
        if(isnan(y[i]))
        {
            return NAN;
        }
    }

    const int nBins = 5;

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

    return out;
}
