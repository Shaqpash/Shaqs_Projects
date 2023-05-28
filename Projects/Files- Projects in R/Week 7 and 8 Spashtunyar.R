# Assignment: ASSIGNMENT 4.2
# Name: Pashtunyar Shaquiel
# Date: 2023-02-04

library(ggplot2)
library(dplyr)
setwd("C:/Users/spashtunyar/Documents/school/DSC0640/ex4-2")
dir()
BirthYear_DF <- read.csv("birth-rates-yearly.csv")

Groups<- BirthYear_DF %>%group_by(year) %>%summarise_at(vars(rate), list(name = mean))

ggplot(Groups, aes(x=year, y=name)) + geom_point() + ggtitle("Birth Rate Per Year")
 
dir()

Crime <- read.csv("crimerates-by-state-2005.csv")

ggplot(Crime, aes(x = state, y = population)) +
  geom_point(aes(color = state, size = murder), alpha = 0.5) + ggtitle("State Population as sized by murder rate")

ggplot(BirthYear_DF, aes(x=rate)) +geom_density(fill="#69b3a2", color="#e9ecef", alpha=1) + ggtitle("Birth Rate Density over the last 60 years") 
