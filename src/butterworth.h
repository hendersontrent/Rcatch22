//
//  butterworth.h
//
//
//  Created by Carl Henning Lubba on 23/09/2018.
//

#ifndef butterworth_h
#define butterworth_h

#include <stdio.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

extern void butterworthFilter(const double y[], const int size, const int nPoles, const double W, double out[]);

#endif /* butterworth_h */
