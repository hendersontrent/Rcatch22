//
//  SB_BinaryStats.h
//  C_polished
//
//  Created by Carl Henning Lubba on 22/09/2018.
//  Copyright © 2018 Carl Henning Lubba. All rights reserved.
//

#ifndef SB_BinaryStats_h
#define SB_BinaryStats_h

#include <stdio.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

extern SEXP C_SB_BinaryStats_diff_longstretch0(SEXP y[]);
extern SEXP C_SB_BinaryStats_mean_longstretch1(SEXP y[]);

#endif /* SB_BinaryStats_h */
