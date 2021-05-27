#ifndef SB_MOTIFTHREE_H
#define SB_MOTIFTHREE_H
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>
#include "SB_CoarseGrain.h"
#include "helper_functions.h"

extern SEXP C_SB_MotifThree_quantile_hh(SEXP y[]);
extern double * sb_motifthree(const double y[], int size, const char how[]);

#endif
