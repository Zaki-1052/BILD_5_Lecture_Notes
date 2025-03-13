---
course: BILD 5
type: lecture
lecture_num: 15
date: 2/10
---

# BILD 5 Lecture 15
- ## 2/10
## Comparison of Means 2

### Z Transformation

- $$ZX = \frac{X_i - \bar{X}}{S_X}$$
- Centers and scales the data
	- Mean is now zero
	- Standard Deviation is now one
- $$t = \frac{\bar{x} - \theta}{SE_x}$$
### T Tests

- **Single sample t test**
	- H<sub>o</sub>: The sample mean is equal to θ
		- **paired t-test is on the delta values**
	- H<sub>o</sub> μ = θ
		- μ - θ = 0
	- $$t = \frac{\bar{x} - \theta}{SE_X}$$
	- if single species was similar to expected or different
		- single column of data
- Paired t test
	- Modified single sample t test
	- H<sub>o</sub>: The mean of the differences between groups is equal to zero (0)
	- $$t = \frac{\bar{x} - \theta}{SE_A}$$
	- numerator of t score should be 0 if null is true
		- setting null = 0
			- centering null hypothesis
	- H<sub>0</sub> x̄ = 0
	- $\bar{\Delta} - \theta = 0$
		- calculate a delta from two columns
			- not independent
			- means different
			- sample twice
		- variance
			- subtract across row
		- delta column:
			- is mean of delta column different from zero
				- or from any other theta
		- null hypothesis:
			- mean of delta group = theta
	- **H<sub>o</sub>: $\bar{\Delta} = \theta$**
		- numerator of t-score = null hypothesis
	- $$t = \frac{\bar{\Delta} - \theta}{SE_A}$$
	- none of the summary statistics goes into paired t-test
	- a paired t-test is just a single-sample t-test on the delta values
	- numerators of t scores should be zero when the null is true
		- numerator of t score is setting the null hypothesis = 0
		- centering the null hypothesis equal to zero
	- null hypothesis = theta
		- by subtracting expected value from theta
		- assumption: null true = 0
		- t-value if null is true = 0
	- how far are observations from expected values
		- how different from null expectation
	- probability - further away from zero on either side of the t distribution
		- **two-tailed**
			- p-value
	- if null is true:
		- how likely we got a t-score equal to or further away from 0 than ours
	- t-distribution:
		- if null is true
			- t = 0
		- sometimes negative/positive
		- **noise** in sampling the universe
			- push experiment in either direction
		- random chance even in both directions
			- 1.4 and -1.4
	- t-test:
		- how likely was t-score to happen if the null was true
			- likelihood contains area on both sides of the distribution
	- **two-tailed t-test**
		- one-tailed very rare:
			- integrate on one side of the curve
				- null and alternate one side
					- H<sub>o</sub> = μ = 0
					- H<sub>A</sub> = μ > 0
			- some chance to be under null
				- statements don't contain all possibilities of the universe
#### Paired Data Table

| ID  | T   | C   | Δ   |
| --- | --- | --- | --- |
| A   | 6   | 2   | 3   |
| B   | 0   | -2  | 2   |
| C   | 7   | 7   | 0   |
| D   | 10  | 10  | -1  |

#### Histogram

![[nullTScores.png]]
### Question

- **If the null is true, how likely is it that we got a t score equal to or further from zero than ours?**
	- $$t = \frac{\bar{x} - \theta}{SE_x}$$
-  Values
	- 𝑥 = 5.578947 
	- θ = 6.2
	- t = -1.4513, 
	- df = 18, 
	- p-value = 0.1639
		- Probability of our data given the null is true is 16%
		- P(Our Data | H<sub>o</sub> TRUE) = 16%
	- H<sub>o</sub>: The sample mean is equal to θ
	- H<sub>A</sub>: The sample mean is not equal to θ
- There is a 16.39% chance that we would get the t score we calculated or one further from 0 given the null is true.
- Traditionally, we want to be really sure before we reject a null hypothesis.
	- A 5% chance has become the standard for null hypothesis testing…
#### Rejection

- **How often are we willing to incorrectly reject the null hypothesis?**
	- t = -1.4513, 
	- df = 18, 
	- p-value = 0.1639
		- How do we feel rejecting the null hypothesis in this case?
		- One in six?
	- Determine an α (alpha) value
		- By archaic convention, α=0.05
		- We will reject a null hypothesis that is actually true one in 20 times
- ***Type I Error Rate***: 
	- **False Positive Rate**

### T-Test

- **Back to the t test…**
- What do we do when we want to compare two groups of unpaired data?
- $$t = \frac{\bar{x} - \theta}{SE_x}$$
- <div style="text-align: center;">
-->
</div>

- $$t = \frac{\bar{x}_1 - \bar{x}_2}{SE_{x_1,x_2}}$$
- Instead of 𝜃 we now are comparing two groups.
	- H<sub>o</sub>: The sample mean of x<sub>1</sub> is equal to the sample mean of x<sub>2</sub>
	- H<sub>A</sub>: The sample mean of x<sub>1</sub> is not equal to the sample mean of x<sub>2</sub>
- Calculate the pooled standard error of both groups
#### Two-Sample T-Test

| ID  | RESP | GROUP |
| --- | ---- | ----- |
| A   | 75   | C     |
| B   | 80   | T     |
| C   | -10  | C     |
| D   |      |       |
| E   |      |       |
- $$H_o: \bar{x_1} - \bar{x_2} = \theta$$
- $$t = \frac{\bar{x}_1 - \bar{x}_2}{PSE_{x_1,x_2}}$$
	- theta is almost always 0
		- if know true difference should be 0.2
			- then set .2 to theta
### R Code

#### Single-sample
##### Code 1
```r
#Single Sample t test

BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)

meanBD<-mean(BarleyData)

sdBD<-sd(BarleyData)

SEBD<-sdBD/sqrt(length(BarleyData))

ExpectedMU<-6.2

t_scoreBD<- (meanBD-ExpectedMU)/SEBD

t.test(BarleyData,mu = 6.2)
```
##### Output
```r
> t.test(BarleyData,mu = 6.2)
	One Sample t-test

data:  BarleyData
t = -1.4513, df = 18, p-value = 0.1639
alternative hypothesis: true mean is not equal to 6.2
95 percent confidence interval:
 4.679877 6.478017
sample estimates:
mean of x 
 5.578947
```

#### Paired Code

```r
#Paired t test

Control <- c(3.5, 3.9, 3.2, 3.1, 1.5, 3.2, 3.5, 3.8, 4.6, 1.1, 2.9, 1.9)
Treatment <- c(5.4, 5.5, 2.7, 4.4, 1.7, 4.2, 5.6, 5.1, 5.3, 4.5, 5.6, 1.6)

cbind(Control,Treatment)
delta<-Control-Treatment
cbind(Control,Treatment,delta)

DeltaMean<-mean(delta)

t.test(delta,mu = 0)
#or
t.test(Control,Treatment,paired = TRUE)
#It is the same thing!
```
#### Output
##### Columns
###### Tidy Table
```r
> cbind(Control,Treatment)
      Control Treatment
 [1,]     3.5       5.4
 [2,]     3.9       5.5
 [3,]     3.2       2.7
 [4,]     3.1       4.4
 [5,]     1.5       1.7
 [6,]     3.2       4.2
 [7,]     3.5       5.6
 [8,]     3.8       5.1
 [9,]     4.6       5.3
[10,]     1.1       4.5
[11,]     2.9       5.6
[12,]     1.9       1.6
```
###### Delta Table
```r
> delta<-Control-Treatment
> cbind(Control,Treatment,delta)
      Control Treatment delta
 [1,]     3.5       5.4  -1.9
 [2,]     3.9       5.5  -1.6
 [3,]     3.2       2.7   0.5
 [4,]     3.1       4.4  -1.3
 [5,]     1.5       1.7  -0.2
 [6,]     3.2       4.2  -1.0
 [7,]     3.5       5.6  -2.1
 [8,]     3.8       5.1  -1.3
 [9,]     4.6       5.3  -0.7
[10,]     1.1       4.5  -3.4
[11,]     2.9       5.6  -2.7
[12,]     1.9       1.6   0.3
```
##### T-Tests
###### One-Sample (Delta)
```r
> t.test(delta,mu = 0)
	One Sample t-test

data:  delta
t = -3.8176, df = 11, p-value = 0.002855
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
 -2.0232214 -0.5434452
sample estimates:
mean of x 
-1.283333
```
###### Paired T-Test
```r
> t.test(Control,Treatment,paired = TRUE)

	Paired t-test

data:  Control and Treatment
t = -3.8176, df = 11, p-value = 0.002855
alternative hypothesis: true mean difference is not equal to 0
95 percent confidence interval:
 -2.0232214 -0.5434452
sample estimates:
mean difference 
      -1.283333
```

#### Two-Sample
##### Code 2
```r
#Two sample t test

Group1<-c(16, 19, 13, 15, 15, 17, 11, 17, 13, 15, 15, 15, 11, 15,  8, 16, 20, 10, 16, 10)
Group2<-c(19, 18, 18, 15, 17, 16, 18, 19, 20, 15, 14, 19, 13, 20, 21, 19, 12, 16, 16, 15)

t.test(Group1,Group2)
```
##### Output
###### Normal
```r
> t.test(Group1,Group2)

	Welch Two Sample t-test

data:  Group1 and Group2
t = -2.9797, df = 36.324, p-value = 0.005119
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -4.4531007 -0.8468993
sample estimates:
mean of x mean of y 
    14.35     17.00 
```
###### Degrees Freedom
```r
> t.test(Group1,Group2,var.equal=TRUE)

	Two Sample t-test

data:  Group1 and Group2
t = -2.9797, df = 38, p-value = 0.005007
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -4.4503695 -0.8496305
sample estimates:
mean of x mean of y 
    14.35     17.00 
```
#### Curves
- flatter
- don't have equal variation
	- penalized
	- strength of evidence as sample size decreases
```r
curve(dt(x,1),xlim=c(-5,5))
curve(dt(x,1),xlim=c(-5,5),col="goldenrod",lwd=5,add=TRUE)
```
##### Graph

![[tScoreCurves.png]]

### Review Notes
#### Part 1
- ##### **One-Sample**
- find mean, StDev, SE
- theta value = expected mu value
- t-score: (mean - theta) / standard error
	- =-1.45
	- under expectation
	- if random chance:
		- also universe where positive score happened
- p-value: integral of both tails
- [[#Single-sample]]
- single-sample:
	- one column of data
	- give Mu (6.2)
	- t-value
		- subtraction and division
	- degrees freedom: 18
		- 19 original grain samples
		- lost one sample bc calculated mean
		- lost a degree of freedom
- probability of getting t-score or a t-score further away from 0
	- left/right 1.4
	- if truth was middle - 0
	- 16%
		- p-value
- probability of our data given the null hypothesis is true 
	- == 16%
		- often/too high/frequent occurrence
		- 16.4% chance to get this t-score or a t-score even further from 0 is the null was true
	- want to be sure before reject null hypothesis (to say statement false)
		- within 5% for biologists
	- 16% is too much
		- 1 in 6 times
		- too much luck
	- arbitrary threshold at 0.05
		- reject null hypotheses that are actually true 
			- 1 in 20 times instead of 1 in 6
- Type I Error Rate
#### Part 2
- ##### **Paired** T-Test
- **control** and **treatment** measurement for same individuals
	- 12 individuals
	- tidy:
		- control and treatment response
			- each a column
- example:
	- genetic clones
		- treatment and control trees
			- cuttings of branches off parent
- create a delta column
	- subtracting across rows
	- single column of data
	- single sample
		- single sample t-test
	- [[#Delta Table]]
- Mu = 1 (often)
- mean of Delta
	- control group on average 1.28 smaller than treatment group
		- average delta = -1.28
- run a single-sample t-test
	- are the deltas different from 0
	- Mu = 0
	- same single-sample t-test
- degrees freedom = 11
	- 12 delta numbers
	- calculated mean of delta column
- t-score and p-value
	- (see code)
	- [[#One-Sample (Delta)]]
- threshold: 
	- smaller than 5%
	- reject null and accept alternate
	- bigger than 5% accept null
	- p-value for deductive purpose:
		- reject null
		- smaller
		- alt hyp: 
			- true mean of delta column not equal to 0
- paired t-test on original columns
	- see paired t-test code
		- [[#Paired T-Test]]
- numbers are the same because tests are identical

### Two-Sample T-Tests
#### Notes
- compare two groups
	- paired designs
	- prove it's true that pair exists
	- can't arbitrarily match two columns
- in tidy table:
	- don't get different columns for treatment and control
	- [[#Two-Sample T-Test]]
- if paired: 
	- tidy table:
		- can subtract across it
- difference between a paired T test and a two sample T test
	- if it's paired:
		- the tidy table lets us subtract across it.
- if data tidy:
	- each row is own individual
- null hypothesis:
	- in two-sample:
		- often is two groups are the same
		- no difference between treatment and control group
	- differences = subtractions
- mean of group 1 - mean of group 2 = theta
- comparing whether two groups are the same or different from one another
- t-score:
	- (mean of group 1 - mean of group 2) / pooled standard error
		- pooled standard error:
			- taking standard error of whole column
				- ignoring that half are treatment/control group
		- pooled =
			- standard error of all observations taken together as a single group
- **theme**:
	- look at data / scenario / example
		- identify null hypothesis
		- identify t score calculation
		- type in correct code
			- for each test
	- example: 
		- patients in blood sample trial
			- two sample t-test
				- bc sample size of 40
				- patient cant be both treatment and control
- tip:
	- make a table
		- tests = rows
		- name of test
		- data format for appropriate test
		- tidy table of data
			- how many columns
		- null hypothesis associated with test
		- t-score for test 
	- similarities and differences
		- getting t-score and comparing it to t distribution
			- univariate statistics
	- how calculate t score
- **Two-Sample**:
- group 1 & group 2
	- example:
		- plate 1 similar colony number as plate 2
- balanced design
	- each 20 individuals
		- can't have 3 control 100 treatment
		- not really sample size of 103
		- need balanced designs
- See [[#Two-Sample]]
##### Explanation
- run two-sample t-test
	- [[#Code 2]]
- t-score:
	- mean of group 1 minus mean of group 2
		- / standard error
			- -2.97
- degrees of freedom:
	- **definition**:
	- *take sample size and subtract number of means calculated*
	- ***but*** *continuous* piece of data, not count
	- df = 36.2
		- should be 40-2
			- because 20 in group 1 - mean
			- 20 in group 2 and calc mean
	- trick R into giving me correct degrees of freedom
		- add an argument
	- variance = TRUE
	- See [[#Degrees Freedom]]
	- t-score didn't change
- DF important:
	- shape of t distribution depends on degrees of freedom of experiment
		- more degrees of freedom in experiment
			- closer to normal distribution the t distribution is
		- at very small degrees of freedom
			- t distribution is flatter
				- [[#Curves]]
	- affects p-value
	- have same t-score
		- if integrate away from t score
			- (pos/neg infinity)
	- yellow distribution = smaller p value
	- pink distribution = larger p value
	- t-test penalizing us
		- because don't have equal variation between groups
	- variance between groups isn't identical
	- denominator of t-score: 
		- pooled standard error
	- assumption:
		- each group is contributing equally to that standard error
- two-sample t-test:
- null & alternate hypotheses picture version
	- null hyp: 
		- all our data are random variables 
		- drawn from a single distribution 
		- with a parameter Mu 
			- mean of group 1 and group 2 together
	- alternate hyp:
		- two distributions
		- each with different means
			- one is mean of group 1
			- other is mean of group 2
- if null is all samples 
	- regardless of group
		- treatment/control
- random variables drawn from one distribution
	- with a pooled standard error
- alternate:
	- drawn from separate distributions
		- but only have pooled standard error
	- assumption:
		- the standard error is an equal contribution 
			- from both groups 
		- if the alternate is true.
- can calculate a standard error of each of these groups
	- and recognize that they're not identical
- called:
	- **Welch Correction**
- decreasing the degrees of freedom slightly
	- because standard errors are not identical
- See:
	- [[#Graph]]
	- 1 and 100 degrees freedom
- sampling distributions that we're getting our p-values from
- t-distribution with only 1 degree of freedom
	- only measured two things
		- two grains of barley
		- need really big t-score 
			- to have only 5% uncertainty
	- with 100 samples:
		- 5% is a lot closer to 0
	- The necessity of the strength of the evidence 
		- **decreases** 
	- as our sample size increases.
- sample size:
	- More sampling:
		- If we sample more and more and more from a population,
			- the evidence required to distinguish those two groups 
				- **decreases**
	- if perfect census:
		- those groups could be different by a millimeter
			- would be absolutely certain  they were different 
				- because I'd measured everyone perfectly.
	- Sample size improves our power because:
		- it changes the shape of the T distribution that we're sampling from
	- BUT trust the first t-test (black)
		- t-test that penalizes our degrees of freedom and decreases it
			- is the more conservative test
		- more safe of the two options to run
		- weird DF
			- calculated using:
				- **Welch Satterwith correction**
	- get weird degree of freedom
		- will get even worse if
			- variance between two groups were even greater
			- if very different variances
- story:
	- difference between two groups 
		- and p-value
			- half a percent
			- much smaller than 5%
		- so rejecting the null
	- null was:
		- mean of group 1
		- and mean of group 2
		- were equal to each other
			- or
		- difference between them
		- was equal to zero
			- reject that
	- true difference in means is not equal to zero
		- becomes alternate hypothesis
	- could be any number other than 0
		- best estimate:
			- 14.35 minus (-) 17
				- mean of each
					- biologically interesting story
	- small p-value based on degrees of freedom of t-distribution
		- use this number to reject the null
			- and nothing else
- biological story of interest:
	- these groups are different by about **2.5**-3
		- if millimeters in elephants no
		- if toxins in water, *yes*
	- in units of interest trying to measure
		- and what we're interested in questioning
	- biological story
- **A18247936**

---

Previous: [BILD 5 Lecture 14](BILD_5_LE_14.md).
Next: [BILD 5 Lecture 16](BILD_5_LE_17.md).