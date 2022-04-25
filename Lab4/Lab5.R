rm(list=ls())

setwd("C:/Files/Academics/VIT/Lab/EDA/19BCE1560/Lab5")

combined_groups <- read.csv("onewayanova_machine.csv")
combined_groups
summary(combined_groups)
boxplot(combined_groups,ylab="Diameter",xlab="Machines",col="green")
stacked_groups<-stack(combined_groups)

stacked_groups
names(stacked_groups)<-c("Diameter","Machines")
stacked_groups

anova_results<-aov(Diameter~Machines,data=stacked_groups)
summary(anova_results)
tk<-TukeyHSD(anova_results)

tk
plot(tk,col="blue")
