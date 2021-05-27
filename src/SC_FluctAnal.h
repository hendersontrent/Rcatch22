#ifndef SC_FLUCTANAL
#define SC_FLUCTANAL
#include <math.h>
#include <string.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>
#include "stats.h"
#include "CO_AutoCorr.h"

extern SEXP C_SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(SEXP y[]);
extern double SC_FluctAnal_2_50_1_logi_prop_r1(const double y[], const int size, const char how[]);
extern SEXP C_SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(SEXP y[]);
#endif
