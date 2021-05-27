#' Automatically run every time-series feature calculation included in the catch22 set.
#' @param data a numerical time-series input vector
#' @return object of class DataFrame that contains the summary statistics for each feature
#' @author Carl H. Lubba
#' @export
#' @examples
#' data <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- catch22_all(data)
#'

catch22_all <- function(data){

  names <- c('DN_HistogramMode_5',
  	'DN_HistogramMode_10',
  	'CO_f1ecac',
  	'CO_FirstMin_ac',
  	'CO_HistogramAMI_even_2_5',
  	'CO_trev_1_num',
  	'MD_hrv_classic_pnn40',
  	'SB_BinaryStats_mean_longstretch1',
  	'SB_TransitionMatrix_3ac_sumdiagcov',
  	'PD_PeriodicityWang_th0_01',
  	'CO_Embed2_Dist_tau_d_expfit_meandiff',
  	'IN_AutoMutualInfoStats_40_gaussian_fmmi',
  	'FC_LocalSimple_mean1_tauresrat',
  	'DN_OutlierInclude_p_001_mdrmd',
  	'DN_OutlierInclude_n_001_mdrmd',
  	'SP_Summaries_welch_rect_area_5_1',
  	'SB_BinaryStats_diff_longstretch0',
  	'SB_MotifThree_quantile_hh',
  	'SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1',
  	'SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1',
  	'SP_Summaries_welch_rect_centroid',
  	'FC_LocalSimple_mean3_stderr')

  values = c()

  for (feature in names){
      fh = get(feature);
      values = append(values, fh(data))
  }

  outData = data.frame(names = names, values = values)

  return(outData)
}
