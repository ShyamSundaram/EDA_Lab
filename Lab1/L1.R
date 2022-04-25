setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab1")

x<-c(200,500,700,1000)
y<-c(0.25,0.5,0.8,1.5)

data_set=data.frame(x,y)
data_set

View(data_set)

str(data_set)

names(data_set)

plot(x,y)

LR_result<-lm(y~x)
LR_result

summary(LR_result)

abline(LR_result)


x=data.frame(x=c(1200))
R<-predict(LR_result,x)
R
summary(R)

#x=data.frame(x=c(6,7,8))
#R1<-predict(LR_result,x)
#R1
#summary(R1)