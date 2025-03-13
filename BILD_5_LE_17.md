---
course: BILD 5
type: lecture
lecture_num: 17
date: 2/14
---

# BILD 5 Lecture 17
- ## 2/14
	- ## P-Values

## P values:
### The Good, the Bad and the Ugly
### Definition
- **P-value**: 
	- *The probability of getting a test statistic equal to or further away from the null expectation given the null is true.*

> [!info]
> ***P-Value***
> The probability of getting a test statistic equal to or further away from the null expectation 
> given the null is true.

#### Test
```r
One Sample t-test

data: dat
t = 3.7839, df = 18, p-value = 0.001359
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
0.3591351 1.2557992
sample estimates:
mean of x
0.8074671
```
- probability of getting this t-score or a more extreme t-score if the null is true
	- if null is true, in t-distribution
		- see [[#T Graph]]
	- most t-scores are 0 if the null is true
	- fall to the side by random chance
	- p-value equal to or further away
		- can be wrong in both directions
		- area under curves would be p-value
			- 0.01
	- area to left/right of red lines
#### T Graph
![[pValueGraph.png]]
### The Good
- **P-value**: 
	- The **==probability==** of getting a test **==statistic==** equal to or further away from the **==null==** expectation given the null is true.
- Allows us to measure the confidence we have in the null hypothesis – 
	- **Type 1 error**
- Allows us to perform deductive reasoning
- Notes:
	- uncertain
	- data
	- H<sub>o</sub>: Null is **testable**
		- $\bar{X} = \theta$
	- H<sub>A</sub>: Alternate
		- $\bar{X} \neq \theta$
	- what we want
	- experiment has two outcomes:
		- reject or accept null
	- if reject null when it's true
		- Type I Error rate
			- set alpha value
	- if accept null when true:
		- correct conclusion
		- true negative
	- p value is helpful when we exist in a universe where the null is true
		- because helping us determine which two boxes
	- when null is true:
		- accidentally reject it 5% of the time
			- 95% of the time correct outcome
	- allows to reject the null
		- perform deductive reasoning
	- H<sub>o</sub> TRUE:
		- Reject:
			- $\alpha$ (alpha value)
			- **Type I Error**
		- Accept: 
			- True
			- Negative
### The Bad
- **P-value**: 
	- The probability of getting a ==**test statistic equal to or further away**== from the null **==expectation==** given the null is true.
	- Notes:
		- null expectation
		- distribution of all possible t-scores when the null is true
			- most should be null
			- rare for experiments *not* to conform to null
		- central limit theorem
			- distribution of t-scores
				- infinite repeat of null experiments
				- t-distributed
					- centered around 0
				- See [[#Tvals]]
			- means: normally distributed
		- what would the distribution of p-values look like?
	- **Q**: What shape would the distribution of p-values have when the null is true?
		- Intuition:
			- probability of event occurring
			- p-values must exist between 0 and 1
			- can't be centered normally at 0
			- nothing less than / to the left of 0
		- Answer:
			- **Uniform**, 
				- no single p value is more or less likely
					- See [[#Pvals]]
		- any p-value is equally likely to occur
			- when the null is true
				- and infinite experiments
			- experimental result
				- is random
			- p-values are random numbers 
				- between 0 and 1
			- p 0.05 is 5% of total experiments
				- set alpha for 5% at total rectangle
		- p-values when null is true are
			- random variables drawn from a uniform distribution
			- 5% of them under significance threshold
				- so small that we reject the null falsely
			- type 1 error
				- incorrectly reject null 1 in 20 times
		- when null is true, p-value is a random number
			- will incorrectly reject null alpha % of the time
	- notes:
		- repeatability is a problem
		- if someone else also rejects the null
			- independent probabilities
				- get multiplied together
			- new alpha error rate of repeated study is 0.25%
		- ability to not commit type 1 error
			- dramatically improves with repeated experimentation
#### Graphs
##### Graph 1
![[badPValueGraph.png]]
##### Graph 2
![[badPValues1.png]]
##### Graph 3
![[badPValues2.png]]

#### R Code

```r
tvals<-NA
pvals<-NA
for(i in 1:10000){
  randomSample<-rnorm(20,mean=3,sd=1)
  tvals[i]<-t.test(randomSample,mu=3)$statistic
  pvals[i]<-t.test(randomSample,mu=3)$p.value
}
hist(tvals)
hist(pvals)
```
##### R Graphs

###### Tvals

![[tvalsHistogram.png]]

###### Pvals

![[pvalsHistogram.png]]

#### The Bad Explained
- **P-value**: 
	- *The probability of getting a test statistic equal to or further away from the null expectation given the null is true.*
- What would the distribution of p values look like if we sample the null distribution thousands of times?
	- See [[#Graph 1]]
- Do this 10000 times
	- See [[#Graph 2]]
		- A) Normal
		- B) Uniform
		- C) t
	- Lets use R and find out!
		- See [[#Graph 3]]
- We will incorrectly reject a “true” null hypothesis 1 in 20 times with an α = 0.05
- Is 5% of biology wrong?
	- This is why repeatability is such a big issue in biology
		- 0.05 * 0.05 = 0.0025
			- Always a relevant XKCD…
				- ![Comic2](https://imgs.xkcd.com/comics/significant.png)
					- ![Comic1](https://imgs.xkcd.com/comics/p_values_2x.png)
		- notes:
			- no way around 5% error when null is true
			- notes:
				- test independently
				- measure a lot of things
				- only one significantly different
					- is it truly different
					- or just random chance
					- that was significantly different
					- because 5% of phenotypes measured
					- should be significantly different
					- even when null is in fact true
				- p-value isn't the story
				- performed experiment for difference in means
					- delta column / correlation
					- statistic/parameter estimate
				- p-value is how convincing story is / which
				- null hypothesis is about biology not p-value
			- Question:
				- how small the p-value is doesn't matter
				- but aren't you still more certain that the null has been rejected
				- it is kind of more significant
				- maybe you want a different standard for the alpha value 
					- than the 0.05 in the study
					- so knowing it's small is still useful?
	- Focus on the p-value hides the biology behind the stats
		- Which of the following two scenarios is more interesting biologically?
			- A) Scientists found a significant relationship between the drinking of red wine and cancer rates in adults over 50. p=0.001, ∆x = 0.0003%, n = 300,000
			- **B) A clinical study using magnetotaxis as a tumor treatment failed to show a change in cancer rates in adults over 50. p=0.06, ∆x = 12.23%, n = 200**
		- Notes:
			- either rejected null or didn't
				- p-value only used to make a deductive statement about one hypothesis
				- change in cancer rate is small
					- enormous sample size
					- tiny differences that are significantly different
					- enormous sample sizes
					- incredible power to detect those differences
				- or
			- second study is more interesting
				- 12% change in cancer risk
			- 12% change vs 0.0003% change
			- don't let p-value be storyteller
			- stories about biology, not probability
### The Ugly
- **P-value**: 
	- *The probability of getting a test statistic equal to or further away from the null expectation* 
		- **==given the null is true==**.
		- notes:
			- only means something when the null is true
				- probability of getting our t-score when the null is true
			- but as soon as p-value is false
				- less than 0.05
					- null is false
			- but when the p-value is less than 0.05
				- say that the null isn't true
			- so p-value means nothing when reject null
				- isn't a real number anymore
			- probability of data given null is true
			- don't know shape of t/p-distribution
				- when null is false/rejected
			- no set shape for this anymore
			- p-value only useful when this half of universe is true
				- when null is true
			- what happens when null hypothesis is false
		- H<sub>o</sub>: FALSE
			- Reject:
				- TRUE (+)
					- true positive
						- reject null and null is false
						- did you come to correct conclusion in universe
						- recognize one of four boxes
					- when p is less than alpha we reject the null
			- Accept:
				- Beta
				- Type II Error
					- probability of accepting a false null
						- it was right to reject null
					- got it wrong in the other direction
					- the likelihood of detecting a true effect when it exists:
						- *power*
					- likelihood of detecting type 2 error when exists
					- it was false?
- But as soon as p < α, we reject the null…
	- When the null is true, we know our false discovery rate. 5%
- When the null is false, 
	- How often will we come to the wrong conclusion?
- Type II error rate, the probability of accepting a false null
	- The likelihood of not committing type II error is called **Power**
### Null Table

|        | H_o TRUE               | H_o FALSE            |
| ------ | ---------------------- | -------------------- |
| Reject | - Alpha - Type I Error | TRUE (+)             |
| Accept | TRUE (-) negative      | Beta - Type II Error |
- two ways to be right and two ways to be wrong
- experiment has two outcomes:
	- reject or accept null
	- when **true**:
		- when null is true we are wrong 5% alpha of the time
		- if **reject** null when it's true
			- Type I Error rate
				- set alpha value
		- if **accept** null when true:
			- correct conclusion
			- true negative
	- when false:
		- 
$$P_{nR} \equiv \frac{\Delta \alpha \sqrt{R}}{\sigma}$$

### Power
- Type II error rate, the probability of accepting a false null
- The likelihood of not committing type II error is called Power
- Power in a t test:
$$\propto \frac{\Delta\bar{x} \times \alpha \times \sqrt{n}}{\sigma}$$
- Equation:
	- $\text{Power in a t test} \propto \frac{\Delta\bar{x} \times \alpha \times \sqrt{n}}{\sigma}$
- Where:
	- $$\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta$$
	- α = Type I error rate
	- n = Sample size
	- σ = Standard error
- Notes:
	- proportional to ^
	- easier to detect true effect when delta is bigger
		- when x size is larger
	- power proportional to delta
	- and alpha (dangerous)
	- if alpha is bigger
		- reject nulls when p-value is .1
		- more power
			- no type 1 error
	- cannot fix both alpha and beta rates simultaneously
		- if make small error bc avoid type 1
		- increasing type 2 error rate
			- if need 0.00001 to reject null
			- artificially failing to reject null
				- when null is in fact true
			- p-value so small
				- might miss effects
		- equal relationship between power and alpha
			- means we can't solve for both
	- sample size can also increase power
		- improve ability to detect differences between groups
			- whether biologically significant / meaningful debatable
	- inversely proportional to sigma
		- bigger standard deviation
			- harder to distinguish from one another
		- example:
			- bc if diff in means = 3
			- and Standard error 0.1
				- easy to tell different
			- if standard deviation enormous
				- going to overlap
		- so standard deviation inversely proportional to power
- more notes:
	- power can be estimated
		- can't be set before experiment 
			- (fixed like alpha)
		- but can calculate after the fact
	- power curves:
		- see graphs
- **power** definition:
	- probability to detect an effect when it in fact exists
#### Formula
> [!note] Power Formula
> $$\text{Power in a t test} \propto \frac{\Delta\bar{x} \times \alpha \times \sqrt{n}}{\sigma}$$

> [!important] Components
> - $\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta$
> - $\alpha = \text{Type I error rate}$
> - $n = \text{Sample size}$
> - $\sigma = \text{Standard error}$

#### Shape of Power
##### Raw Effect Size
1. $$\text{Power in a t test} \propto \frac{{\color{red}\Delta\bar{x}} \times \alpha \times \sqrt{n}}{\sigma}$$
	- ${\color{red}\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta}$
	- $\alpha = \text{Type I error rate}$
	- ${\color{red}n = \text{Sample size}}$
	- $\sigma = \text{Standard error}$
- notes:
	- at small effect sizes
		- don't have a lot of power to detect that effect
		- most often experiment will fail to detect that effect
		- fail to recognize that null is in fact false
	- as effect size grows
		- easier to tell they're different
	- molecular bio:
		- glowing vs. not glowing
		- questions more nuanced 
		- differences between groups smaller
		- need statistical tests
	- get so powerful that of course detect difference
		- "flying pig"
##### Raw Effect Graph
![[rawEffectSize.png]]
##### Sample Size
2. $$\text{Power in a t test} \propto \frac{\Delta\bar{x} \times \alpha \times {\color{red}\sqrt{n}}}{\sigma}$$
	- $\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta$
	- $\alpha = \text{Type I error rate}$
	- ${\color{red}n = \text{Sample size}}$
	- $\sigma = \text{Standard error}$
- notes:
	- power of n
	- sample size
	- if n=50
		- more likely to find results
	- want sufficient sample size
		- good chance to detect effect if it exists
	- failed to reject null
		- because only 10 individuals
	- even though should have rejected null
		- didn't find difference because not enough ppl
##### Sample Size Graph
![[sampleSize.png]]
##### Standard Error
3. $$\text{Power in a t test} \propto \frac{\Delta\bar{x} \times \alpha \times \sqrt{n}}{{\color{red}\sigma}}$$
	- $\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta$
	- $\alpha = \text{Type I error rate}$
	- $n = \text{Sample size}$
	- ${\color{red}\sigma = \text{Standard error}}$
- notes:
	- as width of distribution increases
		- gets less likely able to detect differences
##### Standard Error Graph
![[standardError.png]]
##### Power
4. $$\text{Power in a t test} \propto \frac{{\color{red}\Delta\bar{x}} \times \alpha \times {\color{red}\sqrt{n}}}{\sigma} = {\color{red}0.8}$$
	- ${\color{red}\Delta\bar{x} = \bar{x} - \theta = \text{Effect size} = \delta}$
	- $\alpha = \text{Type I error rate}$
	- ${\color{red}n = \text{Sample size}}$
	- $\sigma = \text{Standard error}$
	- ${\color{red}\text{Power} = 0.8}$ 
		- (Standard threshold)
		- Notes:
			- useful for experimental design
			- can predict effect size of a study before you run it
				- study not new/unique
				- predict effect size
			- some estimate of true difference between groups
				- before starting
				- ask lab
					- on average when detect effect
					- how different does phenotype get
					- glow degree of brightness
			- have some prediction about 
				- what effect size of study would be
			- hold power constant at .8
				- detect effect 80% of the time it's there
					- or at .9
				- can identify how many samples we need in that experiment
			- grant writing:
				- how big we need our sample size
					- pay
			- power analysis
				- effect size in certain range
					- need funding for participants
			- need *n* sample size
				- expense
				- sample more participants = $
					- sample size is where money goes 
		- when null is false
			- want to know:
				- what's the probability of being wrong
			- if have pieces of information
				- delta, alpha, sample size, sigma
			- can estimate our power
		- good experimental design
			- reports both alpha rate (0.05)
				- paper should also calculate Beta at end
			- whether reject null or not
				- beta is still important
##### Power Graph
![[powerGraph.png]]

### The Ugly P2
- **P-value**: 
	- *The probability of getting a test statistic equal to or further away from the null expectation* 
		- ***given the null is true***.
	- But as soon as p < α, we reject the null…
	- When the null is true, we know our false discovery rate. 
		- 5%
	- When the null is false, 
		- What is our probability of being wrong?
			- $\Delta\bar{x} = 0.3$
			- $\alpha = 0.05$
			- $n = 50$
			- $\sigma = 1$
	- When the null is false, 
		- probability of being wrong = 
			- **1-Power**
	- What if there is a 15% chance our null is false? 
		- How does this change our False Discovery Rate? 
			- Is it still 5%?
### R Code
```r
> source("~/CSE_Notes/BILD_5/Lectures/R_Work/T_test-Day3.R")
> #T test Day 2
> 
> #Single Sample t test
> 
> BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)
> BarleyData
 [1] 3 5 4 7 5 6 8 9 6 4 5 2 5 6 9 6 4 5 7
> meanBD<-mean(BarleyData)
> meanBD
[1] 5.578947
> sdBD<-sd(BarleyData)
> sdBD
[1] 1.86535
> SEBD<-sdBD/sqrt(length(BarleyData))
> SEBD
[1] 0.4279407
> ExpectedMU<-6.2
> ExpectedMU
[1] 6.2
> t_scoreBD<- (meanBD-ExpectedMU)/SEBD
> t_scoreBD
[1] -1.451259
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

> 
> 
> #Paired t test
> 
> Control <- c(3.5, 3.9, 3.2, 3.1, 1.5, 3.2, 3.5, 3.8, 4.6, 1.1, 2.9, 1.9)
> Treatment <- c(5.4, 5.5, 2.7, 4.4, 1.7, 4.2, 5.6, 5.1, 5.3, 4.5, 5.6, 1.6)
> 
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
> 
> DeltaMean<-mean(delta)
> DeltaMean
[1] -1.283333
> 
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

> #or
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

> #It is the same thing!
> 
> 
> #Two sample t test
> 
> Group1<-c(16, 19, 13, 15, 15, 17, 11, 17, 13, 15, 15, 15, 11, 15,  8, 16, 20, 10, 16, 10)
> Group2<-c(19, 18, 18, 15, 17, 16, 18, 19, 20, 15, 14, 19, 13, 20, 21, 19, 12, 16, 16, 15)
> 
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

> t.test(Group1,Group2,var.equal = TRUE)

	Two Sample t-test

data:  Group1 and Group2
t = -2.9797, df = 38, p-value = 0.005007
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -4.4503695 -0.8496305
sample estimates:
mean of x mean of y 
    14.35     17.00 

> curve(dt(x,100),xlim=c(-5,5),lwd=5)
> curve(dt(x,1),xlim=c(-5,5),col="goldenrod",lwd=5,add=TRUE)
> 
> 
> #Let's run a real example!
> LectData<- read.csv("Week6Lect.csv")
> 
> library(tidyverse)
> 
> Control<-LectData|>filter(Group=="control")
> Treatment <-LectData|>filter(Group=="treatment")
> 
> 
> #What do we do next?
> 
> Control
     X    Response   Group
1   51 0.079979234 control
2   52 0.016772622 control
3   53 0.039367300 control
4   54 0.018044281 control
5   55 0.307915438 control
6   56 0.071492781 control
7   57 0.008249290 control
8   58 0.084582166 control
9   59 0.094496407 control
10  60 0.068007970 control
11  61 0.159704658 control
12  62 0.022108083 control
13  63 0.100726460 control
14  64 0.047266397 control
15  65 0.113814698 control
16  66 0.088003689 control
17  67 0.003169921 control
18  68 0.049486073 control
19  69 0.097799191 control
20  70 0.012276751 control
21  71 0.105286286 control
22  72 0.158705260 control
23  73 0.066746560 control
24  74 0.022252261 control
25  75 0.020157048 control
26  76 0.047054236 control
27  77 0.047593593 control
28  78 0.035366717 control
29  79 0.138263515 control
30  80 0.022514991 control
31  81 0.066251707 control
32  82 0.028864210 control
33  83 0.149262950 control
34  84 0.027226135 control
35  85 0.090464441 control
36  86 0.139927744 control
37  87 0.248410276 control
38  88 0.007207568 control
39  89 0.030247229 control
40  90 0.038665064 control
41  91 0.021564481 control
42  92 0.162217158 control
43  93 0.011750623 control
44  94 0.060932062 control
45  95 0.054666052 control
46  96 0.059694295 control
47  97 0.029986826 control
48  98 0.012760398 control
49  99 0.111185495 control
50 100 0.016079578 control
> Treatment
    X    Response     Group
1   1 0.036112366 treatment
2   2 0.018378099 treatment
3   3 0.098380203 treatment
4   4 0.003399866 treatment
5   5 0.040476029 treatment
6   6 0.097000724 treatment
7   7 0.095459588 treatment
8   8 0.134789424 treatment
9   9 0.000799461 treatment
10 10 0.025261502 treatment
11 11 0.033763543 treatment
12 12 0.050802043 treatment
13 13 0.102445539 treatment
14 14 0.040780924 treatment
15 15 0.160347799 treatment
16 16 0.109967870 treatment
17 17 0.115323477 treatment
18 18 0.332233684 treatment
19 19 0.004684772 treatment
20 20 0.101951563 treatment
21 21 0.303412311 treatment
22 22 0.032628164 treatment
23 23 0.056270227 treatment
24 24 0.100050735 treatment
25 25 0.000235139 treatment
26 26 0.006625483 treatment
27 27 0.225267808 treatment
28 28 0.082167551 treatment
29 29 0.016601961 treatment
30 30 0.126325945 treatment
31 31 0.016871362 treatment
32 32 0.082212069 treatment
33 33 0.019478567 treatment
34 34 0.005890042 treatment
35 35 0.112752029 treatment
36 36 0.188371562 treatment
37 37 0.124558671 treatment
38 38 0.007240455 treatment
39 39 0.039351862 treatment
40 40 0.176986787 treatment
41 41 0.032814289 treatment
42 42 0.072416327 treatment
43 43 0.105217233 treatment
44 44 0.093415142 treatment
45 45 0.040205729 treatment
46 46 0.045002133 treatment
47 47 0.135954156 treatment
48 48 0.438710760 treatment
49 49 0.035762134 treatment
50 50 0.145892271 treatment
> 
```
#### File
```r
#T test Day 2

#Single Sample t test

BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)

meanBD<-mean(BarleyData)

sdBD<-sd(BarleyData)

SEBD<-sdBD/sqrt(length(BarleyData))

ExpectedMU<-6.2

t_scoreBD<- (meanBD-ExpectedMU)/SEBD

t.test(BarleyData,mu = 6.2)


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


#Two sample t test

Group1<-c(16, 19, 13, 15, 15, 17, 11, 17, 13, 15, 15, 15, 11, 15,  8, 16, 20, 10, 16, 10)
Group2<-c(19, 18, 18, 15, 17, 16, 18, 19, 20, 15, 14, 19, 13, 20, 21, 19, 12, 16, 16, 15)

t.test(Group1,Group2)
t.test(Group1,Group2,var.equal = TRUE)
curve(dt(x,100),xlim=c(-5,5),lwd=5)
curve(dt(x,1),xlim=c(-5,5),col="goldenrod",lwd=5,add=TRUE)


#Let's run a real example!
LectData<- read.csv("Week6Lect.csv")

library(tidyverse)

Control<-LectData|>filter(Group=="control")
Treatment <-LectData|>filter(Group=="treatment")


#What do we do next?

```


---

Previous: [BILD 5 Lecture 16](BILD_5_LE_16.md).
Next: [BILD 5 Lecture 18](BILD_5_LE_18.md).