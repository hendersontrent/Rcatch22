#' Automatically run every time-series feature calculation included in the catch22 set
#'
#' Each feature exactly reproduces a call in hctsa v3.0.0 (see
#' \code{\link{catch22_feature_table}}). Features are computed on the z-scored
#' time series, except the mean and standard deviation added by \code{catch24}.
#'
#' @param data a numerical time-series input vector
#' @param catch24 a Boolean of whether to include mean and standard deviation as features
#' @param short_names a Boolean of whether to also return the features' short names
#' (e.g., \code{"trev"} for \code{"CO_trev_1_num"}) in a \code{short_names} column
#' @param mask_nans a Boolean. If \code{TRUE} (default; recommended for statistical
#' learning), a feature that cannot be estimated (e.g., for a constant or very short
#' time series) is set to a fixed value at the appropriate end of its range, so that
#' real numbers are always returned. If \code{FALSE}, it is \code{NaN}. A time series
#' containing \code{NaN}, \code{NA} or \code{Inf} gives \code{NaN} for every feature
#' either way (with a warning).
#' @param return_masked a Boolean of whether to also return, in a \code{masked}
#' column, whether each feature's value was masked
#' @return object of class DataFrame that contains the summary statistics for each
#' feature, with columns \code{names} and \code{values} (plus \code{short_names} and
#' \code{masked} if requested)
#' @author Trent Henderson & Carl H. Lubba
#' @seealso \code{\link{catch22_feature}} to compute one feature by name, and
#' \code{\link{catch22_feature_table}} for the features' names and hctsa calls
#' @export
#' @examples
#' data <- stats::rnorm(100)
#' outs <- catch22_all(data)
#' outs24 <- catch22_all(data, catch24 = TRUE, short_names = TRUE)
#'

catch22_all <- function(data, catch24 = FALSE, short_names = FALSE, mask_nans = TRUE,
                        return_masked = FALSE){

   check_series(data)
   res <- catch22_compute_cpp(as.double(data), isTRUE(catch24), isTRUE(mask_nans))

   if(!res$ok){
      warning("the time series is empty or contains NaN/NA/Inf; all features are NaN",
              call. = FALSE)
   }

   features <- catch22_feature_table_cpp(isTRUE(catch24))
   outData <- data.frame(names = features$name, values = res$values,
                         stringsAsFactors = FALSE)

   if(short_names){
      outData$short_names <- features$short_name
   }

   if(return_masked){
      outData$masked <- res$masked
   }

   return(outData)
}

#' Compute a single catch22 feature by name
#'
#' Gives exactly the value that \code{\link{catch22_all}} gives for the feature, but
#' computes only that feature.
#'
#' @param data a numerical time-series input vector
#' @param feature the feature's name or short name (as in
#' \code{catch22_feature_table(catch24 = TRUE)}), e.g., \code{"CO_trev_1_num"} or
#' \code{"trev"}
#' @param mask_nans a Boolean, as for \code{\link{catch22_all}}
#' @return scalar value that denotes the calculated time-series statistic
#' @author Ben D. Fulcher
#' @export
#' @examples
#' data <- stats::rnorm(100)
#' catch22_feature(data, "trev")
#' catch22_feature(data, "CO_trev_1_num")
#'

catch22_feature <- function(data, feature, mask_nans = TRUE){

   if(!is.character(feature) || length(feature) != 1 || is.na(feature)){
      stop("feature must be a single feature name", call. = FALSE)
   }

   index <- catch22_feature_index_cpp(feature)

   if(index < 0){
      features <- catch22_feature_table_cpp(TRUE)
      msg <- paste0("no catch22 feature named '", feature,
                    "'; see catch22_feature_table(catch24 = TRUE)")
      legacy <- match(feature, features$legacy_name)
      if(!is.na(legacy)){
         msg <- paste0(msg, " ('", feature, "' is the catch22 v0.x name of '",
                       features$name[legacy], "')")
      }
      stop(msg, call. = FALSE)
   }

   return(compute_feature(data, index, mask_nans))
}

#' The features in the catch22 set
#'
#' The name, short name, name before catch22 v1.0 and hctsa call of each feature, in
#' the order of \code{\link{catch22_all}}.
#'
#' @param catch24 a Boolean of whether to include mean and standard deviation as features
#' @return object of class DataFrame with columns \code{name}, \code{short_name},
#' \code{legacy_name} (the feature's name in catch22 v0.x and Rcatch22 0.x; feature
#' definitions have since changed to match hctsa, so values differ) and
#' \code{hctsa_call} (the hctsa v3.0.0 call that reproduces the feature exactly, on
#' \code{x_z}, the z-scored time series, or \code{x}, the raw time series)
#' @author Ben D. Fulcher
#' @export
#' @examples
#' catch22_feature_table()
#'

catch22_feature_table <- function(catch24 = FALSE){
   return(catch22_feature_table_cpp(isTRUE(catch24)))
}

#--------------------- Internal helpers -----------------------

check_series <- function(data){
   if(!(is.numeric(data) || is.logical(data))){
      stop("data must be a numeric vector", call. = FALSE)
   }
}

# Compute the feature with this (0-based) index, as catch22_all does
compute_feature <- function(data, index, mask_nans = TRUE){

   check_series(data)
   res <- catch22_compute_feature_cpp(as.double(data), index, isTRUE(mask_nans))

   if(!res$ok){
      warning("the time series is empty or contains NaN/NA/Inf; the feature is NaN",
              call. = FALSE)
   }

   return(res$value)
}

# Compute a feature by its name (for the per-feature functions)
compute_named_feature <- function(data, name, mask_nans = TRUE){
   return(compute_feature(data, catch22_feature_index_cpp(name), mask_nans))
}
