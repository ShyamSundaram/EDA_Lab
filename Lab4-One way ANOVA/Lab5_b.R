rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab5")

combined_groups <- read.csv("One way Anova_Football.csv")
combined_groups
summary(combined_groups)
boxplot(combined_groups,ylab="Weight",xlab="Teams",col="green")
stacked_groups<-stack(combined_groups)

stacked_groups
names(stacked_groups)<-c("Weight","Teams")
stacked_groups

anova_results<-aov(Weight~Teams,data=stacked_groups)
summary(anova_results)
tk<-TukeyHSD(anova_results)

tk
plot(tk,col="blue")
