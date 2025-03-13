---
course: BILD 5
type: lecture
lecture_num: 14
date: 2/7
---

# BILD 5 Lecture 14
- ## 2/7
	- ## T-Test

## Comparison of Means
- type of t test
### History

- William Sealy Gosset needed a way to test the quality of barley in small sample sizes
	- Because he worked at Guinness Brewery, Dublin, Ireland
- Developed a distribution that would help determine if a sample mean was similar to a null expectation
	- Student’s t-test:
		- $$t = \frac{\bar{x} - \theta}{SE_x}$$
	- Big Idea:
		- mean of data could exist anywhere
			- mean is a random variable drawn from a random distribution
		- instead of being bound by units/values
			- subtract from expected value Mu
				- null hypothesized value
				- **theta**
			- expectation of barely
				- any single experiment was a distance away from the expectation
			- numerator centering data
				- how far away is mean (theta) from expected value
				- divide by standard error of x
					- central limit theorem
						- distribution of all possible means
					- sigma / shape parameter of distribution 
						- estimated from SE
			- method:
				- converted from raw units to distance experiment is away from null
					- in the units of the central limit theorem
					- how many standard errors away from the null is experiment
			- identify probability of occurring:
				- t-score
			- framework:
				- how far away are my data from:
					- null expectation in the units of all possible experiments 
	- Where: 
		- $\bar{x}$ = sample mean = x̄
		- $\theta$ = Null hypothesized value = θ
		- $SE_x$ = Standard Error of _x_ = *SE<sub>x</sub>*
### Gosset Explained

- Is this batch of Barley different from our normal shipment?
	- Our normal shipment has a mean length of 6.2mm.
- H<sub>0</sub>: Null Hypothesis
	- Mean Barley length = Factory average (6.2)
		- numerator is zero
		- distribution of all possible t-scores centered at zero
		- estimate equals 6.2
		- not testing p-value
		- Mean = 6.2
	- P-Value:
		- not what we test
			- to accept/reject null
			- not the number we are testing
			- piece of info used to test the null
			- validate or invalidate one statement
		- P(x̄ ≤ 5.6 | H<sub>o</sub>T)
			- how likely is it to get this value if the true average is 6.2?
		- calculate t-score:
		- $$\frac{5.6-6.2}{42} = -1.5$$
		- plus or minus 1.5
			- can happen in either direction
		- absolute value further away
		- alternate hypothesis has to account for being wrong in both directions
- H<sub>A</sub>: 
	- Mean Barley length ≠ Factory average (6.2)
```r
> BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)
> mean(BarleyData)
> [1] 5.578947
```
- Is 5.579mm different from the average kernel length of 6.2mm?
```r
> SE<-sd(BarleyData)/sqrt(length(BarleyData))
> [1] 0.4279407
```
$$t = \frac{\bar{x} - \theta}{SE_x}$$
```r
𝑥 <- 5.578947
𝜃 <- 6.2
𝑆𝐸_𝑥 <- 0.4279407
t_score = -1.451259
```
- distribution of all possible t-scores
- centered at 0
- when null is true, numerator zero
- div by SE - STDev 1
	- Z distribution 
	- standard normal distribution
- t-score:
	- -1.5
	- probability of getting t-score or more extreme t-score when null is true
	- distribution is representation of all possible t-scores when the null is true
		- p-value

#### T Score
- What do we do with it?
	- t_score = -1.451259
	- H<sub>0</sub> : Mean Barley length = Factory average (6.2)
	- H<sub>A</sub> : Mean Barley length ≠ Factory average (6.2)
- Like the mean, t-scores are drawn from a normal distribution
	- **Central Limits Theorem**
- We can calculate the probability of getting our t-score or bigger if our barley were indeed similar in length to the overall factory average of 6.2mm (our null hypothesis)
- Notes:
	- H<sub>o</sub> = μ = 0
	- H<sub>A</sub> = μ ~~>~~ 0
		- flaw:
			- can happen in either direction
			- absolute value is further away
			- alternate hypothesis must account for being wrong both ways
			- only going to get one direction but must consider
		- one-tailed t-test:
			- trying to get a smaller p-value
- T-Score if Null was true:
	- t=0
		- distribution of all possible outcomes when the null is true
			- random chance
			- outcomes with t-scores far from 0
- More Notes:
	- P-Value:
		- Probability of rejecting the null when in fact the null is true
		- P(Reject H<sub>0</sub> | H<sub>0</sub> TRUE)
			- probability of t-score being that far from 0 is so low
				- reject the null
				- t-score could have happened even if null true
			- **Type 1 (I) Error**
				- *alpha*
					- sometimes wrong by random chance
						- reject a null when shouldn't have
					- frequency with which that happens=p
					- hypothetical:
						- 20 experiments where null is true
						- one of 20 on average will come to wrong conclusion
					- set different error rates: alpha value (p)
				- α = 0.05
					- Physics α = 0.0000003
						- very low
						- very sure
							- null false
					- Psychology α = 0.1
						- willing to have type 1 error
						- reject nulls when nulls were true
							- 10% of the time
						- interventions - better or worse
							- null = worse
							- alternate: 
								- fail to reject null but treatment would have been better
						- weigh cost
			- Type 2 (II) Error:
				- Probability of failing to reject given null is false statement
					- P(fail to reject | H<sub>0</sub> FALSE)
				- cannot solve for both
					- two errors compete against each other
					- more type 1 = less type 2 and vice versa
						- decide based on alpha value
		- problem:
			- don't decide after the fact what alpha value you want
				- after p-value, changed
					- set in bio as 0.05
			- type 1 error rate
				- calculate before
			- biased:
				- tried to reject null
					- change alpha value
			- need to set beforehand
				- 0.05 standard bc no trust
		- paired t-test
			- strongest experimental design
				- better statistical story
			- example:
				- 20 mice
				- measure each mouse in both treatment and control group
					- more info than split into 10-10
				- similar to:
					- one sample t-test
			- theta = 0
				- average delta = 0
- R code:

#### R Code

```r
#T test Day 1

BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)

meanBD<-mean(BarleyData)

sdBD<-sd(BarleyData)

SEBD<-sdBD/sqrt(length(BarleyData))

ExpectedMU<-6.2

t_scoreBD<- (meanBD-ExpectedMU)/SEBD
```

### Paired T-Test
- Lets say we have a paired design where we are comparing a treatment to a control:
	- H<sub>0</sub> : The mean of the treatment group = mean of the control group
		- Δ𝑥<sub>1,2</sub>=0
			- $$\Delta x_{1,2} = 0$$
	- H<sub>A</sub> : The mean of the treatment group ≠ mean of the control group
		- Δ𝑥<sub>1,2</sub> ≠ 0
			- $$\Delta x_{1,2} \neq 0$$
- Notes:
	- comparing treatment to control group
		- means /=/
	- treatment and control category
		- each participant is a row
		- every one sampled twice
			- treatment and control number for each
		- create a column of delta values
			- subtract treatment from control score
			- single column of data
				- delta of treatment control
		- ask:
			- if average of deltas is equal to some expected value theta
		- paired t-test is a one-sample t-test on this delta
	- theta is almost always 0
		- interested if there's a difference between treatment and control
	- average delta should be 0
		- paired t-tests in R next

---

Previous: [BILD 5 Lecture 13](BILD_5_LE_13.md).
Next: [BILD 5 Lecture 15](BILD_5_LE_15.md).