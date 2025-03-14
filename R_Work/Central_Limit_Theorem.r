library(nycflights13)
library(ggplot2)
flightData<-flights

JFKWeather<-weather[weather$origin=="JFK",]
JFKAprilWeather<-JFKWeather[JFKWeather$month==4,]
AprilTemp<-(JFKAprilWeather$temp)
### 5 num sum###
min(AprilTemp)
max(AprilTemp)
#####Median####

SortedAprilTemp<-sort(x = AprilTemp,decreasing = TRUE)
SortedAprilTemp
length(SortedAprilTemp)
length(SortedAprilTemp)*.5
SortedAprilTemp[360]
median(AprilTemp)
#median is just the .5 quantile

quantile(AprilTemp,.5)

#which is how we can calculate our upper and lower quartiles as well


quantile(x = AprilTemp,probs = .25)
quantile(x = AprilTemp,probs = .75)


#median if you have an even number of data
set.seed(2)
sixrandomdata<-rnorm(n = 6,mean = 2)
sorted6<-sort(sixrandomdata)
sorted6
median(sorted6)
(1.9197482+2.1324203)/2

####Mode has to be done by hand####
uniqueapril<-unique(AprilTemp)
table1<-tabulate(match(AprilTemp, uniqueapril))
uniqueapril[which.max(tabulate(match(AprilTemp, uniqueapril)))]
aprilobs<-cbind(table1,uniqueapril)
order(table1)

sum(AprilTemp==51.98)


###Mean###
AprilTemp<-(JFKAprilWeather$temp)

sum(AprilTemp)/length(AprilTemp)
mean(AprilTemp)



####Normal Distribution
windows() #Pull out a graphing window on PC
quartz() #Pull out a graphing window on Mac
curve(dnorm(x,mean(AprilTemp),sd(AprilTemp)),xlim = c(0,100))







###########Central Limit Theorem Visualized#################

#when every number is equally likely to be randomly drawn, we call that a uniform distribution. When you ask for a random number, what you are really asking for is a random draw from an uniform distribution bound between a min and max.

set.seed(2)
UniformData <- runif(n = 10000,min = 1,max = 20) # Let's randomly draw 1000 numbers from a uniform distribution ranging from -5 to 5

min(UniformData)
max(UniformData)

windows()
hist(UniformData) #looks like a rectangle!

mean(UniformData) #What would a distribution of means look like?



SquareData<-runif(n = 5,min = ,max = 5) #lets start small
windows()
#or `quartz()` on a mac!
hist(SquareData) #looks like a rectangle!

mean(SquareData) #I want to see what 1000 random means looks like!

meansofdata<-NA #lets use a loop, starting with an empty vector to fill
windows()
for(i in 1:1000){
  #Sys.sleep(0.02) #Change to speed up or slow down the demo
  SquareDataSample<-runif(n = 500,min = 1,max = 20) #exactly what we did above
  meansofdata[i]<-mean(SquareDataSample) #For each loop in 1000, calculate the mean of the random sample and add it to the vector
  hist(meansofdata,breaks = 10,xlim = c(1,20))
}
hist(meansofdata,breaks = 10,xlim = c(5,15)) #for each step in the loop, plot a histogram of the saved mean values to that point.
##Don't believe me? Try it with another distribution. Any continuous distribution will work!

?rexp
?rbeta
?rnorm






###figures for ppt slides###

#This code was not shown in class, but instead made the figures we looked at on the slides
ggplot(data = JFKAprilWeather, mapping = aes(x = factor(month), y = temp)) +
  geom_point(color="darkgreen",alpha=0.2)

ggplot(data = JFKAprilWeather, mapping = aes(x = factor(month), y = temp)) +
  geom_jitter(width = .30, height = 0,alpha=0.4,color="darkgreen",size=3.3)+
  geom_boxplot(alpha=.3,lwd=1.5)+
  xlab("April")+
  ylab("Temperature")+
  theme_minimal()

ggplot(data = JFKAprilWeather, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot(lwd=1.5)+
  xlab("April")+
  ylab("Temperature")+
  theme_minimal()


ggplot(data = JFKAprilWeather, mapping = aes(x = temp)) +
  geom_histogram(color="black",fill="darkgreen",binwidth = 3)+
  xlab("April Temperature")+
  theme_minimal()+
  geom_vline(xintercept = median(aprilTemp),color="red",size=1.5)+
  geom_vline(xintercept = quantile(aprilTemp,.25),color="red",size=1.5)+
  geom_vline(xintercept = quantile(aprilTemp,.75),color="red",size=1.5)


ggplot(data = JFKAprilWeather, mapping = aes(x = temp)) +
  geom_histogram(color="black",fill="darkgreen",binwidth = 3)+
  xlab("April Temperature")+
  theme_minimal()+
stat_function(fun = function(x) dnorm(x, mean = mean(AprilTemp), sd = sd(AprilTemp)) * 719 * 3,
              color = "deeppink2", size = 2)


Die_Rolls_d20 <- runif(n = 40,min = 1,max = 20)
hist(Die_Rolls_d20,breaks=20)
abline(v=mean(Die_Rolls_d20),lwd=2,col="red")

meansofDie_Rolls_d20<-NA
for(i in 1:1000){
 #Change to speed up or slow down the demo
  SquareDataSample<-runif(n = 40,min = 1,max = 20) #exactly what we did above
  meansofDie_Rolls_d20[i]<-mean(SquareDataSample) #For each loop in 1000, calculate the mean of the random sample and add it to the vector
   #for each step in the loop, plot a histogram of the saved mean values to that point.
}
hist(meansofDie_Rolls_d20,breaks = 10,xlim = c(7,14))

#Shape
set.seed(4)
figs<-rnorm(n = 30,mean = 45,sd = 10)

sd(x = figs)
mean(x = figs)


figmean<-NA


for(i in 1:1000){
  figs<-rnorm(n = 30,mean = 45,sd = 10)
  figmean[i]<-mean(figs)
}

hist(figmean)
abline(v=49,col="cornflowerblue")
mean(figmean)
sd(figmean)
SE<-sd(figs)/sqrt(length(figs))
mean(figs)

2*SE+mean(figs)
mean(figs)-2*SE
qnorm(p = .9999997)
