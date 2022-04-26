rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab6")

mydata <- read.csv(file.choose(),header=T)
str(mydata)
head(mydata)
summary(mydata)
hist(mydata$admit,col="blue")
mydata$admit<-as.factor(mydata$admit)
summary(mydata)

library(caret)

#partitioning and training
train_ind=createDataPartition(mydata$admit,p=0.80,list=F)
train_ds=mydata[train_ind,]
test_ds=mydata[-train_ind,]
my_model=glm(admit~.,data=train_ds,family="binomial") #admit~. means admit is 'y' and all other attributes are the 'x' attributes
summary(my_model)

#testing on train data
pred_train=predict(my_model,train_ds,type="response")
pred_train
pred_train=ifelse(pred_train>0.5,1,0)
tab1<-table(Predicted=pred_train,Actual=train_ds$admit)
tab1 #this is the confusion matrix
1-sum(diag(tab1))/sum(tab1) # misclassification error

#testing on testing data
pred_test<-predict(my_model,test_ds,type='response')
pred_test
pred_test<-ifelse(pred_test>0.5,1,0)
tab2<-table(Predicted=pred_test,Actual=test_ds$admit)
tab2
1-sum(diag(tab2))/sum(tab2)
