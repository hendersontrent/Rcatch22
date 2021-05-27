//
//  MD_hrv.h
//  C_polished
//
//  Created by Carl Henning Lubba on 22/09/2018.
//  Copyright © 2018 Carl Henning Lubba. All rights reserved.
//

#ifndef MD_hrv_h
#define MD_hrv_h

#include <stdio.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

extern SEXP C_MD_hrv_classic_pnn40(SEXP y[]);

#endif /* MD_hrv_h */
