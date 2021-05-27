//
//  SP_Summaries.h
//
//
//  Created by Carl Henning Lubba on 23/09/2018.
//

#ifndef SP_Summaries_h
#define SP_Summaries_h

#include <stdio.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

extern double cabsC(Rcomplex x);
extern double SP_Summaries_welch_rect(const double y[], const int size, const char what[]);
extern SEXP C_SP_Summaries_welch_rect_area_5_1(SEXP y[]);
extern SEXP C_SP_Summaries_welch_rect_centroid(SEXP y[]);

#endif /* SP_Summaries_h */
