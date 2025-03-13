---
course: BILD 5
type: lecture
lecture_num: 7
date: 1/22
---

# BILD 5 Lecture 7
- ## 1/22
	- ## Describing Data:
		- ## Central Tendency

## Describing Data



### Central Limit Theorem

#### Code

```r
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
UniformData <- runif(n = 1000000,min = -5,max = 5) # Let's randomly draw 1000 numbers from a uniform distribution ranging from -5 to 5

min(UniformData)
max(UniformData)

windows()
hist(UniformData) #looks like a rectangle!

mean(UniformData) #What would a distribution of means look like?



SquareData<-runif(n = 5,min = -5,max = 5) #lets start small
windows()
#or `quartz()` on a mac!
hist(SquareData) #looks like a rectangle!

mean(SquareData) #I want to see what 1000 random means looks like!

meansofdata<-NA #lets use a loop, starting with an empty vector to fill
windows()
for(i in 1:1000){
  #Sys.sleep(0.12) #Change to speed up or slow down the demo
  SquareDataSample<-runif(n = 50,min = -5,max = 5) #exactly what we did above
  meansofdata[i]<-mean(SquareDataSample) #For each loop in 1000, calculate the mean of the random sample and add it to the vector
  #hist(meansofdata,breaks = 10,xlim = c(-5,5))
}
hist(meansofdata,breaks = 10,xlim = c(-5,5)) #for each step in the loop, plot a histogram of the saved mean values to that point.
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
```


#### Output

```r
> length(SortedAprilTemp)
[1] 719
> length(SortedAprilTemp)*.5
[1] 359.5
> SortedAprilTemp[360]
[1] 50
> median(AprilTemp)
[1] 50
> #median is just the .5 quantile
> quantile(AprilTemp,.5)
50% 
 50 
> quantile(x = AprilTemp,probs = .25)
 25% 
44.6 
> quantile(x = AprilTemp,probs = .75)
  75% 
55.04
```


### Describing a dataset with numbers

#### Example Images

##### Bar Plot

![[exampleBar.png]]

##### Box Plot

![[exampleBox.png]]

#### Box Plot

- A boxplot is a visual representation of 5 numbers, often called the five-number summary:
	- Maximum
	- Third Quartile (.75 quantile)
	- Median (50th percentile, second quartile)
	- First Quartile (.25 quantile)
	- Minimum
		- Lets look at quantiles in R
##### Box Summary

![[boxSummary.png]]



## The Central Tendency

- What is the most likely April Temperature if we were to randomly sample the data?
	- Median
		- The middle value of our sorted data
			- Use if not a normal distribution
			- If random / uniform distribution
			- Doesn't mean anything if curves
			- Mean would be obscured
	- Mode
		- The value with the greatest frequency in our dataset
			- In R
				- Only describing current dataset
				- Don't use Mode to calculate future
					- (unless in categorical)
	- Mean
		- Sum of all data / length of the data
			- In R: random variables drawn from a normal distribution
				- Use *mean* if a **normal distribution**
				- If bell curve, use mean
				- measurement of Central Tendency of data
					- if normally distributed
						- Middle of distribution
	- See [[ExampleBar.png]]
		- Exploratory data visualization comes first
		- Can't take mean of a dinosaur
		- Mean is for normal distribution
	- Skew
### Median vs Mean vs Mode

- Which of these three numbers is the best guess for a randomly sampled April temperature at JFK?
	- Predicting the future is not the same as duplicating the past<u></u>
##### R code

```r
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
```

##### Bar Image

![[exampleBar.png]]

### The Normal Distribution

> [!Definition]  Normal Distribution
> - A symmetrical distribution centered around the mean, median and mode
> - Common distribution for the shape of natural data
> 	- Common events happen in the middle and extreme events are less likely to occur
- Number should be the middle
- If histogram looks like idealized distribution, can predict future.
	- Best possible guess
	- mode/median could be off on either side
		- 50-50 chance that it was to the left/right
		- random chance that pull away from mean of histogram
	- **Make an assumption about the shape of all possible outcomes of the measurement we are currently taking.**
		- Use info to make best guess at middle/mean of curve
		- Mean is estimate of parameter Mu (μ)
	- if measured every possible temperature every year, get middle of distribution == μ
		- impossible to know, but estimate from data
		- \# should be the middle, future if future is resampling of distribution
	- if histogram of data looks like an idealized distribution, can predict future
		- best possible guess

#### Images
##### Normal Curve

![[Normal-Distribution.png]]

##### Bar Curve

![[barCurve.png]]

### The Central Limits Theorem

- **Important:**
- If random samples are drawn from any distribution
- And we calculate the mean of those samples
- And then repeat that process
- Those means are themselves normally distributed
	- estimates of parameters are always normally distributed
#### Central Limits Graph

![[centralLimitsTheorem.png]]

#### Explanation

- every day roll 20 sided dice 20 times
- ask what was the average number of dice roll
	- what was the average of the face values of the dice roll
- CLT says that that distribution of means (histogram of bars)
	- will itself be normally distributed
- take 5 random samples and calculate mean
	- again, take infinite number of times
	- the distribution of means from this uniform distribution will itself be normally distributed
- step further: collect data, sample mean
	- that mean itself is a single random variable drawn from a distribution of all possible means/outcomes that you could have gotten
- only get to run one experiment once, get that value
- calculated mean (μ)
	- center of all possible observations of that universe
- by calculating a mean, that mean is itself a random number drawn from a distribution of all possible means
- most of means will ideally be near the truth
- normal distribution should show most common outcome of experiment
	- by random chance, think die is weighted
	- mean 10.5 but skewed
	- don't know where in distribution
	- but can control shape of distribution
- shape of normal distribution parameter can be changed
- if increase sample size:
	- range of expected outcomes has decreased
		- law of large numbers
- when you perform an experiment:
	- only get one chance to draw a random value from the distribution of all possible values for that experiment
	- don't know what value you get or how far away from the truth you are
	- but do get to estimate how far away on average from the truth you are

#### R Code

```r

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
UniformData <- runif(n = 1000000,min = -5,max = 5) # Let's randomly draw 1000 numbers from a uniform distribution ranging from -5 to 5

min(UniformData)
max(UniformData)

windows()
hist(UniformData) #looks like a rectangle!

mean(UniformData) #What would a distribution of means look like?



SquareData<-runif(n = 5,min = -5,max = 5) #lets start small
windows()
#or `quartz()` on a mac!
hist(SquareData) #looks like a rectangle!

mean(SquareData) #I want to see what 1000 random means looks like!

meansofdata<-NA #lets use a loop, starting with an empty vector to fill
windows()
for(i in 1:1000){
  #Sys.sleep(0.12) #Change to speed up or slow down the demo
  SquareDataSample<-runif(n = 50,min = -5,max = 5) #exactly what we did above
  meansofdata[i]<-mean(SquareDataSample) #For each loop in 1000, calculate the mean of the random sample and add it to the vector
  #hist(meansofdata,breaks = 10,xlim = c(-5,5))
}
hist(meansofdata,breaks = 10,xlim = c(-5,5)) #for each step in the loop, plot a histogram of the saved mean values to that point.
##Don't believe me? Try it with another distribution. Any continuous distribution will work!

?rexp
?rbeta
?rnorm
```

##### Output

```r
> min(UniformData)
[1] -4.999995
> max(UniformData)
[1] 4.999996
> mean(UniformData) #What would a distribution of means look like?
[1] 0.004032043
> mean(SquareData) #I want to see what 1000 random means looks like!
[1] 0.7860474
```

##### Images

###### Normal Curve

![[normCurve.png]]

###### Uniform Data

![[uniformData.png]]

![[uniformData2.png]]

```r
> min(UniformData)
[1] 1.000437
> max(UniformData)
[1] 19.9993
> mean(UniformData) #What would a distribution of means look like?
[1] 10.56282
```

###### Square Data

![[squareData.png]]

###### Mean Data

![[meansData.png]]

![[meanData.png]]

![[meanData2.png]]
![[meanData3.png]]
- average dice roll is a single value drawn from this distribution of all possible values
- bacterial soil:
	- randomly drawn from a distribution of all possible average concentrations of that bacteria
###### More Mean

![[meansData2.png]]

![[meansData3.png]]

![[moreMean.png]]



#### More Notes

- Lecture - 40
- Large numbers
- One chance to sample data
- Estimate how far away on average



---

Previous: [BILD 5 Lecture 6](BILD_5_LE_6.md).
Next: [BILD 5 Lecture 8](BILD_5_LE_8.md).

