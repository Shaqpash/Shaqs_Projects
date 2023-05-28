# Assignment: ASSIGNMENT 1.2
# Name: Pashtunyar Shaquiel
# Date: 2022-12-10

library("ggplot2")
library(dplyr)
setwd("C:/Users/spashtunyar/Documents/school/DSC0640")
dir()
Hotdog_df <- read.csv("hotdog-contest-winners.csv")
ggplot(Hotdog_df, aes(x=Year, y=Dogs.eaten)) + geom_bar(stat="identity", color="blue")+ggtitle("Hotdogs eaten per year")

ggplot(Hotdog_df, aes(fill=Winner, x=Country, y=Dogs.eaten)) + geom_bar(position="stack", stat="identity")+ggtitle("Hotdogs eaten each year by winning country, stacked")
 
ggplot(Hotdog_df, aes(x="", y=Dogs.eaten, fill=Country)) +geom_bar(stat="identity", width=1) +coord_polar("y", start=0) + theme_void()+ggtitle("Sum of Hotdogs eaten each year by winning country")

Obama <- read.csv("obama-approval-ratings.csv")
hsize <- 1
Hotdog_df <- Hotdog_df %>% mutate(x = hsize)
ggplot(Hotdog_df, aes(x = x, y = x, fill = Country)) +
  geom_col(color = "black") +
  coord_polar(theta = "y") +
  xlim(c(0.2, hsize + 0.5))+ggtitle("# of contest wins per Country")
