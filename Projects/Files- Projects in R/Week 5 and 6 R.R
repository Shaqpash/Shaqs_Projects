# Assignment: ASSIGNMENT 3.2
# Name: Pashtunyar Shaquiel
# Date: 2023-01-22

library(ggplot2)
library(dplyr)
setwd("C:/Users/spashtunyar/Documents/school/DSC0640")
dir()
unemploy_DF <- read.csv("unemployement-rate-1948-2010.csv")
install.packages("treemapify")

library(plotly)
library(treemapify)

# Plot
ggplot(unemploy_DF, aes(x=Year, y=Value)) +stat_summary(fun = "mean", geom = "area")  + ggtitle("Unemployemnt per year")

ggplot(unemploy_DF, aes(x=Year, y=Value, fill = Period)) +stat_summary(fun = "mean", geom = "area") + ggtitle("Unemployemnt per year")


new_df <-unemploy_DF %>%
  group_by(Year) %>%
  summarise_at(vars(Value), list(name = mean))

new_df

ggplot(new_df, aes(area = Year, fill = name)) +
  geom_treemap()+ ggtitle("Unemployemnt per year")


