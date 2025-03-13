---
course: BILD 5
type: lecture
lecture_num: 20
date: 2/24
---

# BILD 5 Lecture 20
- ## 2/24

## Correlation

### Tests

#### Tests with a categorical X axis
- Boxplots
	- control-treatment
- One sample t-test
- Paired t-tests
- Two sample t-test (Welch)
- Multiple comparisons using t-test (Bonferroni, Holm)
- ANOVA
	- Tukey Honest Standard Deviation
- *Each of these tests determine if groups are different from one another*

#### Tests with a continuous X axis
- Scatterplots
	- each dot is experimental unit
		- x and y change together
- What if our data are not organized in groups 
	- Instead each experimental unit has 2 or more separate, continuous observations
- measure multiple traits
	- dot = experimental unit
	- things change together
#### Figures
- centimeters continuous
- all in the same treatment group
- relationship between length and weight
- how rise/fall together
- visualize data first
- 
##### Table

| Index | Length (cm) | Weight (g) |
| ----- | ----------- | ---------- |
| 1     | 64          | 130        |
| 2     | 69          | 148        |
| 3     | 71          | 180        |
| 4     | 67          | 175        |
| 5     | 63          | 120        |
| 6     | 62          | 127        |
| 7     | 66          | 141        |
| 8     | 60          | 118        |
| 9     | 65          | 120        |
| 10    | 68          | 159        |
##### Graph 1

![[continuousXAxis.png]]

### Covariance
#### Notes 1
- observation:
	- longer individuals weigh more
		- visualize with scatter not just histograms
- Measure how the data rise or fall together
- **No “dependent” and “independent” variables.**
	- each x/y co-depend on each other
		- turn patterns into numbers
	- pattern: more
#### Graphs 2
![[covarianceGraphs.png]]
#### Notes 2
- How can we measure this rise and fall?
- Compare to the point defined at ($\bar{x}$, $\bar{y}$)
	- mean of x and mean of y
		- compared to this point
			- bigger/smaller than this point
- If there was no covariation between x and y, where would you expect the points to be?
	- **average distance away from x and y would need to cancel out**
- notes:
	- compare data to mean point
	- are dots bigger/smaller in certain directions
	- where data fall compared to means
#### Graph 2

![[covarianceGraph1.png]]

#### Notes 3

- Distance from $\bar{y}$:
	- $y_i - \bar{y}$
- Distance from $\bar{x}$:
	- $x_i - \bar{x}$
- Notes:
	- multiply two distances together
	- distance away from mean of x and y negative
	- visualize data first 
		- then pick test
	- add them up and get total area
	- how far away from mean
	- want average
	- cancel out
- more notes:
	- 0 covariation
	- variation cancel out
		- average distance away from x / y
		- vertical/horzontal arrows
	- covariation: 
		- multiply two distances together
		- square distance
		- positive in Q1,3
		- negative in Q2,4
		- smaller than x,y
		- if at mean: 
			- no covariation

#### Graph 3

![[covarianceGraph2.png]]

#### Notes 4

- Individual distance from $\bar{x}\bar{y}$:
	- $(y_i - \bar{y})(x_i - \bar{x})$
- Average distance from $\bar{x}\bar{y}$:
	- $$\frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{df}$$
- notes:
	- quadrants for positive and negative covariation
	- add all of them up:
		- total area of squares
			- how far away from mean of x and mean of y are each dot
		- want an average, not total
	- degrees of freedom =
		- **n-1**
			- the more we know about the system
				- the less degrees of freedom we have
			- one dot will drive the whole mean of x,y

#### Graph 4

![[covariation.jpg]]

#### Notes 5

- **Degrees of Freedom**:
	- wrong:
		- n<sub>x</sub> = 10-1=xbar
		- n<sub>y</sub> = 10-1=ybar
			- not a sample size of 20
		- n-2
			- the more we know about the system the less degrees of freedom we have
	- **correct**:
		- `n-1`
	- even though two means
		- only need one dot
	- **n-1 = df**
	- How many dots do I need to know the position of to know exactly where the mean of X mean of Y is?
		- one extra one
	- variance in two dimensions
	- covariance can be negative
- **The big math difference is;**
	- **Covariance can be *negative***

#### Comparison
- Look familiar?
##### Covariance (x,y)
$$\frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{df}$$
- anywhere from positive to negative infinity
##### Variance of y
$$\frac{\sum (y_i-\bar{y})(y_i-\bar{y})}{df}$$
- always positive because squared
##### Difference
- The big math difference is; 
	- *Covariance* can be ***negative***
- notes:
	- measurement of variance
		- in two dimensions
##### Graph 5
![[covarianceGraph2.png]]

### R Code

```r
length.cm<-c(64,69,71,67,63,62,66,60,65,68)

weight.g<-c(130,148,180,175,120,127,141,118,120,159)

cbind(length.cm,weight.g)

cov(length.cm,weight.g)
cov(weight.g,length.cm)
```

```r
cbind(length.cm,weight.g)
      length.cm weight.g
 [1,]        64      130
 [2,]        69      148
 [3,]        71      180
 [4,]        67      175
 [5,]        63      120
 [6,]        62      127
 [7,]        66      141
 [8,]        60      118
 [9,]        65      120
[10,]        68      159
> 
> cov(length.cm,weight.g)
[1] 65.55556
> cov(weight.g,length.cm)
[1] 65.55556
> # they're the same
> #just multiplying together
```

$$\frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{df}$$

```r
#But there is a sneaky issue in Covariance, It is unit dependent!

length.in<-length.cm/2.54
weight.lbs<-weight.g*0.00220462
cov(length.in,weight.lbs)
```

```r
> cov(length.in,weight.lbs)
[1] 0.05689964
```
- same data transformed into different units
- z-transformation to get rid of units

$$Z_x = \frac{x_n - \bar{x}}{SO_x}$$
- distance away from mean
	- divided by that unit
- so units cancel out
- covariation on z-transformed data
	- = correlation

#### R Code 2

- correlation
	- in units of standard deviation
	- scaled covariation
		- distance each of my points are 
			- away from mean of X, mean of Y 
				- in the units of standard deviations.
- how far away from mean of x, mean of y
- perfect correlation would make squares
	- would be 1
- most correlated: 
	- 1: squares
		- perfect 45 degree line through 
	- correlation is ratio of length of squares
	- As they get more square and less rectangular,
		- they're more correlated with one another.
- ratio of length of squares
- more square, less rectangular:
	- more correlated

```r
##We can fix this issue with a z transformation

zlength.cm<-(length.cm-mean(length.cm))/ sd(length.cm)
sum(zlength.cm)
zlength.in<- (length.in-mean(length.in))/ sd(length.in)
scale(length.cm)
cbind(zlength.cm,zlength.in,scale(length.cm))

mean(zlength.cm)
sd(zlength.cm)

cov(scale(length.in),scale(weight.g))
cor(length.in,weight.g)
r<-cor(length.in,weight.g)
```

```r
> zlength.cm<-(length.cm-mean(length.cm))/ sd(length.cm)
> sum(zlength.cm)
[1] 0
> zlength.in<- (length.in-mean(length.in))/ sd(length.in)
> scale(length.cm)
            [,1]
 [1,] -0.4444783
 [2,]  1.0371161
 [3,]  1.6297538
 [4,]  0.4444783
 [5,] -0.7407972
 [6,] -1.0371161
 [7,]  0.1481594
 [8,] -1.6297538
 [9,] -0.1481594
[10,]  0.7407972
attr(,"scaled:center")
[1] 65.5
attr(,"scaled:scale")
[1] 3.374743
> cbind(zlength.cm,zlength.in,scale(length.cm))
      zlength.cm zlength.in           
 [1,] -0.4444783 -0.4444783 -0.4444783
 [2,]  1.0371161  1.0371161  1.0371161
 [3,]  1.6297538  1.6297538  1.6297538
 [4,]  0.4444783  0.4444783  0.4444783
 [5,] -0.7407972 -0.7407972 -0.7407972
 [6,] -1.0371161 -1.0371161 -1.0371161
 [7,]  0.1481594  0.1481594  0.1481594
 [8,] -1.6297538 -1.6297538 -1.6297538
 [9,] -0.1481594 -0.1481594 -0.1481594
[10,]  0.7407972  0.7407972  0.7407972
> 
> mean(zlength.cm)
[1] 0
> sd(zlength.cm)
[1] 1
> 
> cov(scale(length.in),scale(weight.g))
          [,1]
[1,] 0.8436418
> cor(length.in,weight.g)
[1] 0.8436418
### CORRELATION
```

### Correlation
#### Correlation is standardized Covariation

- Correlation is the preferred measure of the rise and fall of (*x*, *y*) 
	- because it gets around the units issue
		- -1 ≤ ρ ≤ 1
			- bound between negative 1 and positive 1
- Just like we estimated the parameter **μ** with the statistic $\bar{x}$
	- We can estimate the parameter **ρ** with the statistic **r**
		- find correlation coefficient
		- **rho** = true correlation
			- estimate of rho is little r
- Which allows us to ask the question: 
	- “Is there a true correlation between *x* and *y*?”
- $H_0: \rho_{x,y} = \theta$
* $H_A: \rho_{x,y} \neq \theta$
* notes:
	* like a single sample t test
	* mu or r is 0 in null?
	* could be a no correlation coefficient
* **Null**:
	* **rho = theta**
	* $$H_o:\rho = \theta$$
		* difference from expected value

#### Hypothesis testing for correlation

* $$H_0: \rho_{x,y} = 0$$
* $$H_A: \rho_{x,y} \neq 0$$

* How can we determine the probability that 
	* our sample correlation $(r)$ is drawn from the true null correlation $(\rho = 0)$?

* $$t_{score} = \frac{r - \rho}{se_r}$$
* It's a t test! 
	* Lets see it in R
* notes:
	* probability of getting this t score if null is true
		* 0.002
		* reject null
		* accept alternate
	* expected different from theta
	* $$H_A : \rho \neq \theta$$
	* **`cor.test()`**
	* degrees of freedom = `n-2`
		* now I have the mean of X mean of Y
		* and have the correlation coefficient
	* need two dots because not
		- lost one dot to define mean of X mean of Y,
		- need another dot to make sure 
			- the correlation line goes exactly expected.
		- Now that I know the correlation,
			- knowing the correlation has cost 
				- an additional degree of freedom.
	- t-score:
		- probability of getting t score given null was true
			- 0.02
			- reject null
			- support alternate
			- $\rho \neq \theta$
		- correlation coefficient = 0.8
	- testing if our parameter estimate
		- is equal to a null hypothesized value,
			- like t test
#### R Code 3

```r
r<-cor(length.in,weight.g)
Ser <- sqrt(1-(r^2))/sqrt(10-2)
tscore <- (cor(length.in,weight.g)-0)/Ser

cor.test(length.in,weight.g)
```

```r
> r<-cor(length.in,weight.g)
> 
> Ser <- sqrt(1-(r^2))/sqrt(10-2)
> tscore <- (cor(length.in,weight.g)-0)/Ser
> 
> cor.test(length.in,weight.g)

	Pearson''s product-moment correlation

data:  length.in and weight.g
t = 4.4443, df = 8, p-value = 0.002156
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.4564972 0.9621788
sample estimates:
      cor 
0.8436418 
```

#### Why is correlation not causation?

- The position of X and Y don't matter!
  Neither is driving the other one.
- This leads to some strange, significant relationships, that might not be meaningful:
	- https://www.tylervigen.com/spurious-correlations
		- no clear dependent or independent variable
			- believe they're codependent
		- measured through time
		- trends change based on latent variables
		- spurious correlations found with time series data 
	- correlation coefficient was the same when 
		- X was on the X axis and Y was on the y axis and
		- when Y was on the X axis and X was on the Y axis.
	- no positionality to correlation
	- observations about the universe rise and fall together

#### Final R Code

```r
cor.test(length.in,weight.g,method = "spearman")

cor.test(rank(length.in),rank(weight.g))
plot(rank(length.in),rank(weight.g))
```
```r
> cor.test(length.in,weight.g,method = "spearman")

	Spearman''s rank correlation rho

data:  length.in and weight.g
S = 19.559, p-value = 0.0007469
alternative hypothesis: true rho is not equal to 0
sample estimates:
     rho 
0.881463 

Warning message:
In cor.test.default(length.in, weight.g, method = "spearman") :
  Cannot compute exact p-value with ties
> 
> cor.test(rank(length.in),rank(weight.g))

	Pearson''s product-moment correlation

data:  rank(length.in) and rank(weight.g)
t = 5.2793, df = 8, p-value = 0.0007469
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.5659155 0.9717664
sample estimates:
     cor 
0.881463
```

##### Final Correlation Graph

![[correlationPlot.png]]

---

Previous: [BILD 5 Lecture 19](BILD_5_LE_19.md).
Next: [BILD 5 Lecture 21](BILD_5_LE_21.md).