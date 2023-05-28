# Assignment: ASSIGNMENT 4.2
# Name: Pashtunyar Shaquiel
# Date: 2022-07-03

library("ggplot2")
library("psych")
library(DBI)
library(RSQLite)

setwd("C:/Users/spashtunyar/Documents/school/data")
dir()
library(readxl)
scores <- read.csv("scores.csv")
theme_set(theme_minimal())

str(scores)

#Question 1.1 the three observational units are count, score, and section

#Question 1.2 From the str function we can see count and score are integers and are quantative, while section is a character and categorical

head(scores)

aggregate(Count ~ Section +Score,scores, mean)
install.packages("dplyr")
library("dplyr")

head(scores)
x1<-data.frame(scores)
names(x1)
subset1<- filter(x1, Section == "Sports")
subset2<- filter(x1, Section == "Regular")
#Question 1.3 above in the subset functions

ggplot(subset1, aes(Score)) + geom_histogram() +ggtitle("Student scores in Sports Section") +xlab("Score acheieved") +ylab("# of sections acheiving score")
ggplot(subset2, aes(Score)) + geom_histogram() +ggtitle("Student scores in Regular Section") +xlab("Score acheieved") +ylab("# of sections acheiving score")
#Question 1.4.1 I Don't believe you can say that, the Sports section had a bigger distribution of scores, with some being higher and lower than the max and min of the Regular section. The regular section seemed more controlled.
#Question 1.4.2 Yes there was one sports section that scored higher than all of the regular sections. The Central tendecy shows that the Regular section is more centralized than the sports section
#Question 1.4.3 There are a couple things that can affect the sections, like what time the classes occur, the atheltic ability of the students, distribtion of male vs female and more


#Question 2
library("dplyr")
dir()
housing <- read_excel("week-7-housing.xlsx")
str(housing)
x2<-data.frame(housing)
x2
class(x2)
matrix1<-as.matrix(x2)
class(matrix1)

apply(x2[c('Sale.Price','zip5')],2,mean)

aggregate(Sale.Price ~ zip5,x2, mean)

subset3<- filter(x2, Sale.Price >700000)
org<-arrange(subset3,desc(Sale.Price))
subset4<- filter(x2, Sale.Price <=700000)
org2<-arrange(subset4,desc(Sale.Price))
mutate(org2,pricepersqtft = Sale.Price/square_feet_total_living)
superset<-bind_rows(org,org2)

ggplot(x2, aes(x=Sale.Price)) + geom_histogram() +ggtitle("Sales Price in Redmond")
#2 outliers of homes sold and quite a bit higher than the norm, this is likely due to them being luxury homes
add_row(org2, Sale.Price=400000, zip5=98052)
add_row(org, Sale.Price=1234567, zip5=98052)
head(x2)

