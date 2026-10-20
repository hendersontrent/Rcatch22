#' Deprecated feature functions
#'
#' These features were renamed in Rcatch22 1.0.0 (catch22 v1.0), when every feature was
#' redefined to exactly reproduce a call in hctsa v3.0.0 (so values may differ from
#' earlier versions). Each deprecated function computes the renamed feature, with a
#' deprecation warning:
#' \itemize{
#'   \item \code{CO_f1ecac}: \code{\link{CO_FirstCrossing_acf_1e_pointOfCrossing}}
#'   \item \code{SP_Summaries_welch_rect_area_5_1}: \code{\link{SP_Summaries_fft_area_5_1}}
#'   \item \code{SP_Summaries_welch_rect_centroid}: \code{\link{SP_Summaries_fft_wq_50}}
#'   \item \code{FC_LocalSimple_mean3_stderr}: \code{\link{FC_LocalSimple_mean3_stde}}
#'   \item \code{FC_LocalSimple_mean1_tauresrat}: \code{\link{FC_LocalSimple_mean1_taurat}}
#'   \item \code{MD_hrv_classic_pnn40}: \code{\link{MD_pNN_pnn40}}
#'   \item \code{CO_HistogramAMI_even_2_5}: \code{\link{CO_HistogramAMI_even_5bin_ami2}}
#'   \item \code{SB_TransitionMatrix_3ac_sumdiagcov}: \code{\link{SB_TransitionMatrix_quantile_3_ac_sumdiagcov}}
#'   \item \code{DN_Mean}: \code{\link{DN_mean}}
#'   \item \code{DN_Spread_Std}: \code{\link{DN_Spread_std}}
#' }
#'
#' @param x a numerical time-series input vector
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @name Rcatch22-deprecated
#' @keywords internal
NULL

#' @rdname Rcatch22-deprecated
#' @export
CO_f1ecac <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "CO_f1ecac", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
SP_Summaries_welch_rect_area_5_1 <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "SP_Summaries_welch_rect_area_5_1", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
SP_Summaries_welch_rect_centroid <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "SP_Summaries_welch_rect_centroid", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
FC_LocalSimple_mean3_stderr <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "FC_LocalSimple_mean3_stderr", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
FC_LocalSimple_mean1_tauresrat <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "FC_LocalSimple_mean1_tauresrat", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
MD_hrv_classic_pnn40 <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "MD_hrv_classic_pnn40", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
CO_HistogramAMI_even_2_5 <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "CO_HistogramAMI_even_2_5", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
SB_TransitionMatrix_3ac_sumdiagcov <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "SB_TransitionMatrix_3ac_sumdiagcov", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
DN_Mean <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "DN_Mean", mask_nans))
}

#' @rdname Rcatch22-deprecated
#' @export
DN_Spread_Std <- function(x, mask_nans = TRUE){
   return(deprecated_feature(x, "DN_Spread_Std", mask_nans))
}

# Compute the feature whose name before v1.0 was legacy_name, with a deprecation warning
deprecated_feature <- function(x, legacy_name, mask_nans = TRUE){
   features <- catch22_feature_table_cpp(TRUE)
   name <- features$name[match(legacy_name, features$legacy_name)]
   .Deprecated(name, package = "Rcatch22",
               msg = paste0("'", legacy_name, "' is deprecated: use '", name,
                            "' (renamed in catch22 v1.0, when features were ",
                            "redefined to match hctsa)"))
   return(compute_named_feature(x, name, mask_nans))
}
