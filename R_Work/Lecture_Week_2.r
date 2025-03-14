###Types of data###

#It is unlikely that you would use this code for this class. This is really just to illustrate that the five types of data we discussed all have unique identities in R.

#Continuous
dat <- c(2,3.3,1000,0.02)


#Count

Num_of_birds <- c(1,5,12,15,0)
int_num_of_birds <- as.integer(Num_of_birds)


#Ordinal
temps<-c("low","med","high")
ordertemps<-factor(temps,ordered = TRUE,levels = c("low","med","high"))

#Binomial
color<-c("red","orange")
logicol<-color=="red"

#Categorical

sandwich <- c("BLT","Grilled Cheese", "Hot Dog?")




###Types of Figures####
library(nycflights13)#Import the big data table we are working with today

flights<-nycflights13::flights #Assigning it to an object we can manipulate.

#two ways to index data frames
flights[,5]
flights$sched_arr_time



library(tidyverse) #Loading the package we use all the time.

HAflights<-flights[flights$carrier=="HA",]#subset the flights data so only Hawaiian flights exist

#Making a scatter plot
ggplot(data = HAflights,mapping = aes(x = dep_delay,y = arr_delay))+
  geom_point()



#Getting weather data from the nycflights13 package
weather<-nycflights13::weather
weather$time_hour
unique(weather$origin)
JFKweather<-weather[weather$origin=="JFK",]




#Graph 2: Sketch a graph of the relationship between time hour and temp for the entire year.

#Line plot
ggplot(data = JFKweather,mapping = aes(x = time_hour,y = temp))+
  geom_line()

#Shape of a distribution, Histogram!
ggplot(data = JFKweather,mapping = aes(x = temp))+
  geom_histogram()





#Boxplot

weather
ggplot(data = weather,mapping = aes(x = origin,y = temp))+
  geom_boxplot()



#Graph 3: Sketch the relationship between airport origin and total number of delayed flights at that airport.

#Bar graph
delayedflights<-flights[flights$dep_delay>0,]#Subset the data for only delayed flights


ggplot(data = delayedflights,mapping = aes(x = origin))+
  geom_bar(stat = "count")
