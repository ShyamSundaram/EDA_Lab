rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab3")

library(forecast)
library(tseries)

data=read.csv("Tractor-Sales.csv")

class(data)
data=ts(data$Number.of.Tractor.Sold,start=c(2003,1),frequency)