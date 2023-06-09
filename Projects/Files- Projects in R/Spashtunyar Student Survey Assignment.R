#Student Survey
# Week7
# Name: Pashtunyar, Shaquiel
# Date: 2022-07-24

## Set the working directory to the root of your DSC 520 directory
setwd("C:/Users/spashtunyar/Documents/school/DSC0520/")
dir()
## Load the `data/r4ds/heights.csv` to
SSurvey <- read.csv("data/Student-survey.csv")

library('ggplot2')
cov(SSurvey$TimeReading,SSurvey$TimeTV)
#-20.36364
cov(SSurvey$TimeReading,SSurvey$Happiness)
#-10.35009
cov(SSurvey$TimeReading,SSurvey$Gender)
#-0.08181818
cov(SSurvey$TimeTV,SSurvey$Happiness)
#114.3773
cov(SSurvey$TimeTV,SSurvey$Gender)
#0.04545455
cov(SSurvey$Happiness,SSurvey$Gender)
#1.116636

#Q1 there is a negative coorelation between Time reading and the amount of TV time or Happiness you get
#There is a positive coorelation between Happiness and TV
#there is no gender bias one way or the other
#Conclusion, TV makes us happy, not sure I believe that though, feels like to few data points to tell

#Q2 The main measurement we are trying to gather is Happiness levels from the amount of time you spend reading or watching TV
#I think the reading time is in hours and TV is in minutes, converting to one time would help
#It would aid in not showing such high or low cov values so we can more easily identify a trend
#Also Happiness is very subjective, its hard to say how thats calculated, maybe moving to overall day satisfaction levels

#Q3 I would perform a correlation between TV time spent and Happiness since those seem to have the highest levels of cov positivity, I expect them to be coorelated

#Q4.1
cor(SSurvey)
#Q4.2
cor(SSurvey$TimeReading,SSurvey$TimeTV)
#-0.8830677
cor(SSurvey$TimeReading,SSurvey$Happiness)
#-0.4348663
cor(SSurvey$TimeReading,SSurvey$Gender)
#-0.08964215
cor(SSurvey$TimeTV,SSurvey$Happiness)
#0.636556
cor(SSurvey$TimeTV,SSurvey$Gender)
#0.006596673
cor(SSurvey$Happiness,SSurvey$Gender)
#0.1570118
#Q4.3
cor.test(SSurvey$TimeTV,SSurvey$Happiness, probs=c(.99))
cor(SSurvey)
#Q4.4 What the matrix shows us is that the Happiness to TV time positivity holds true.

#Q5
cor(SSurvey, method="pearson")
SurveyR2 <- lm(Happiness ~ TimeTV+TimeReading+Gender, data = SSurvey)
summary(SurveyR2)
# I am still seeing the coorelation of TV and Happiness being coorelated
#Q6 yes we did see in the cor test for TimeReading and Time TV to be heavily negative in coorealtion, which makes sense, the more TV watched the less time your likely to read

install.packages('ppcor')
library('ppcor')
#Q7 
#1) Happiness as a control variable results
pcor.test(SSurvey$TimeTV, SSurvey$TimeReading, list(SSurvey$Happiness))
#2) Watching TV time as a control variable results
pcor.test(SSurvey$TimeReading,SSurvey$Happiness, list(SSurvey$TimeTV))
#3) Reading time as a control variable results
pcor.test(SSurvey$TimeTV, SSurvey$Happiness, list(SSurvey$TimeReading))


#By isolating the variables, we see that the time TV and Happiness still have the highest statistic value and that The more TV you watch the less you read, lastly the Reading time does correlate to happiness but not as much as TV.
#With test we perform seems to reiterate the initial findings indicating that our original correlation study shows accurate results. The Isolation study does show positivity to reading when taking TV out of the picture. 