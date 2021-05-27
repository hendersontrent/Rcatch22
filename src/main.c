/* Include files */
#include "main.h"
#include <math.h>
#include <stdio.h>
#include <R.h>
//#include <dirent.h>

#include "DN_HistogramMode_5.h"
#include "DN_HistogramMode_10.h"
#include "CO_AutoCorr.h"
#include "DN_OutlierInclude.h"
#include "FC_LocalSimple.h"
#include "IN_AutoMutualInfoStats.h"
#include "MD_hrv.h"
#include "SB_BinaryStats.h"
#include "SB_MotifThree.h"
#include "SC_FluctAnal.h"
#include "SP_Summaries.h"
#include "SB_TransitionMatrix.h"
#include "PD_PeriodicityWang.h"

#include "stats.h"

// check if data qualifies to be cought22
int quality_check(const double y[], const int size)
{
  int minSize = 40;

  if(size < minSize)
  {
    return 1;
  }
  for(int i = 0; i < size; i++)
  {
    double val = y[i];
    if(val == INFINITY || -val == INFINITY)
    {
      return 2;
    }
    if(isnan(val))
    {
      return 3;
    }
  }
  return 0;
}

void run_features(double y[], int size, FILE * outfile)
{
    int quality = quality_check(y, size);
    if(quality != 0)
    {
        //fprintf(stdout, "Time series quality test not passed (code %i).\n", quality);
        return;
    }

    double * y_zscored = malloc(size * sizeof * y_zscored);

    // variables to keep time
    clock_t begin;
    double timeTaken;

    // output
    double result;

    // z-score first for all.
    zscore_norm2(y, size, y_zscored);

    // GOOD
    begin = clock();
    result = C_DN_HistogramMode_5(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "DN_HistogramMode_5", timeTaken);

    // GOOD
    begin = clock();
    result = C_DN_HistogramMode_10(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "DN_HistogramMode_10", timeTaken);

    //GOOD
    begin = clock();
    result = C_CO_Embed2_Dist_tau_d_expfit_meandiff(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "CO_Embed2_Dist_tau_d_expfit_meandiff", timeTaken);

    //GOOD (memory leak?)
    begin = clock();
    result = C_CO_f1ecac(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "CO_f1ecac", timeTaken);

    //GOOD
    begin = clock();
    result = C_CO_FirstMin_ac(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "CO_FirstMin_ac", timeTaken);

    // GOOD (memory leak?)
    begin = clock();
    result = C_CO_HistogramAMI_even_2_5(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "CO_HistogramAMI_even_2_5", timeTaken);

    // GOOD
    begin = clock();
    result = C_CO_trev_1_num(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "CO_trev_1_num", timeTaken);

    // GOOD
    begin = clock();
    result = C_DN_OutlierInclude_p_001_mdrmd(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "DN_OutlierInclude_p_001_mdrmd", timeTaken);

    // GOOD
    begin = clock();
    result = C_DN_OutlierInclude_n_001_mdrmd(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "DN_OutlierInclude_n_001_mdrmd", timeTaken);

    //GOOD
    begin = clock();
    result = C_FC_LocalSimple_mean1_tauresrat(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "FC_LocalSimple_mean1_tauresrat", timeTaken);

    //GOOD
    begin = clock();
    result = C_FC_LocalSimple_mean3_stderr(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "FC_LocalSimple_mean3_stderr", timeTaken);

    //GOOD (memory leak?)
    begin = clock();
    result = C_IN_AutoMutualInfoStats_40_gaussian_fmmi(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "IN_AutoMutualInfoStats_40_gaussian_fmmi", timeTaken);

    //GOOD
    begin = clock();
    result = C_MD_hrv_classic_pnn40(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "MD_hrv_classic_pnn40", timeTaken);

    //GOOD
    begin = clock();
    result = C_SB_BinaryStats_diff_longstretch0(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SB_BinaryStats_diff_longstretch0", timeTaken);

    //GOOD
    begin = clock();
    result = C_SB_BinaryStats_mean_longstretch1(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SB_BinaryStats_mean_longstretch1", timeTaken);

    //GOOD (memory leak?)
    begin = clock();
    result = C_SB_MotifThree_quantile_hh(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SB_MotifThree_quantile_hh", timeTaken);

    //GOOD (memory leak?)
    begin = clock();
    result = C_SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1", timeTaken);

    //GOOD
    begin = clock();
    result = C_SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1", timeTaken);

    //GOOD
    begin = clock();
    result = C_SP_Summaries_welch_rect_area_5_1(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SP_Summaries_welch_rect_area_5_1", timeTaken);

    //GOOD
    begin = clock();
    result = C_SP_Summaries_welch_rect_centroid(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SP_Summaries_welch_rect_centroid", timeTaken);

    //OK, BUT filt in Butterworth sometimes diverges, now removed alltogether, let's see results.
    begin = clock();
    result = C_SB_TransitionMatrix_3ac_sumdiagcov(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "SB_TransitionMatrix_3ac_sumdiagcov", timeTaken);

    // GOOD
    begin = clock();
    result = C_PD_PeriodicityWang_th0_01(y_zscored, size);
    timeTaken = (double)(clock()-begin)*1000/CLOCKS_PER_SEC;
    //fprintf(outfile, "%.14f, %s, %f\n", result, "PD_PeriodicityWang_th0_01", timeTaken);

    //fprintf(outfile, "\n");

    free(y_zscored);
}

void print_help(char *argv[], char msg[])
{
  if (strlen(msg) > 0) {
    Rprintf("ERROR: %s\n", msg);
  }
  Rprintf("Usage is %s <infile> <outfile>\n", argv[0]);
  Rprintf("\n\tSpecifying outfile is optional, by default it is stdout\n");
  // fprintf(stdout, "\tOutput order is:\n%s\n", HEADER);
}

int main2(int argc, char * argv[])
{
  (void)argc;
  (void)argv;

    // open a certain file
    FILE * infile;
    infile = fopen("C:\\Users\\Carl\\Documents\\catch22-master\\testData\\test.txt", "r");
    int array_size = 15000;
    double * y = malloc(array_size * sizeof(double));
    int size = 0;
    double value = 0;
    while (fscanf(infile, "%lf", &value) != EOF) {
        y[size++] = value;
    }

    // first, z-score.
    zscore_norm(y, size);

    double result;

    result = C_DN_HistogramMode_5(y, size);
    //printf("DN_HistogramMode_5: %1.3f\n", result);
    result = C_DN_HistogramMode_10(y, size);
    //printf("DN_HistogramMode_10: %1.3f\n", result);
    result = C_CO_Embed2_Dist_tau_d_expfit_meandiff(y, size);
    //printf("CO_Embed2_Dist_tau_d_expfit_meandiff: %1.3f\n", result);
    result = C_CO_f1ecac(y, size);
    //printf("CO_f1ecac: %1.f\n", result);
    result = C_CO_FirstMin_ac(y, size);
    //printf("CO_FirstMin_ac: %1.f\n", result);
    result = C_CO_HistogramAMI_even_2_5(y, size);
    //printf("CO_HistogramAMI_even_2_5: %1.3f\n", result);
    result = C_CO_trev_1_num(y, size);
    //printf("CO_trev_1_num: %1.5f\n", result);
    result = C_DN_OutlierInclude_p_001_mdrmd(y, size);
    //printf("DN_OutlierInclude_p_001_mdrmd: %1.5f\n", result);
    result = C_DN_OutlierInclude_n_001_mdrmd(y, size);
    //printf("DN_OutlierInclude_n_001_mdrmd: %1.5f\n", result);
    result = C_FC_LocalSimple_mean1_tauresrat(y, size);
    //printf("FC_LocalSimple_mean1_tauresrat: %1.5f\n", result);
    result = C_FC_LocalSimple_mean3_stderr(y, size);
    //printf("FC_LocalSimple_mean3_stderr: %1.5f\n", result);
    result = C_IN_AutoMutualInfoStats_40_gaussian_fmmi(y, size);
    //printf("IN_AutoMutualInfoStats_40_gaussian_fmmi: %1.5f\n", result);
    result = C_MD_hrv_classic_pnn40(y, size);
    //printf("MD_hrv_classic_pnn40: %1.5f\n", result);
    result = C_SB_BinaryStats_diff_longstretch0(y, size);
    //printf("SB_BinaryStats_diff_longstretch0: %1.5f\n", result);
    result = C_SB_BinaryStats_mean_longstretch1(y, size);
    //printf("SB_BinaryStats_mean_longstretch1: %1.5f\n", result);
    result = C_SB_MotifThree_quantile_hh(y, size);
    //printf("SB_MotifThree_quantile_hh: %1.5f\n", result);
    result = C_SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(y, size);
    //printf("SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1: %1.5f\n", result);
    result = C_SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(y, size);
    //printf("SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1: %1.5f\n", result);
    result = C_SP_Summaries_welch_rect_area_5_1(y, size);
    //printf("SP_Summaries_welch_rect_area_5_1: %1.5f\n", result);
    result = C_SP_Summaries_welch_rect_centroid(y, size);
    //printf("SP_Summaries_welch_rect_centroid: %1.5f\n", result);
    result = C_SB_TransitionMatrix_3ac_sumdiagcov(y, size);
    //printf("SB_TransitionMatrix_3ac_sumdiagcov: %1.5f\n", result);
    result = C_PD_PeriodicityWang_th0_01(y, size);
    //printf("PD_PeriodicityWang_th0_01: %1.f\n", result);

  return 0;
}
