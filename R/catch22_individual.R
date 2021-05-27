# Contains all R functions to C calls for the package

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- DN_HistogramMode_5(x)
#'
DN_HistogramMode_5 <- function(x) {
  .Call("C_DN_HistogramMode_5", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- DN_HistogramMode_10(x)
#'
DN_HistogramMode_10 <- function(x) {
  .Call("C_DN_HistogramMode_10", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- CO_f1ecac(x)
#'
CO_f1ecac <- function(x) {
  .Call("C_CO_f1ecac", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- CO_FirstMin_ac(x)
#'
CO_FirstMin_ac <- function(x) {
  .Call("C_CO_FirstMin_ac", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- CO_HistogramAMI_even_2_5(x)
#'
CO_HistogramAMI_even_2_5 <- function(x) {
  .Call("C_CO_HistogramAMI_even_2_5", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- CO_trev_1_num(x)
#'
CO_trev_1_num <- function(x) {
  .Call("C_CO_trev_1_num", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- MD_hrv_classic_pnn40(x)
#'
MD_hrv_classic_pnn40 <- function(x) {
  .Call("C_MD_hrv_classic_pnn40", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SB_BinaryStats_mean_longstretch1(x)
#'
SB_BinaryStats_mean_longstretch1 <- function(x) {
  .Call("C_SB_BinaryStats_mean_longstretch1", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SB_TransitionMatrix_3ac_sumdiagcov(x)
#'
SB_TransitionMatrix_3ac_sumdiagcov <- function(x) {
  .Call("C_SB_TransitionMatrix_3ac_sumdiagcov", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- PD_PeriodicityWang_th0_01(x)
#'
PD_PeriodicityWang_th0_01 <- function(x) {
  .Call("C_PD_PeriodicityWang_th0_01", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- CO_Embed2_Dist_tau_d_expfit_meandiff(x)
#'
CO_Embed2_Dist_tau_d_expfit_meandiff <- function(x) {
  .Call("C_CO_Embed2_Dist_tau_d_expfit_meandiff", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- IN_AutoMutualInfoStats_40_gaussian_fmmi(x)
#'
IN_AutoMutualInfoStats_40_gaussian_fmmi <- function(x) {
  .Call("C_IN_AutoMutualInfoStats_40_gaussian_fmmi", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- FC_LocalSimple_mean1_tauresrat(x)
#'
FC_LocalSimple_mean1_tauresrat <- function(x) {
  .Call("C_FC_LocalSimple_mean1_tauresrat", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- DN_OutlierInclude_p_001_mdrmd(x)
#'
DN_OutlierInclude_p_001_mdrmd <- function(x) {
  .Call("C_DN_OutlierInclude_p_001_mdrmd", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- DN_OutlierInclude_n_001_mdrmd(x)
#'
DN_OutlierInclude_n_001_mdrmd <- function(x) {
  .Call("C_DN_OutlierInclude_n_001_mdrmd", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SP_Summaries_welch_rect_area_5_1(x)
#'
SP_Summaries_welch_rect_area_5_1 <- function(x) {
  .Call("C_SP_Summaries_welch_rect_area_5_1", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SB_BinaryStats_diff_longstretch0(x)
#'
SB_BinaryStats_diff_longstretch0 <- function(x) {
  .Call("C_SB_BinaryStats_diff_longstretch0", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SB_MotifThree_quantile_hh(x)
#'
SB_MotifThree_quantile_hh <- function(x) {
  .Call("C_SB_MotifThree_quantile_hh", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(x)
#'
SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1 <- function(x) {
  .Call("SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(x)
#'
SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1 <- function(x) {
  .Call("SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- SP_Summaries_welch_rect_centroid(x)
#'
SP_Summaries_welch_rect_centroid <- function(x) {
  .Call("SC_SP_Summaries_welch_rect_centroid", x, PACKAGE = packageName())
}

#' Function to calculate a statistical feature
#'
#' @param x a numerical time-series input vector
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
#' outs <- FC_LocalSimple_mean3_stderr(x)
#'
FC_LocalSimple_mean3_stderr <- function(x) {
  .Call("SC_FC_LocalSimple_mean3_stderr", x, PACKAGE = packageName())
}
