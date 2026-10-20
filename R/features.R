# The function for each feature, which computes it exactly as catch22_all does.
# Their names are those of the C library (catch22_feature_table(catch24 = TRUE));
# test-features.R checks that there is one function per feature.

#' Function to calculate a statistical feature
#'
#' Short name: \code{mode_5}.
#' Reproduces the hctsa v3.0.0 call \code{DN_HistogramMode(x_z,5,true,false)}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_HistogramMode_5(x)
#'
DN_HistogramMode_5 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_HistogramMode_5", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{mode_10}.
#' Reproduces the hctsa v3.0.0 call \code{DN_HistogramMode(x_z,10,true,false)}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_HistogramMode_10(x)
#'
DN_HistogramMode_10 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_HistogramMode_10", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{outlier_timing_pos}.
#' Reproduces the hctsa v3.0.0 call \code{DN_OutlierInclude(x_z,'pos',0.01).mdrmd}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_OutlierInclude_p_001_mdrmd(x)
#'
DN_OutlierInclude_p_001_mdrmd <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_OutlierInclude_p_001_mdrmd", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{outlier_timing_neg}.
#' Reproduces the hctsa v3.0.0 call \code{DN_OutlierInclude(x_z,'neg',0.01).mdrmd}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_OutlierInclude_n_001_mdrmd(x)
#'
DN_OutlierInclude_n_001_mdrmd <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_OutlierInclude_n_001_mdrmd", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{acf_timescale}.
#' Reproduces the hctsa v3.0.0 call \code{CO_FirstCrossing(x_z,'ac',1/exp(1),'both').pointOfCrossing}, where \code{x_z} is the z-scored time series.
#' Called \code{CO_f1ecac} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- CO_FirstCrossing_acf_1e_pointOfCrossing(x)
#'
CO_FirstCrossing_acf_1e_pointOfCrossing <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "CO_FirstCrossing_acf_1e_pointOfCrossing", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{acf_first_min}.
#' Reproduces the hctsa v3.0.0 call \code{CO_FirstMin(x_z,'ac')}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- CO_FirstMin_ac(x)
#'
CO_FirstMin_ac <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "CO_FirstMin_ac", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{low_freq_power}.
#' Reproduces the hctsa v3.0.0 call \code{SP_Summaries(x_z,'fft',[],[],false).area_5_1}, where \code{x_z} is the z-scored time series.
#' Called \code{SP_Summaries_welch_rect_area_5_1} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SP_Summaries_fft_area_5_1(x)
#'
SP_Summaries_fft_area_5_1 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SP_Summaries_fft_area_5_1", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{median_freq}.
#' Reproduces the hctsa v3.0.0 call \code{SP_Summaries(x_z,'fft',[],[],false).wq_50}, where \code{x_z} is the z-scored time series.
#' Called \code{SP_Summaries_welch_rect_centroid} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SP_Summaries_fft_wq_50(x)
#'
SP_Summaries_fft_wq_50 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SP_Summaries_fft_wq_50", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{forecast_error}.
#' Reproduces the hctsa v3.0.0 call \code{FC_LocalSimple(x_z,'mean',3).stde}, where \code{x_z} is the z-scored time series.
#' Called \code{FC_LocalSimple_mean3_stderr} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- FC_LocalSimple_mean3_stde(x)
#'
FC_LocalSimple_mean3_stde <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "FC_LocalSimple_mean3_stde", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{whiten_timescale}.
#' Reproduces the hctsa v3.0.0 call \code{FC_LocalSimple(x_z,'mean',1).taurat}, where \code{x_z} is the z-scored time series.
#' Called \code{FC_LocalSimple_mean1_tauresrat} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- FC_LocalSimple_mean1_taurat(x)
#'
FC_LocalSimple_mean1_taurat <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "FC_LocalSimple_mean1_taurat", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{high_fluctuation}.
#' Reproduces the hctsa v3.0.0 call \code{MD_pNN(x_z).pnn40}, where \code{x_z} is the z-scored time series.
#' Called \code{MD_hrv_classic_pnn40} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- MD_pNN_pnn40(x)
#'
MD_pNN_pnn40 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "MD_pNN_pnn40", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{stretch_high}.
#' Reproduces the hctsa v3.0.0 call \code{SB_BinaryStats(x_z,'mean').longstretch1}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SB_BinaryStats_mean_longstretch1(x)
#'
SB_BinaryStats_mean_longstretch1 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SB_BinaryStats_mean_longstretch1", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{stretch_decreasing}.
#' Reproduces the hctsa v3.0.0 call \code{SB_BinaryStats(x_z,'diff').longstretch0}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SB_BinaryStats_diff_longstretch0(x)
#'
SB_BinaryStats_diff_longstretch0 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SB_BinaryStats_diff_longstretch0", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{entropy_pairs}.
#' Reproduces the hctsa v3.0.0 call \code{SB_MotifThree(x_z,'quantile').hh}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SB_MotifThree_quantile_hh(x)
#'
SB_MotifThree_quantile_hh <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SB_MotifThree_quantile_hh", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{ami2}.
#' Reproduces the hctsa v3.0.0 call \code{CO_HistogramAMI(x_z,1:5,'even',5).ami2}, where \code{x_z} is the z-scored time series.
#' Called \code{CO_HistogramAMI_even_2_5} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- CO_HistogramAMI_even_5bin_ami2(x)
#'
CO_HistogramAMI_even_5bin_ami2 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "CO_HistogramAMI_even_5bin_ami2", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{trev}.
#' Reproduces the hctsa v3.0.0 call \code{CO_trev(x_z,1).num}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- CO_trev_1_num(x)
#'
CO_trev_1_num <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "CO_trev_1_num", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{ami_timescale}.
#' Reproduces the hctsa v3.0.0 call \code{IN_AutoMutualInfoStats(x_z,40,'gaussian').fmmi}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- IN_AutoMutualInfoStats_40_gaussian_fmmi(x)
#'
IN_AutoMutualInfoStats_40_gaussian_fmmi <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "IN_AutoMutualInfoStats_40_gaussian_fmmi", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{transition_variance}.
#' Reproduces the hctsa v3.0.0 call \code{SB_TransitionMatrix(x_z,'quantile',3,'ac').sumdiagcov}, where \code{x_z} is the z-scored time series.
#' Called \code{SB_TransitionMatrix_3ac_sumdiagcov} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SB_TransitionMatrix_quantile_3_ac_sumdiagcov(x)
#'
SB_TransitionMatrix_quantile_3_ac_sumdiagcov <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SB_TransitionMatrix_quantile_3_ac_sumdiagcov", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{periodicity}.
#' Reproduces the hctsa v3.0.0 call \code{PD_PeriodicityWang(x_z).th0_01}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- PD_PeriodicityWang_th0_01(x)
#'
PD_PeriodicityWang_th0_01 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "PD_PeriodicityWang_th0_01", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{embedding_dist}.
#' Reproduces the hctsa v3.0.0 call \code{CO_Embed2_Dist(x_z,'tau').d_expfit_meandiff}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- CO_Embed2_Dist_tau_d_expfit_meandiff(x)
#'
CO_Embed2_Dist_tau_d_expfit_meandiff <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "CO_Embed2_Dist_tau_d_expfit_meandiff", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{rs_range}.
#' Reproduces the hctsa v3.0.0 call \code{SC_FluctAnal(x_z,2,'rsrangefit',50,1,[],true).prop_r1}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1(x)
#'
SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SC_FluctAnal_2_rsrangefit_50_1_logi_prop_r1", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{dfa}.
#' Reproduces the hctsa v3.0.0 call \code{SC_FluctAnal(x_z,2,'dfa',50,1,2,true).prop_r1}, where \code{x_z} is the z-scored time series.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Carl H. Lubba
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1(x)
#'
SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1 <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "SC_FluctAnal_2_dfa_50_1_2_logi_prop_r1", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{mean}.
#' Reproduces the hctsa v3.0.0 call \code{DN_Mean(x,'norm')}, where \code{x} is the raw time series.
#' Called \code{DN_Mean} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_mean(x)
#'
DN_mean <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_mean", mask_nans))
}

#' Function to calculate a statistical feature
#'
#' Short name: \code{std}.
#' Reproduces the hctsa v3.0.0 call \code{DN_Spread(x,'std')}, where \code{x} is the raw time series.
#' Called \code{DN_Spread_Std} before Rcatch22 1.0.0.
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Trent Henderson
#' @export
#' @examples
#' x <- stats::rnorm(100)
#' outs <- DN_Spread_std(x)
#'
DN_Spread_std <- function(x, mask_nans = TRUE){
   return(compute_named_feature(x, "DN_Spread_std", mask_nans))
}
