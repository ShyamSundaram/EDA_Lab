rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab7")

library(factoextra)
library(cluster)

#loading data-------------------
df <- USArrests
df<-na.omit(df)
df<-scale(df) #this is to normalize the values in data because the range of values is not distributed evenly
head(df)

#determine optimal number of clusters=K----------
#plot number of clusters vs total within sum of squares
fviz_nbclust(df,kmeans,method="wss") #we see that after scaling, we get a bend at k=4 so that is the optimal number of clusters


#Perform k-means clustering with optimal number of k----------

set.seed(1) #to reproduce same results always
km <- kmeans(df,centers = 4,nstart = 25)

km

#plot results of final k-means model
fviz_cluster(km,data=df)

#add cluster assignment to original data
final_data<-cbind(USArrests,cluster=km$cluster)

#view final data
head(final_data)
