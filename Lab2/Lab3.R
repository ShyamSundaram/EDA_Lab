rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab3")

library(forecast)
library(tseries)

data=read.csv("Tractor-Sales.csv")

class(data)
data=ts(data$Number.of.Tractor.Sold,start=c(2003,1),frequency=12)
class(data)

plot(data,xlab='Years',ylab='Tractor Sales')

plot(diff(data),ylab='Differenced Tractor Sales')

ld<-log10(data)
plot(ld,ylab='Log (Tractor Sales)')

dld<-diff(ld)
plot(dld,ylab='Differenced Log (Tractor Sales)')

adf.test(dld)

par(mfrow=c(1,2)) #to analyze multiple graphs in a single windows

acf(ts(dld),main='ACF Tractor Sales')
pacf(ts(dld),main='PACF Tractor sales')

ARIMAfit=auto.arima(dld,ic="aic",trace=TRUE)
summary(ARIMAfit)

fc=forecast(ARIMAfit,level=c(95),h=3*12)
plot(fc)
summary(fc)
attributes(fc)
