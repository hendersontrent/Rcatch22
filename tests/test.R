#---------------------------------------
# This script sets out to test the core
# functions of the catch22 package
# using the Empirical 1000 dataset
#---------------------------------------

#--------------------------------------
# Author: Trent Henderson, 1 April 2021
#--------------------------------------

library(dplyr)
library(magrittr)
library(catch22)

#------------------- Pull some real time-series data ---------------

retrieve_dat <- function(){

  # Set up a tempfile and download the dataset

  temp <- tempfile()
  download.file("https://ndownloader.figshare.com/files/24950795",temp)
  ts <- read.csv(temp, header = FALSE)

  ts <- ts %>%
    dplyr::mutate(id = dplyr::row_number()) %>%
    tidyr::pivot_longer(!id, names_to = "timepoint", values_to = "value") %>%
    dplyr::mutate(timepoint = as.numeric(gsub("V", "\\1", timepoint)))

  temp1 <- tempfile()
  download.file("https://ndownloader.figshare.com/files/24950798",temp1)
  ts_info <- read.csv(temp1, header = TRUE)

  d1 <- ts %>%
    dplyr::left_join(ts_info, by = c("id" = "ID"))

  # Calculate features

  storage <- list()
  ids <- unique(d1$id)

  for(i in ids){

    tsPrep <- d1 %>%
      filter(id == i) %>%
      arrange(timepoint)

    tsData <- tsPrep$value

    tmp <- catch22_all(tsData) %>%
      mutate(id = i)

    storage[[i]] <- tmp
  }

  # Pull into one tidy dataframe

  feature_matrix <- data.table::rbindlist(storage, use.names = TRUE)
  return(feature_matrix)
}

feature_matrix <- retrieve_dat()

#------------------- Test package functionality --------------------

#.....
# NOTE: If above function fails, then catch22::catch22_all is broken
#.....

# Test 1: Data quality matrix

plot_quality_matrix(feature_matrix)

# Test 2: Normalisation

test_scaler <- function(method = c("z-score", "Sigmoid", "RobustSigmoid", "MinMax", "MeanSubtract")){
  df <- feature_matrix %>%
    group_by(names) %>%
    mutate(values = normalise_catch(values, method = method)) %>%
    ungroup()

  return(df)
}

scale_test_z <- test_scaler(method = "z-score")
scale_test_sigmoid <- test_scaler(method = "Sigmoid")
scale_test_rsigmoid <- test_scaler(method = "RobustSigmoid")
scale_test_minmax <- test_scaler(method = "MinMax")
scale_test_meansub <- test_scaler(method = "MeanSubtract")

# Test 3: Feature matrix

plot_feature_matrix(feature_matrix, is_normalised = FALSE, id_var = NULL, method = "RobustSigmoid")

# Test 4: PCA

plot_low_dimension(feature_matrix, is_normalised = TRUE, id_var = NULL, plot = TRUE)
d <- plot_low_dimension(feature_matrix, is_normalised = TRUE, id_var = NULL, plot = FALSE)
