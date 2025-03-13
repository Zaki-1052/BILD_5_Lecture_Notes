---
course: BILD 5
type: lecture
lecture_num: 21
date: 2/26
---

# BILD 5 Lecture 21
- ## 2/26

## Regression P1:
- continuous x
- continuous y
### Anatomy of the ANOVA
#### How can we predict future fruit yields?
- Data from 10 individual plants
- Yield of fruit in grams
- What will our next yield be?
$$Y_i - \bar{Y}$$
- $Y_i$ = observation
- $\bar{Y}$ = mean
- **Sum of Squared Deviations**
$$\sum(Y_i - \bar{Y})^2$$
1) (17.7 – 18.45)²
2) (18.7 – 18.45)²
3) (17.2 – 18.45)²
4) (20.1 – 18.45)²
5) (19.1 – 18.45)²
6) (17.7 – 18.45)²
7) (18.9 – 18.45)²
8) (19.8 – 18.45)²
9) (15.8 – 18.45)²
10) (19.5 – 18.45)² +
- Sum of Squared Deviations = 16.045
- $H_o : \hat{y} = \bar{y}$
- $H_A : \hat{y} \neq \bar{y}$
- **Sum of squares**
$$\text{Variance} = \frac{\sum(Y_i-\bar{Y})^2}{n-1}$$
- Degrees of freedom
- explain why dots are far from red mean line
	- mean is best guess when null is true
	- variance = statement of null hypothesis
		- when null is true
			- predicted values of y are equal to mean of y
		- if can't predict, then mean / null
![[fruitYields.png]]
- question:
	- explain why dots are far from red mean line
#### What if we know more about our system?
- Mass in grams of our fruit yield
- Concentration in parts per million of nitrogen in the soil
- Fruit mass likely ***depends*** upon the nitrogen available to the plant.
- The starting nitrogen concentration is likely ***independent*** of the fruit on the plant.
##### Scatterplot
![[scatterplotFruit.png]]
### General Linear Models
- notes:
	- If the null is that the best prediction of Y is the mean of Y,
		- the alternate is that the best prediction of Y,
			- is not equal to Y bar.
	- $H_o : \hat{y} = \bar{y}$
	- $H_A : \hat{y} \neq \bar{y}$
	- $\hat{y} = m(x) + b$
		- linear model makes a line
- Model how a dependent variable (Y) changes over an independent variable(X)
- "regression"
	- we have some dependent variable,
		- something we're trying to predict
		- the way we're going to predict it is
	- to multiply the observation of X that we make
		- times the slope and then
			- add the Y intercept to it.
- **Y = mX + b**
	- Y = dependent variable
	- m = slope
	- X = independent variable
	- b = Y intercept

$$Y_i = \beta_1 X_i + \beta_0$$
- $\beta_1$ = slope
- $\beta_0$ = Y intercept
- These are parameters
	- beta coefficients
	- **$\mu \approx \bar{x}$**
		- mu is mean of group
	- **$\rho \approx r$**
		- correlation coefficient
	- **$\beta \approx \text{slope}$**
		- = *y-int*

$$Y_i = b_1 X_i + b_0 + \textit{error}$$
- $b_1$ = slope
- $b_0$ = Y intercept
- These are statistics

- Does not have to be a straight line!
- No parameter in the model is multiplied by another parameter
- $Y_i = b_1 X_i + b_0 + \text{error}$

### Small Group Discussion (3 min)

- How is the linear model different from a correlation model?
- Come up with a few examples of data that would be better modeled as a general linear model than as a correlation/covariation.
	- $$\hat{y} = m(x) + b$$
	- Does the rate of growth of a plant change with amount of fertilizer over time?
	- Does change in x affect the change in y?
		- if you flip axes and it's nonsense:
			- using linear model
		- if works both ways:
			- correlation

### Ordinary Least Squares
- So you want to use a linear model?
- How do we estimate $\beta_1$ and $\beta_0$?
- $$\beta_1 \sim b_1 = \frac{cov(X,Y)}{var(X)}$$
- $$b_1 = \frac{(X_i-\bar{X})(Y_i-\bar{Y})}{(X_i-\bar{X})(X_i-\bar{X})}$$
  - Numerator = Rise
  - Denominator = Run
![[rise-run.png]]
- $$Y_i = b_1 \cdot X_i + b_0$$
- $$b_0 = \bar{Y} - b_1 \cdot \bar{X}$$
- $$Y_i = 0.92X_i + 10.66$$
![[slopeGraph.png]]
- Expected Fruit Mass = 0.92 · (Observed Nitrogen) + 10.66
- Observed Nitrogen ↑ 1ppm : Expected Fruit Mass ↑ 0.9g
- Observed Nitrogen = 0.0 : Expected Fruit Mass = 10.66

### R Code

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
```

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


> anova(model) #Also fine, less info
Analysis of Variance Table

Response: mass.g
             Df Sum Sq Mean Sq F value  Pr(>F)  
nitrogen.ppm  1 7.4667  7.4667  6.9633 0.02977 *
Residuals     8 8.5783  1.0723                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
```


### How much variation in Y does our model explain?

- Predicted/Fitted values = $\hat{Y}_i$
- $$\hat{Y}_i = b_1 \cdot X_i + b_0$$
![[slopeLine.png]]
- Total sum of squares (SS Total) = $\sum(Y_i - \bar{Y})^2$


```r
> r2<-7.4667/(7.4667 + 8.5783)
> r2
[1] 0.4653599
```

- Model sum of squares (SS Regression) = $\sum(\hat{Y}_i - \bar{Y})^2$
- Residual sum of squares (SS Error) = $\sum(Y_i - \hat{Y}_i)^2$
- SS Total = SS Regression + SS Error

- **Coefficient of determination (R²):**
  - $$R^2 = \frac{\sum(\hat{Y}_i - \bar{Y})^2}{\sum(Y_i - \bar{Y})^2}$$
  - $$R^2 = 1 - \frac{\sum(Y_i - \hat{Y}_i)^2}{\sum(Y_i - \bar{Y})^2}$$

- $$\text{Mean Square} = \frac{\sum(\hat{Y}_i-\bar{Y})^2}{df}$$

- F statistic:
  - $$F = \frac{\frac{\sum(\hat{Y}_i - \bar{Y})^2}{df}}{\frac{\sum(Y_i - \hat{Y}_i)^2}{df}}$$
  - If the model is "good,"
	  - it should account for more variation on average 
		  - than the average variation the error accounts for
![[variation.png]]

$$t = \frac{b_i - \theta}{SE_bi} = 2.639$$

$$\hat{y} = o(x)+b$$

### Graphs

![[ssTotal.png]]

![[ssRegression.png]]

![[ssError.png]]

![[ssRegression2.png]]

![[ssRegression3.png]]

![[regression-error.png]]

![[sstotal2.png]]

![[ssTotal3.png]]

![[coefficientDetermination.png]]

![[meanSquareGraph.png]]

![[fStatisticGraph.png]]

---

Previous: [BILD 5 Lecture 20](BILD_5_LE_20.md).
Next: [BILD 5 Lecture 22](BILD_5_LE_22.md).