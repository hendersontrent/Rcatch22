#---------------------------------------
# This script sets out to test the core
# functions of the Rcatch22 package
#---------------------------------------

#--------------------------------------
# Author: Trent Henderson, 1 April 2021
#--------------------------------------

library(Rcatch22)

# Simulate some mock data

data <- rnorm(1000)

# Base catch22

outs <- catch22_all(data)

# catch24

outs2 <- catch22_all(data, catch24 = TRUE)
