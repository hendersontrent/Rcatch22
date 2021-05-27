//
//  butterworth.c
//
//
//  Created by Carl Henning Lubba on 23/09/2018.
//

#include <stdlib.h>
#include <math.h>
#include <R.h>
#define USE_RINTERNALS
#include <Rinternals.h>
#include <Rversion.h>

#include "helper_functions.h"
#include "butterworth.h"

void filt(double y[], int size, double a[], double b[], int nCoeffs, double out[]){

    /* Filter a signal y with the filter coefficients a and b, output to array out.*/

    double offset = y[0];

    for(int i = 0; i < size; i++){
        out[i] = 0;
        for(int j = 0; j < nCoeffs; j++){
            if(i - j >= 0)
            {
                out[i] += b[j]*(y[i-j]-offset);
                out[i] -= a[j]*out[i-j];
            }
            else{
                out[i] += 0; //b[j]*offset; // 'padding'
                out[i] -= 0; //a[j]*offset;
            }
        }
    }

    for(int i = 0; i < size; i++){
        out[i] += offset;
    }
}

void reverse_array(double a[], int size){

    /* Reverse the order of the elements in an array. Write back into the input array.*/

    double temp;
    for(int i = 0; i < size/2; i++){
        temp = a[i];
        a[i] = a[size-i-1];
        a[size-1-i] = temp;
        /*
        printf("indFrom = %i, indTo = %i\n", i, size-1-i);
        for(int i=0; i < size; i++){
            printf("reversed[%i]=%1.3f\n", i, a[i]);
        }
         */
    }
}

void filt_reverse(double y[], int size, double a[], double b[], int nCoeffs, double out[]){

    /* Filter a signal y with the filter coefficients a and b _in reverse order_, output to array out.*/

    double * yTemp = malloc(size * sizeof(double));
    for(int i = 0; i < size; i++){
        yTemp[i] = y[i];
    }

    /*
    for(int i=0; i < size; i++){
        printf("yTemp[%i]=%1.3f\n", i, yTemp[i]);
    }
     */

    reverse_array(yTemp, size);

    /*
    for(int i=0; i < size; i++){
        printf("reversed[%i]=%1.3f\n", i, yTemp[i]);
    }
     */

    double offset = yTemp[0];

    for(int i = 0; i < size; i++){
        out[i] = 0;
        for(int j = 0; j < nCoeffs; j++){
            if(i - j >= 0)
            {
                out[i] += b[j]*(yTemp[i-j]-offset);
                out[i] -= a[j]*out[i-j];
            }
            else{
                out[i] += 0; //b[j]*offset; // 'padding'
                out[i] -= 0; //a[j]*offset;
            }
        }
    }

    for(int i = 0; i < size; i++){
        out[i] += offset;
    }

    reverse_array(out, size);

    free(yTemp);

}
