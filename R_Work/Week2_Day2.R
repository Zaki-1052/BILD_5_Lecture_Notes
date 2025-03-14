
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
  geom_line()



#Getting weather data from the nycflights13 package
weather<-nycflights13::weather
weather$time_hour
unique(weather$origin)
JFKweather<-weather[weather$origin=="JFK",]




#Graph 2: Sketch a graph of the relationship between time hour and temp for the entire year.

#Line plot
ggplot(data = JFKweather,mapping = aes(x = time_hour,y = precip))+
  geom_line()

#Shape of a distribution, Histogram!
ggplot(data = JFKweather,mapping = aes(x = precip))+
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
