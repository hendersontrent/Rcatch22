#---------------------------------------
# This script sets out to test the core
# functions of the catch22 package
#---------------------------------------

#--------------------------------------
# Author: Trent Henderson, 1 April 2021
#--------------------------------------

library(catch22)

# Calculations

data <- 1 + 0.5 * 1:1000 + arima.sim(list(ma = 0.5), n = 1000)
outs <- catch22_all(data)

# Feature data

View(feature_list)
