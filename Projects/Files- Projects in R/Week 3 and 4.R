# Assignment: ASSIGNMENT 2.1
# Name: Pashtunyar Shaquiel
# Date: 2023-01-07

library(ggplot2)
library(dplyr)
library("readxl")
setwd("C:/Users/spashtunyar/Documents/school/DSC0640")
dir()
Pop_df <- read_excel("world-population.xlsx")
ggplot(Pop_df, aes(x=Year, y=Population)) +   geom_step(color="red")+ ggtitle("Population Per Year")+ scale_y_continuous(labels = scales::comma)+ geom_point()

ggplot(Pop_df, aes(x=Year, y=Population)) +   geom_line(color="red")+ ggtitle("Population Per Year")+ scale_y_continuous(labels = scales::comma)

                     