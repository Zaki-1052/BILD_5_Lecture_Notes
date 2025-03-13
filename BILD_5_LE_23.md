---
course: BILD 5
type: lecture
lecture_num: 23
date: 3/3
---

# BILD 5 Lecture 23
- ## 3/3

## Linear Modeling

### Announcements

#### Last 2 weeks!
- Checkpoint 2 (10 points): Saturday 8th
- Final projects (30 points): Sunday 16th
- SET form (0-2 points extra credit): Saturday (8:00am) 15th
	- Over 70% of class 1 point
	- Over 90% of class, another 1 point
- Post surveys (1 point each): Thursday 20th
	- Need to have done the pre-surveys for credit

#### Final Exam details
- Review session for both A00 and B00
	- ~~Monday 9th December, 6:00pm-8:30pm, SOLIS 107~~
- A00 Final Exam: Friday 21st, 8:00am-10:59am, CENTR 101
	- 50 points
		- Mostly multiple choice
		- Maybe I’ll have you draw a graph
		- Scenario based
	- Bring a pencil and 1 page note sheet with you
		- No scantron or booklet needed
#### Final exam note sheet instructions
- NAME
- PID
- 1 page (A4, 8.5x11)
- 2 sided
- Written or typed
- No staples or tape (needs to be scanned)
- Trim rough edges if removed from a binder
- Unique
- Counts as your 10 points for section assignment 10
- Your name and PID need to be in the top left corner on both sides, at least 2 in wide and in a box! 
	- Do this first.

### A Linear Model

- Explain the variation in Y with some data x
- As long as Y meets a few conditions:
	- Independent samples
	- Continuous data
	- Normally distributed
- Y ~ β1 X +β0
	- We have done “regression”, “ANOVA”, and “t-tests” using this formula
- $$Y \sim \beta_1X + \beta_0$$
- $(\bar{B} - \bar{A})(A=0,B=1)+\bar{A}=Y$

#### A t-test as a linear model

- Y ~ β1 X +β0
- β0 = mean of group A
- β1 = difference between mean of B and mean of A
- X becomes a binary
- In group A? your x value = 0
- In group B? your x value = 1
#### Notes

- everything is a linear model
	- a t-test is also a regression or anova
		- all linear modeling
	- Y ~ x
	- $\hat{y_i}=\bar{y}$
- outliers
- assume that y is some function of x
	- y = dependent variable
	- x = independent variable
		- y, our dependent variable
			- is some function of
		- our independent variable x
- all linear models:
- explains the variation in y
- with some predictor/ed value X
- if y meets conditions = linear model
	- made up of independent samples
		- not just all of us - class
		- experimental unit
	- continuous data
		- y is continuous
		- use the mean of y
			- null hypothesis
				- t test
				- anova
				- regression
			- y hat = mean of y
		- if the mean means what we think it means
			- y has to be continuous
				- and it has to be 
			- normally distributed
- Y is equal to the slope times X plus the intercept.
	- $Y \sim \beta_1X + \beta_0$
- can perform a t test with this linear model formula
	- have groups A and B
	- with continuous measurement y
- y is some function of the slope times x plus the intercept
	- use linear modeling
- $$Y \sim \beta_1X + \beta_0$$
- **y-intercept = mean of group A**
	- A has a value of 0
- **$\beta_o = \bar{A}$**
- slope would be the difference between B and A
	- first group 0
	- second group 1
	- rise/run
	- run = distance of 1
	- rise is the only thing changing slope
		- rise is how far away the two means are from each other
	- that distance would be the slope
- slope would be the mean of B minus mean of A.:
- **$\beta_1 = \bar{B} - \bar{A}$**
- now need X
	- can be 0 or 1
	- dummy coding:
		- categories assigned to either 0 or 1
- If non-tidy tables were [[#Table 1]]
	- each row's cell would be different participant
		- in a two-sample t-test
- put y response data in a single column
	- like [[#Table 2]]
- instead of A and B
	- just write 0 and 1
- multiplying difference between B and A
	- by zero or one
	- depending on if
	- it's in group A or B
- new way to estimate a given value of y:
- $\hat{Y_A} = \bar{A} + (\bar{B} - \bar{A})(0)$
- $\hat{Y_B} = \bar{A} + (\bar{B} - \bar{A})(1)$
- equations ^
- still have a cloud of dots
- slope is the difference between the two means
- if group matters
	- if significant effect of x axis
	- and A and B truly different from one another
- then the best guess of Group A
	- should be the mean of A
- and the best guess of Group B
	- should be the mean of B
- if individual y is from group A (Y<sub>A</sub>)
	- then have the mean of A
	- plus the difference between
	- the mean of B and the mean of A
	- times zero
- because if in group A
	- have the dummy variable 0
- **$\hat{Y_A} = \bar{A} + (\bar{B} - \bar{A})(0)$**
- The best estimate for a predicted value of Y of A 
	- is just the mean of A plus zero.
- estimate a value for B
- correct guess:
	- mean of B
		- = mean of A
		- plus the difference between
		- the mean of B and the mean of A.
		- Times one
- **$\hat{Y_B} = \bar{A} + (\bar{B} - \bar{A})(1)$**
	- solve for A plus the slope
		- mean dot of B
- equation to understand:
- predict values of y
- with a linear model
- with an intercept and slope
	- like with continuous x
- how far away is mean of blue/green group
	- away from the mean of Y?
- can calculate sums of squares
- how far away are two means 
	- away from grand mean of Y bar
- can then account for 
	- how much variation the model fails to account for
		- [[#Determine the variation the model fails to account for]]
		- variance of the treatment and control group
	- take two lines together
	- get sums of squares
- [[#Determine the variation the model accounts for]]
- **[[#Which together should equal all the variation in Y]]**
- like regression and anova
	- can do same thing with
	- two-sample t-test
		- (not paired one-sample t tests)
- a two-sample t-test can use a t score
- test null:
	- the mean of A minus the mean of B 
	- over the pooled standard error of A and B.
- because sums of squares
- can also calculate an f score
	- the average distance of those arrows in the model,
	- divided by the average distance of those arrows of the residual, 
		- give me an F score.
- a two-sample t-test can be thought of in a linear model framework
	- like regression and anova
- where accounting for proportions of variation
	- taking this approach gives R^2 value
		- because t.test() didn't give R^2
	- have an R^2 value for two-sample t-test
		- You have the proportion of variation
		- explained by whether or not we're
		- in group A or group B divided by 
		- the total variation in the system.

$$t = \frac{\bar{A}-\bar{B}}{PSE_{AB}} \approx f = \frac{\text{MSMod}}{\text{MSResid}} \gg R^2$$

#### Figures

![[linearMeansBoxplot.jpg]]

![[linearModelEquation.jpg]]

###### Tables
###### Table 1

| Group A | Group B |
| ------- | ------- |
| 13      | 22      |
| 9       | 15      |
| 20      | 19      |
| 7       | 23      |
###### Table 2

| Data | "Dummy" X Variable |
| ---- | ------------------ |
| 13   | 0                  |
| 9    | 0                  |
| 20   | 0                  |
| 7    | 0                  |
| 22   | 1                  |
| 15   | 1                  |
| 19   | 1                  |
| 23   | 1                  |
|      |                    |

### Graphs

![[linearModels.png]]

#### Determine the variation the model accounts for

![[modelVariation.png]]

#### Determine the variation the model fails to account for

![[modelVariationFail.png]]

#### Which together should equal all the variation in Y

![[modelYVariation.png]]




### R Code

#### T Test

##### Input

```r
Cat<-rnorm(7,12,2)
racoon<-rnorm(7,15,2)
t.test(Cat,racoon)
library(tidyverse)
```

##### Output

```r
> t.test(Cat,racoon)

	Welch Two Sample t-test

data:  Cat and racoon
t = -4.357, df = 11.986, p-value = 0.0009358
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -7.710710 -2.569291
sample estimates:
mean of x mean of y 
 10.40942  15.54942 
```

##### Notes

- T-Score: 
	- the difference between the mean of the cat 
		- minus the mean of the raccoon 
	- divided by the pooled standard error.
- unequal variances so lost degrees of freedom
- p-value rejecting null
- How much of the total variation in these two animals 
- is captured by the fact that they are two different species,
	- and how much variation is remainder?
- How much of that variation is just because
	- cats have different masses and so do raccoons.
- Want an R squared value for this question.

#### Linear Model

##### Input

```r
# Make it tidy
data<-data.frame(Cat,racoon)
longdat<-pivot_longer(data,1:2,names_to = "Animal",values_to="mass")
model<-lm(longdat$mass~longdat$Animal)
mean(Cat)

mean(racoon)-mean(Cat)
```

##### Output

```r
> data
       Cat   racoon
1 14.46456 17.74365
2 11.19042 13.65802
3 14.70315 15.05964
4 16.21067 12.93473
5 11.72286 14.59266
6 14.79001 19.38132
7 15.60001 15.42911
> longdat
# A tibble: 14 × 2
   Animal  mass
   <chr>  <dbl>
 1 Cat     9.23
 2 racoon 17.2 
 3 Cat    11.4 
 4 racoon 11.7 
 5 Cat    13.9 
 6 racoon 16.0 
 7 Cat    13.9 
 8 racoon 13.7 
 9 Cat    12.8 
10 racoon 15.2 
11 Cat    11.3 
12 racoon 17.1 
13 Cat    15.6 
14 racoon 20.4 
> model

Call:
lm(formula = longdat$mass ~ longdat$Animal)

Coefficients:
         (Intercept)  longdat$Animalracoon  
              10.41                 5.14  

> mean(Cat)
[1] 10.40942
> mean(racoon)-mean(Cat)
[1] 5.14
```

##### Notes

- The mass of the animal depends on which species it is
	- not the other way around
- so linear model
	- t-test built as linear model
- where the mass of the animal is 
- some function of which animal it is
	- Group A or Group B
- get intercept and raccoon-based slope
- if linear model is correct
	- difference between raccoon and cat = 5.14
	- and mass of cat should be 10.41

### Is our model any good?

- Are the assumptions of the test met?
- Null Hypothesis test
- Coefficient of determination: R^2
- Slope biologically meaningful?

![[meaningfulModel.png]]

#### Notes

- now that have linear model
- null hypothesis test
	- T-test or F-test
- can get an R squared value
	- to determine if model is any good
		- is slope biologically meaningful?
			- is 5 pounds *different*?
- test assumptions
	- has residuals
- shouldn't need Y itself 
	- to be normally distributed
- histogram shape of y should have 
	- a normal distribution of cats
	- and a normal distribution of raccoons
- **bimodal** 
	- with no possible transformation
	- just testing all of Y at once isn't correct
- if groups are different
	- then they would not be normally distributed
- thus test the **residuals** instead
- residuals need to be normally distributed
	- test groups separately
- two groups y will be bimodal
- each group will be normal
	- but together won't be
- have residuals
- so have a distance away from each point
	- that average distance centered at zero
- because some dots positive
	- bigger than mean 0
- and some dots negative
	- lower than their mean 0
- test residuals:
	- can center groups on 0
- residuals need to be normally distributed
	- not the grand mean of Y
- because if null is true
	- and they're just one distribution
- the residuals will still catch that
- but if the null is false
	- better to think of them as multiple groups
	- just testing y leads to wrong assumption
		- that data aren't normally distributed
	- when just a normal distribution of cats 
	- and a normal distribution of raccoons.
- now that have a model
- can test model residuals
#### Linear Residuals
![[residualsLinearGraphs.jpg]]

### More R Code

#### Input

```r
hist(model$residuals)
ks.test(model$residuals,y="pnorm",mean(model$residuals),sd(model$residuals))
plot(model)
```
#### Model Graphs
![[modelResidualsHistogram.png]]

#### Output

```r
> model$residuals
          1           2           3           4           5           6           7           8           9          10          11          12 
-2.22772009 -0.88288116  2.04448545  1.02696741  0.19381474  1.51755976  0.26929214  1.66668259 -0.63642036 -1.20427608 -0.58058535  0.07377653 
         13          14 
 0.93713347 -2.19782906 
> ks.test(model$residuals,y="pnorm",mean(model$residuals),sd(model$residuals))

	Exact one-sample Kolmogorov-Smirnov test

data:  model$residuals
D = 0.21871, p-value = 0.4514
alternative hypothesis: two-sided

> 
```

#### Notes

- only need to run one ks.test()
	- if 50 different animals
		- some would fail test for normality on accident
- big p-value
	- fail to reject null
		- that data are normal
- testing assumptions with linear model
- if testing multiple groups within y 
	- then testing residuals
- if data aren't normal
	- then transform it
- another way for model to fail to meet assumptions of model
	- outliers

### Is our model any good??

- Are the assumptions of the test met?
	- *Residuals*
	- *Outliers*
- Null Hypothesis test
- Coefficient of determination: R^2
- Slope biologically meaningful?

![[meaningfulTest2.png]]

#### Notes

- t-test case:
	- two box plots
- a single dot could influence the mean
	- supposed to be middle of distribution
		- mode and median
- outlier
	- mean will travel
	- dot can unfairly pull mean away
- data could still pass normality
	- not skew
- outliers reasons:
	- could have entered data wrong
	- instruments create errors
		- just voltage
	- could be honest measurements
		- data are random variables drawn from a normal distribution
		- histogram has tails
			- positive to negative infinity
		- could be random chance
			- "a big cat"
		- experiment will catch extreme values
	- keep good handwritten notes
- explain it or true measurement of universe
- even if outlier is a true cat
	- can still remove it from model
	- even if data is honest
		- still entitled to remove outlier from model
	- model is already wrong
		- imperfect version of captured universe
	- by chance got a sample
		- from small sample size
	- nullify rest of the model
	- by chance got big sample
	- single random chance
	- would contradict story
##### **Leverage**
###### Leverage Image 
![[leverage.jpg]]
###### Leverage Notes 
- exists for t tests and regression
- linear model trending upwards
- by random chance found outlier
- one dot changes entire model
- because error in universe
- and can't separate whether error is
	- honest standard deviation
		- sampling randomly from true distribution of the universe
	- or human error
- evaluate how important each dot is to the slope
- and if one dot is arbitrarily 10 times more important than the other dotes
	- if it has leverage over the other dots
		- can remove it
- if one dot has leverage over the other dots
	- can make a case for removing it
- if unfairly dragging slope
	- more than the other dots
- then don't keep dot in model
- 1 dot in 20 says 19 observations wrong
- don't let a specific point drive story
- if small sample size
	- no leverage argument
	- all have large leverage
- but if big sample size
	- can remove dot
- reasonable to remove that one outlier
- inform in appendix that outlier was removed
	- supplementary information
### Data Removal

#### Notes

```r
cooks.distance(model)
```

- **Definition**:
- A Cook's distance is a measure of 
	- *how much leverage a point has* 
		- *compared to how far away from the mean it is.*
- if a dot has a lot of leverage
	- but it's close to the mean of X mean of Y
		- not changing the slope much
			- might change intercept
				- but biologically don't care about intercept
		- slope matters in biology
- Cook's distance is looking
	- how far away from the trend line are they
	- and how far away from the mean of X are they?
- high cook's distance areas are high
- Cook's Distance = 
	- how much leverage a point has compared to how far away from the mean it is
- cooks distance
	- how far away from trend line
	- or mean of X
- far away/near middle
	- near fulcrum
	- little leverage
- take cook's distance of linear model
	- still linear model
	- mass still some function of animal
- only worried if cooks distance is 1 or greater
	- should always be between 0 and 1
- get rid of it if its 1
- keep if between 0.5 and 1 
	- (usually make argument)
#### R Code

##### Input

```r
bigCat<-Cat
bigCat[1]<-60
data<-data.frame(bigCat,racoon)
longdat<-pivot_longer(data,1:2,names_to = "Animal",values_to="mass")
model1<-lm(longdat$mass~longdat$Animal)
cooks.distance(model1)
```

##### Output

```r
> cooks.distance(model)
           1            2            3            4            5            6            7            8            9           10 
0.0181077476 0.2455938239 0.0109331283 0.1497004687 0.0034102153 0.0326198375 0.1011385036 0.0565572596 0.5231013648 0.0006549361 

> cooks.distance(model1)
           1            2            3            4            5            6            7            8            9           10           11 
0.9744598524 0.0002576433 0.0358225947 0.0002128913 0.0086481204 0.0006907034 0.0401229826 0.0000352075 0.0544573573 0.0044261020 0.0238413510 
          12           13           14 
0.0003656491 0.0136442985 0.0096819133 
> 
```

##### Notes

- Only worried about outliers if the Cook's distance is a distance of one or greater
- If 0-1, dots are fine
	- some say between 0.5-1 eliminate
		- but make argument
- here one is a hard cut off
- if Cook's distance has a value of 1+
	- get rid of it
- values under one are not outliers

![[constantLeverage.png]]

---

Previous: [BILD 5 Lecture 22](BILD_5_LE_22.md).
Next: [BILD 5 Lecture 24](BILD_5_LE_24.md).