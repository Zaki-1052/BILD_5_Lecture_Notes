---
course: BILD 5
type: lecture
lecture_num: 18
date: 2/19
---

# BILD 5 Lecture 18
- ## 2/19

## ANOVA
### R Code
```r
#What if I want to compare 3 groups?

A<-c(56,63,45,41,71,60,78,50,68,62)
B<-c(40,48,60,38,32,44,66,22,45,54)
C<-c(71,57,64,44,73,50,79,67,84,61)
data<-data.frame(A,B,C)

better_Data<-pivot_longer(data,1:3,names_to = "Group",values_to = "response")


model<-lm(response~Group,data =better_Data)
model


model$residuals
head(better_Data)
56-mean(A)

ks.test(model$residuals,"pnorm",mean(model$residuals),sd(model$residuals))


anova(model)
```

### Notes

#### Intro

- Third group
- measurements of mating calls
	- for BFB
		- lives on islands
		- three groups:

| MiD | K   | D   |
| --- | --- | --- |
| \#  | \#  | \#  |
- loudness of mating call
	- continuous measurement (dB)
- are these groups different from one another
	- more than two
- Make a boxplot
	- with three groups
- could make **three** two sample t tests
- research question:
	- are populations different from one another
- what is "wrong" with performing multiple t tests
	- Increasing Alpha
		- Type I Error
			- accidentally rejecting a null that was supposed to be true
				- if there truly was no difference
					- might still accidentally get a small p-value
						- why they were uniformly distributed
						- if null is true, randomly drawing p-value from uniform
							- 5% of the time, p-value will be wrong
			- type 2 error:
				- missed signal
				- should have rejected null but didn't
		- 3 separate t tests
		- 3 p-values
	- if null is true and groups aren't different
		- drawing 3 numbers
		- if any one of those numbers less than 0.05
			- rejecting null
	- if one of the p-values are less than 0.05
		- then reject the null
	- increasing likelihood of committing type 1 error
		- because performing multiple experiments on the same research question
		- if null is true:
			- **each** t-test has 5% of being wrong
				- if any one of those t-tests is significant
				- then rejecting null that groups are identical
				- and accepting alternate that they're different
			- if more than two groups
				- don't want system that requires multiple tests for single research question
					- are these populations different from one another
	- if any one of the t tests are significant
		- then accepting null that they're different
	- what if 50 groups
		- and only one reject null
			- don't want to do 50! factorial
	- incorrectly reject null
	- when not actually significant
	- some would be significant by random chance
		- alpha
			- set
- system:
	- single null hypothesis test
		- for more than two distributions of data

#### Part 2

- how would i get a single null hypothesis out of this graph
	- boxplot of 3 groups
- goal:
	- are three populations different from one another
- if they're the same
	- null: all random variables drawn from a single distribution
		- one/single big population
			- spans all three islands
	- alternate: not true
- random bets guess at any random bird that we haven't measured yet (loudness)
	- mean of y = $\bar{y}$
		- **grand mean**
- new null equation
	- Predicted values of y are equal to the mean of y
	- H<sub>o</sub>: Predict *y* = $\bar{y}$
		- (if x says nothing)
		- mean of y is all you know
- alternate:
	- these means of each group matter
		- is this single mean the best estimate of universe
		- or means of each group on own better estimates
	- individual means = model
		- can predict values of y
			- y predict (y hat)
				- $\hat{y}$
			- predicted values of y
				- equal to some function of x
		- ŷ == x
			- $\hat{y} \equiv x$
- pink on graph is null expectation
	- if group didn't matter
		- don't measure it
	- mean of whole group is best guess for loudness of any bird that we measure in the future
		- if islands' populations are different from one another
			- then these means of island one, two, and three
			- will help predict loudness of bird
			- loudness of bird might depend on island
	- loudness of call = $\hat{y}$ (y hat)
	- x = island
- q:
	- is best prediction of loudness of bird call
		- just the mean of all bird calls
			- or does loudness of call 
		- depend on island measuring bird from
#### Example

```r
#What if I want to compare 3 groups?
library(tidyverse)

A<-c(56,63,45,41,71,60,78,50,68,62)
B<-c(40,48,60,38,32,44,66,22,45,54)
C<-c(71,57,64,44,73,50,79,67,84,61)
data<-data.frame(A,B,C)

better_Data<-pivot_longer(data,1:3,names_to = "island",values_to = "birdcall")
View(better_Data)

model<-lm(birdcall~island,data =better_Data)
model
```
- multiple comparisons
- table isn't tidy
- each row should be a different individual
- row 1 isn't same bird on three different islands
- measured 3 distinct populations
- so we want to tidy it up
	- use `pivot_longer()`
		- takes data
			- untidy columns
		- creates two new columns
			- one where column names become a group
				- A, B, C
					- every individual in column A is a new
			- and birdcall
- becomes better_data
	- every bird is a row
	- have two pieces of information about these birds
		- how loud their call was
			- y-axis
		- which island they were from
			- x-axis
	- know length of table is 30
		- 30 is our sample size
- let R build us a model
##### Model

```r
> model

Call:
lm(formula = birdcall ~ island, data = better_Data)

Coefficients:
(Intercept)      islandB      islandC  
       59.4        -14.5          5.6  

> 
```
- birdcall is some function of the island
- LM = linear model
- linear model has three parts:
	1. intercept
	2. island B
	3. island C
- where numbers are coming from
	- mean of island A is intercept
		- bc model is saying
			- not just horizontal line at y
				- if in group 1
					- how loud you are
				- if group 2, 14 decibels quieter than group 1
```r
> mean(A)
[1] 59.4
> mean(A)-mean(B)
[1] 14.5
> mean(C)-mean(A)
[1] 5.6
> 
```
- linear model is trying to build an equation
	- to predict what bar you're in 
- equation:
	- expected value of bird call
		- y hat ($\hat{y}$)
	- equal to
		- intercept 
			- 59.4 + -14.5
				- times whether on island B or not
					- 0 or 1
						- if from island B
						- take 14.5 from 59.4
							- put at bottom of boxplot
				- + 5.6 times
					- whether or not in C
						- converted data to zeros and ones
- solve for most likely bird call from any individual
	- by taking 59.4
		- mean of group A
	- subtracting 14.5 
		- ONLY if that bird was measured on island B
	- and adding 5.6
		- ONLY if that bird was found on island C
- equation:
	- lets solve for predicted values
		- know mean line is wrong
###### Equation
- $\hat{y} = 59.4 + -14.5(B) + 5.6(C)$
	- like one equation
		- or conditional statements
			- each research question has one equation to test null
- solving for best guess
	- of how loud bird was
		- given what island bird was from
			- equation would get best guess
				- for how loud that bird was
- one option: 
	- average of all bird loudness
		- might be a good guess
			- this is null hypothesis
- if reject null:
	- best guess should be from equation
#### Normality
- model is using means
	- intercept is mean of group A
		- island B is *slope*
			- distance between means
	- **means**
		- need to test for normality
			- don't run 3 tests
- 3 tests for normality?
	- increase alpha error
- build model:
	- test all data at once
- if one group isn't normal:
	- need to transform everything
		- don't want one test for normality
			- driving entire other multiple groups
- recognize:
	- each of these groups should be a normal distributon
		- centered around its own mean
- box plots = crude histograms
- what if:
	- centered them
	- took each group and centered their means to zero
		- normality test
	- how far away each dot was away from its own mean
		- == residual
- residuals: how far observations are from the **group** mean 
	- (not grand mean)
		- how far away are the island c birds
			- away from the mean of island c
##### Residuals

```r
> head(better_Data)
# A tibble: 6 × 2
  island birdcall
  <chr>     <dbl>
1 A            56
2 B            40
3 C            71
4 A            63
5 B            48
6 C            57

> model$residuals
    1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20 
 -3.4  -4.9   6.0   3.6   3.1  -8.0 -14.4  15.1  -1.0 -18.4  -6.9 -21.0  11.6 -12.9   8.0   0.6  -0.9 -15.0  18.6  21.1 
   21    22    23    24    25    26    27    28    29    30 
 14.0  -9.4 -22.9   2.0   8.6   0.1  19.0   2.6   9.1  -4.0 
 
 > 56-mean(A)
[1] -3.4
```
- residuals:
	- how far away first observation was from mean of its group
		- -3.4
			- first individual was 56
				- mean of group A was 59.4
- **residual** is just the **distance**
	- How far away is each bird from its own group's mean?
		- all of these residuals
			- even though coming from 3 separate islands
		- can all be tested together
			- because all been centered on own group's mean
- instead of running three tests for normality
	- just run one
		- took all 30 residuals
			- distances each observation/bird
				- was from its island's mean
	- asking:
		- are those distances normally distributed?
			- taking three histograms
				- lining them up with each other
					- same place in number line
						- only have to run one test for normality
							- instead of three
	- always sample minus mean
- are these data normal?
	- are residuals normally distributed?
##### Normality KS Test

```r
> ks.test(model$residuals,"pnorm",mean(model$residuals),sd(model$residuals))

	Exact one-sample Kolmogorov-Smirnov test

data:  model$residuals
D = 0.066719, p-value = 0.998
alternative hypothesis: two-sided

> 
```
- YES
	- p-value is almost one
- 30 residuals
	- probability that they're random variables drawn from a normal distribution
		- 99.8% chance
		- D score is very close to 0
		- histogram looks bell-shaped as well
			- residuals are normally distributed
				- can trust that each of my means
					- mean what i think it means
	- any time model is using more than one mean
		- test residuals 
			- instead of testing each mean separately
		- bc more groups =
			- more likely that one of those groups will randomly be not normal
				- even though should meet assumption of normality
	- don't run multiple tests
		- randomness is a part of those tests
###### Histogram

![[residualsHistogram.png]]

##### ANOVA Test
- null hypothesis test
	- want to know if this model is better than null model
		- where predicted values of y are = to mean of y
- $\hat{y_i} = \bar{y}$
	- y hat i = y bar
- two options:
	- testing null with this model
		- bc if slopes close to zero
			- then model close to grand mean
	- but as slopes / difference between groups get bigger
		- have less evidence to support null
- two ways to test hypothesis:
- test hypothesis:
	- t test or 
	- anova
- **anova**: 
	- *analysis of variance*

```r
> anova(model)
Analysis of Variance Table

Response: birdcall
          Df Sum Sq Mean Sq F value   Pr(>F)   
island     2 2152.1 1076.03  6.9884 0.003582 **
Residuals 27 4157.3  153.97                    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
```

- p-value associated with model:
	- probability of f
		- f statistic instead of t statistic
- should we reject null:
	- that model is the truth
		- YES
	- probability of getting our model
		- with differences between groups A and B
	- prob of seeing those differences
		- if truth is that those birds 
			- are all random samples from a single distribution
				- with grand mean of y
	- is a third of a percent
		- 0.0035 way below 0.05
			- reject null and accept alternate
	- data are not all random variables drawn from a **single** distribution
- how:
- use **f-value**
	- a was 59.4
	- b was 14 less than a
	- c was 5 and a half more
- explanation:
	- if model is very similar to mean of y
		- then distance model is away from the mean of y
			- is small
				- difference mean of y is small
			- **slopes** 
				- a is intercept
- calculate:
	- how far away our model is away from the null
		- **sum of squares** of island
			- create a ratio
- residuals: 
	- how far away each point was from model
		- length between arrows = **variance**
			- how far away are all birds from mean of y
- analysis of variance:
	- break up components of total variation observed
		- linear modeling:
			- standing amount of variation in bird call
	- some standard variation in observations about universe
		- some variation due to model
			- thing we think is changing biology 
		- some variation is just random noise
- f-value:
	- signal to noise ratio
		- more signal
			- mean square=
				- average contribution of the model /
				- and average contribution of residuals
	- 1000/150
	- on average:
		- 7 times bigger in model than residuals
		- model is explaining 7 times more than the residuals are
	- the more proportion of variation that model explains
		- more confident in model rejecting null
		- that model is better than the null
- get an f value
	- distribution of all possible f values
		- f distribution
			- f-score
				- how much probability on that side
					- like t testing
- framework how to do anova in R:
	1. make data tidy
	2. build a model
	3. test the residuals
		- if residuals fail
			- transform data until it works
	4. test the model
		- use f-value

---

Previous: [BILD 5 Lecture 17](BILD_5_LE_17.md).
Next: [BILD 5 Lecture 19](BILD_5_LE_19.md).