---
course: BILD 5
type: lecture
lecture_num: 22
date: 2/28
---

# BILD 5 Lecture 22
- ## 2/28

## Regression
- building linear models where both x and y are continuous
	- f and t statistic
		- same p-value
		- summary = anova
			- f statistic = t statistic
	- statistical hypothesis tests:
		- t tests
		- anova
		- correlation
		- regression
	- 
- y ~ x
	- is y of grams some function of x in centimeters
- $\hat{y_i} = \bar{y}$
- $\text{Model: } {y} = b_o + b_1(x_1)$
- MS_mod / MS resid = f
- P(F | Ho True)
	- probability of getting f or a greater number than f given the null is true

### Notes

#### Stats

- pretend graphs are identical
- research question:
	- is y some function of x
	- does x influence y
		- is y influenced by x
	- know the name of x and y
		- units
	- is y of grams some function of x in grams
- research question can be answered by null hypothesis:
	- predicted values of y are equal to the mean of y
- null hypothesis of anova:
	- mean of y
		- predict the future
- propose linear model
	- Y equal to an intercept plus a slope times X,
		- y = mx+b
- fit slope to line
	- how far away are predicted values
- solve equation for every value of x identified
- if solve for y at each of observed Xs
	- get those predicted values
- if some of the variation in Y
	- can be explained by more than just knowing the mean of y
		- this model may be explaining it
- interested in the distance that our model was away from the null hypothesis
- if we look at average length of yellow arrows
	- average length because total length is dependent on sample size
- that would be called the mean square of the model
- if divided that by how far away dots were from that model
	- because dots themselves have some error still
		- dots are residual / error
- average contribution to pink arrows would be called
	- the mean square of the residual
- ratio is known as F
- p-value:
	- probability of getting f-statistic or even bigger f-statistic
		- f or greater than f
	- given the null hypothesis is true
- if null hypothesis is true and 
	- best guess of where dots are is just horizontal line
- then yellow arrows should be really small
	- best guess even with straight line model
		- it should be pretty small
- the ratio of yellow to pink should go way down
	- could get all the way to zero
		- where none of the variation is explained by the model
		- and it is all just explained by the pink mean of y
- model:
	- the predicted values of Y are equal to 
		- the intercept plus the slope 
			- times the values of X.
	- $\text{Model: } \hat{y_i} = b_o + b_1(x_1)$
- other way of getting null hypothesis
	- null: predictive values of Y
	- best guess is the mean of Y
- if want model to be a horizontal line at the mean of Y
	- set slope of line equal to zero
		- b<sub>1</sub> = 0
	- new null:
	- slope B one = 0
		- slope sitting right on horizontal line
	- $H_o : b_1 = 0$
- notes:
	- mean of Y
		- horizontal line - slope
			- always passes through mean of X mean of Y dot
				- centered when calculating Y intercept
	- if slope was 0
		- line goes through mean of X mean of Y
	- if solved for intercept
		- would solve for mean of Y
	- Y intercept would be 
		- mean of Y
			- therefore
		- predicted values of Y would be the mean of Y
- f-statistic:
	- **anova**
		- analysis of the variance components in the model
			- how much of the variance can be explained by the line equation 
			- and how much can't be explained / how much is remaining.
- aka **regression**
	- straight line through a cloud of points
	- slope of that regression is either
		- equal to zero and a flat line
	- or equal to some other number
- don't need an F statistic
	- have a single parameter estimate
	- believe is equal to null hypothesized value
		- t-tests
	- create a T score where
		- the slope of model
		- minus Theta 
			- (often zero but not always)
		- minus Theta
			- divided by standard error of slope
	- like one sample t-test
- $$t = \frac{b_1 - \theta}{SE_{b_1}}$$
- t score with p-value:
	- mean minus theta divided by standard error of mean
		- instead of mean, it's a slope now
- like correlation test:
	- correlation minus null hypothesized correlation
		- divided by the standard error of the correlation
	- is a t-score
- different approaches
- former:
	- take ratio of variance components
		- got an F score
	- asked probability of that F score
		- given the null was true
- here:
	- just get a T score
		- probability of given the null hypothesis is true
	- P(*t* | H<sub>o</sub> TRUE)
- all basically doing the same thing
	- is the difference caused by x
		- the slope
	- equal to zero or not
- like a t-test
	- slope of t-test is:
		- difference between mean one and mean two
			- is it zero or some other slope
- when run a linear model in R:
	- is the slope different from zero
		- get a T score to ask that question
- theta is null hypothesized value
- when set up null hypothesis as
	- predicted values of y equal to mean of y
		- we believe the slope would be equal to zero
			- because slope would have to be horizontal
				- to sit on line
- t-test approach
	- test a non zero slope
- if some other population
	- instead of zero
	- expected that slope
	- theta
		- often zero bc
		- null expectation is
		- no effect between X and Y
	- null expectation
		- relationship between x and y
		- research is for expected difference
		- don't believe expected effect is 0
	- theta is null hypothesized slope
		- chemo is different than 0
		- don't want zero
			- want better than chemo
- mean squares of model:
	- average of yellow arrows
- f-statistic:
	- signal to noise
		- how much models capturing versus what it can't capture
	- yellow vs pink
	- if model good on average
		- more is yellow
		- less is pink
	- how well predicting mean square

#### R Code

##### Input

```r
#The code you need. It is only 4 lines, and 2 of them you saw last week:

#Here are some data, not in a csv or data frame, so keep that in mind for homework.
mass.g<-c(17.7,18.7,17.2,20.1,19.1,17.7,18.9,19.8,15.8,19.5)
nitrogen.ppm<-c(8.26,7.45,6.95,8.53,9.37,8.49,9.7,9.09,7.34,9.69)

#Correlation

cor.test(mass.g,nitrogen.ppm)
#Order does not matter!
cor.test(nitrogen.ppm,mass.g)#identical output

#Regression

#Build a model:

model<-lm(mass.g~nitrogen.ppm)

#Test the model

summary(model) #Good, lots of info

anova(model) #Also fine, less info

r2<-7.4667/(7.4667 + 8.5783)
r2
```

##### Output

```r
> cor.test(mass.g,nitrogen.ppm)

	Pearson''s product-moment correlation

data:  mass.g and nitrogen.ppm
t = 2.6388, df = 8, p-value = 0.02977
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.09210528 0.91765346
sample estimates:
      cor 
0.6821712 

> #Order does not matter!
> cor.test(nitrogen.ppm,mass.g)#identical output

	Pearson''s product-moment correlation

data:  nitrogen.ppm and mass.g
t = 2.6388, df = 8, p-value = 0.02977
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.09210528 0.91765346
sample estimates:
      cor 
0.6821712 

> 
> #Regression
> 
> #Build a model:
> 
> model<-lm(mass.g~nitrogen.ppm)
> 
> #Test the model
> 
> summary(model) #Good, lots of info

Call:
lm(formula = mass.g ~ nitrogen.ppm)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.5976 -0.6327 -0.1070  0.6376  1.6105 

Coefficients:
             Estimate Std. Error t value Pr(>|t|)   
(Intercept)   10.6627     2.9692   3.591  0.00707 **
nitrogen.ppm   0.9176     0.3477   2.639  0.02977 * 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.036 on 8 degrees of freedom
Multiple R-squared:  0.4654,	Adjusted R-squared:  0.3985 
F-statistic: 6.963 on 1 and 8 DF,  p-value: 0.02977

> 
> anova(model) #Also fine, less info
Analysis of Variance Table

Response: mass.g
             Df Sum Sq Mean Sq F value  Pr(>F)  
nitrogen.ppm  1 7.4667  7.4667  6.9633 0.02977 *
Residuals     8 8.5783  1.0723                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> r2<-7.4667/(7.4667 + 8.5783)
> r2
[1] 0.4653599
```

#### R Explained

- best way to predict values of y
- y hat = $\hat{y}$
- $$\text{MODEL: }\hat{y_i} = 10.66 + 0.92(X_{nitrogen})$$
- If I know the amount of nitrogen in the soil,
	- I now have a way to predict how big the fruit is going to be.
- slope:
	- Knowing how much control we have over fruit mass 
		- by sprinkling little bits of nitrogen onto the soil 
	- is a pretty helpful piece of information for us.
- question:
	- is slope different from zero?
- approaches:
	- anova
		- if slope is equal to zero
		- then best prediction of fruit mass
		- is just the mean of fruit mass
			- sum of squares
				- and
			- mean squares
				- made up f values
	- f perspective:
		- address null:
		- predicted values of Y are equal to the mean of Y
		- $H_o : \hat{y} = \bar{y}$
			- f = 6.963
			- p-value = 0.02977
			- f score, small p value
				- allow me to reject the null
				- rejecting idea that best guess is
					- fruit mass is just average fruit mass
				- therefore best guess should be the model
		- can't predict next year's fruit mass by average fruit
		- measure nitrogen under tree
			- better estimate
- other way:
	- is the slope equal to zero?
	- $H_o : b_1 = 0$
		- equations are identical
		- can't use anova
			- uses f scores
			- use **summary**
		- sums of squares of model
		- divided by total sums of squares
- many variables explain variation of fruit growth
	- plants respond to more inputs than just nitrogen
	- nitrogen explains 46.5% of variation
		- r squared value is useful
- $$t = \frac{0.92 - \theta}{0.3476}$$
- test null hypothesis:
	- t score is equal to slope
	- null slope was expectation
	- divided by standard error of slope
		- get T score 
		- probability of getting a T score of 2.6 
			- or further away from zero
		- if the null is true
			- p-value = 0.02977
- two null hypotheses are the same
	- by saying slope is equal to zero
		- best prediction about y is the mean of y
	- straight line
- care about biology of the system
- **important values**:
	- predicted value
		- slope
	- p-value:
		- big number:
			- real slope might be zero
	- r squared value:
		- 46%
			- useful biologically
				- could be significant
					- but only explain 2% of variation
	- standard error of slope:
		- like standard error of mean
			- central limit theorem
		- estimated slope
			- is a random variable
			- drawn from a distribution
			- of all possible slopes
		- standard error is just CLT
			- central limit theorem
		- take standard error
			- calculate confidence intervals
		- multiply standard error by two
			- have 95% confidence intervals around slope
		- or on average
			- true slope is plus or minus
				- 0.34 from the slope
			- that we got of 0.92
- 4 numbers for good storytelling
	- p value first
		- reject null
	- if model is good
		- slope is important
	- +/- standard error
		- range of where truth might be
	- r^2 value 
		- make decisions
- biological story for research question
- f-score meaning:
	- signal to noise ratio

---

Previous: [BILD 5 Lecture 21](BILD_5_LE_21.md).
Next: [BILD 5 Lecture 23](BILD_5_LE_23.md).