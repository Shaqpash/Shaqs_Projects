# Assignment: ASSIGNMENT 5.2
# Name: Pashtunyar Shaquiel
# Date: 2023-02-19

library(ggplot2)
library(dplyr)
setwd("C:/Users/spashtunyar/Documents/school/DSC0640/ex5-2")
dir()
Costco <- read.csv("costcos-geocoded.csv")

install.packages("ggalt")
install.packages("MASS")
library(sf)
library(raster)
library(MASS)

Costco %>% 
  ggplot(aes(x = Longitude, y = Latitude))+
  geom_point()+
  labs(title = "Spatial Map of Costco Locations")

Points<- read.csv("ppg2008.csv")

ggplot(Points, aes(x = MIN, y = FGA, fill = PTS)) + geom_tile()+ ggtitle("Field Goal Attempts by minute = points in 2008")

x<-Points['G']
y<-Points['PTS']
z<-  kde2d(x, y, n = 50)
             

contour(x, y, z)
