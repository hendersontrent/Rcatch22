#---------------------------------------
# This script sets out to test the core
# functions of the catch22 package
#---------------------------------------

#--------------------------------------
# Author: Trent Henderson, 1 April 2021
#--------------------------------------

library(dplyr)
library(magrittr)
library(catch22)

# Simulate some data

x <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)

# TEST 1: catch22_all

outs <- catch22_all(x)

# TEST 2: Normalisation

test_scaler <- function(method = c("z-score", "Sigmoid", "RobustSigmoid", "MinMax", "MeanSubtract")){
  df <- outs %>%
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

# TEST 3: Data quality matrix

plot_quality_matrix(outs)

# TEST 4: Feature matrix

plot_feature_matrix(outs, is_normalised = FALSE, id_var = NULL, method = "RobustSigmoid")

# Test 5: PCA

plot_low_dimension(trial, is_normalised = TRUE, id_var = NULL, plot = TRUE)
d <- plot_low_dimension(trial, is_normalised = TRUE, id_var = NULL, plot = FALSE)
