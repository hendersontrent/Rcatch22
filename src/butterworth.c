//
//  butterworth.c
//  
//
//  Created by Carl Henning Lubba on 23/09/2018.
//

#include <stdlib.h>
#include <math.h>
#if __cplusplus
#   include <complex>
#else
#   include <complex.h>
#endif

#include "helper_functions.h"
#include "butterworth.h"

#if defined(__GNUC__) || defined(__GNUG__)
#ifndef CMPLX
#define CMPLX(x, y) ((double _Complex)((double)(x) + _Imaginary_I * (double)(y)))
#endif
#elif defined(_MSC_VER)
#ifndef CMPLX
#define CMPLX(x, y) ((_Dcomplex)((double)(x) + _Imaginary_I * (double)(y)))
#endif
#endif


void poly(double _Complex x[], int size, double _Complex out[])
{
    /* Convert roots x to polynomial coefficients */
    
    // initialise
    #if defined(__GNUC__) || defined(__GNUG__)
        out[0] = 1;
        for(int i=1; i<size+1; i++){
            out[i] = 0;
        }
    #elif defined(_MSC_VER)
        _Dcomplex c1 = { 1, 0 };
        out[0] = c1;//1;
        for(int i=1; i<size+1; i++){
            c1._Val[0] = 0;
            out[i] = c1;
        }
    #endif
    
    
    double _Complex * outTemp = malloc((size+1)* sizeof(double _Complex));
    
    for(int i=1; i<size+1; i++){
        
        // save old out to not reuse some already changed values
        //(can be done more efficiently by only saving one old value, but who cares, pole number is usually ~4)
        for(int j=0; j<size+1; j++){
            outTemp[j] = out[j];
        }
        
        for(int j=1; j<i+1; j++){
            
            #if defined(__GNUC__) || defined(__GNUG__)
            double _Complex temp1 = _Cmulcc(x[i - 1], outTemp[j - 1]);//x[i - 1] * outTemp[j - 1];
            double _Complex temp2 = out[j];
            #elif defined(_MSC_VER)
            _Dcomplex temp1 = _Cmulcc(x[i - 1], outTemp[j - 1]);//x[i - 1] * outTemp[j - 1];
            _Dcomplex temp2 = out[j];
            #endif
            out[j] = _Cminuscc(temp2, temp1);//x[i - 1] * outTemp[j - 1];
            
        }
        
    }
    
}

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
