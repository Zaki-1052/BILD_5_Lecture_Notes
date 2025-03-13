---
course: BILD 5
type: lecture
lecture_num: 6
date: 1/17
---

# BILD 5 Lecture 6
- ## 1/17

## Figure Types

### Code

```r
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
```

### Types

#### Scatter Plot
- x: **continuous**
- y: **continuous**
##### Image
![[scatterPlot.png]]
#### Box Plot
- x: **categorical**
- y: **continuous**
##### Image
![[boxPlot.png]]
#### Bar Plot
- x: **categorical**
- y: **count**
##### Image
![[barPlot.png]]
#### Line Plot
- x: **time**
- y: **continuous**
##### Image
![[linePlot.png]]
#### Histogram
- x: **continuous** or **count**
- y: **frequency**
##### Image
![[histogramPlot.png]]

### Examples

#### Example 1

- NCFlights13
- Departure delay
	- (minutes)
- Arrival delay
	- (minutes)
- **Scatterplot**
	- x: departure delay
	- y: arrival delay
- linear relationship
	- y depends on x
	- but y doesn't depend on x
	- doesn't depend on when plane gets there
- correlation between arrival and departure delay
##### Image
![[scatter_plot.png]]
- line graph would be distinct steps in time
###### Incorrect
- Line Graph
![[incorrect_line.png]]

#### Example 2

- **Line Plot**
	- Time - Hour
		- (M, D, H)
	- Precipitation
		- (centimeters)
##### Images
###### Image 1
![[line_plot_1.png]]
###### Image 2
![[line_plot_2.png]]

#### Example 3
- probability of extreme precipitation
	- extremely unlikely
- **Histogram**
	- poor tools of comparison
	- collapse into fewer categories
		- **box plot**
##### Histogram Images
###### Image 1
![[histogram_plot.png]]
###### Image 2
![[incorrect_histogram.png]]

#### Example 4
- **Box Plot**
	- median
	- 75% & 25% percentile
	- 1.5x times distance
		- histogram on its side
	- continuous *y* information
##### Image
![[box_plot.png]]

#### Example 5
- **Bar Plot**/**Column Plot**
	- categorical airports
	- count *y* info
	- bar = count
##### Bar Graph
![[bar_plot.png]]

##### Info
- 10k NA flights
- identify possible issues
- why visualize
	- summary statistics
	- averages
	- obscure outliers

### PID

- A18247936

---

Previous: [BILD 5 Lecture 5](BILD_5_LE_5.md).
Next: [BILD 5 Lecture 7](BILD_5_LE_7.md).