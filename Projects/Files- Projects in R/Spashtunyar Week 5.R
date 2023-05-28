# Assignment: ASSIGNMENT 5.2
# Name: Pashtunyar Shaquiel
# Date: 2022-07-10


library("dplyr")

setwd("C:/Users/spashtunyar/Documents/school/data")
dir()
scores <- read.csv("scores.csv")
theme_set(theme_minimal())

str(scores)

head(scores)
#Question 1.1
#GroupBy, Summarize, Mutate, Filter, Select, and Arrange. Perform these on the data set

#Group By orders the variables
scores %>% group_by(Section, Score)
scores %>% group_by(Score, Section) 
#Mutate adds a column allowing for quick calculations and new column creation
scores %>% mutate(Score/Count)
#Summarize adds a mean/max/median calculation
scores %>% summarise(mean(Score))
scores %>% summarize(max(Score))
#Arrange function allows for sorting
scores %>% arrange(Section)
#Select allows for selection of columns
scores %>% select(Section,Count)
#Filter allows for a selection of a specific value in your data table, I can grab just the sports data
scores %>% filter(Section == 'Sports')

#Question 1.2
#Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.

install.packages('purrr')
library("purrr")
data1<-data.frame(scores)
list1<- as.list(data1)
list1
#Keep function keeps values that pass a logical test
#Discard function removes values that pass a logical test
list1 %>% discard('Sports')
list1 %>% keep("Sports")

#Use the cbind and rbind function on your dataset
States<-c("California", "Florida", "New York", "Texas")
AreaCodes <-c("95135", "45687","15496","54462")
Somerandomstuf <- c("sfa", "afasejfb", "sdfhjasb df", "hello")

WeCBind<- cbind(States,AreaCodes,Somerandomstuf)
WeCBind2<- cbind(States,AreaCodes,Somerandomstuf)

WERBind<-rbind(WeCBind,WeCBind2)

#Split a string, then concatenate the results back together
install.packages("stringr")
library("stringr")
SplitStuff <- str_split(scores$Sscore,pattern = "Sports")
SplitStuff2 <- str_split(scores$Score,pattern = "Regular")

Concates<-paste(SplitStuff, SplitStuff2)
