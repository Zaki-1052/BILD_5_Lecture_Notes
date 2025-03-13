---
course: BILD 5
type: lecture
lecture_num: 11
date: 1/31
---

# BILD 5 Lecture 11
- ## 1/31
	- ## Transformations
	- ## & Distributions

## Transformations and Other Distributions

### Notes

- cat mass - describe universe with:
	- Mu and Sigma parameters
- don't know parameters
	- estimate them with our statistics
	- X bar, standard deviation X
		- X̄ = μ
		- S<sub>x</sub> = 0
	- estimates of the truth
		- close to Mu and Sigma
	- however, bad estimates if the truth is that
		- the distribution of cat mass is not normal
	- bad assumption if data is not normal
		- will test assumption
		- assumption: histogram of data
			- data are random variables drawn from a normal distribution
				- how normal are normal data
				- natural variation, random sampling
				- histogram not perfectly normal
				- what is enough
					- can't sample infinitely
					- don't get a smooth curve
						- skewed
			- bc of natural variation
				- reasonable to assume that if truth is:
					- distribution perfectly normally distributed
					- won't be able to observe that
					- needs to be a strength of observation in research argument

### Normality

#### How normal is normal data?

- There is natural variation in our sampling:
	- how can we be sure the data are normally distributed?
- ##### **Why do we care?**
	- The mean only means what we think the mean means when we estimate the mean from a normal distribution of data
		- notes:
			- measure skewness by how far the median is from the mean
			- red line is not a good measurement of the central tendency
				- natural variation
				- even if normally distributed
				- what would normal distribution look like
					- with our shape and location parameter
			- normal distribution based on data
			- overlaid that distribution
##### Image
![[normalData.png]]

### Testing Data

- #### **Testing data for normality:**
	- ##### **Compare our data to the ideal distribution**
		- There is natural variation in our sampling, how can we be sure the data are normally distributed?
		- What would a normal distribution with our shape parameter and location parameter look like?
		- How far away are our data from the expected values?

#### The Kolmogorov-Smirnov Test

- Rearrange the dataset in ascending order
	- actual observations
		- mean of 50.14
		- standard deviation of 7.98
- Generate an ‘ideal’ distribution using parameters drawn from our data
	- pretend like those are absolutely true parameters 
	- build a normal distribution on top of histogram of observations
	- see if line up
		- or draw arrows
- Measure the distance between our sample data and “ideal” data
	- on average, how far away are my observations from where they should be if the data were perfectly normal
		- key to test for normality
		- true for testing any distribution
	- pink line is normal distribution
		- *measure this distance* of how far each of my observations are
			- if observations far, far from normality
			- expect variation in sample
				- random noise in universe
	- goal of test is to measure the distance between our sample data
		- shown in histogram, 
	- and the ideal data
		- if we were able to collect an infinite number of samples 
		- with the exact same parameters as what we estimated 
			- from our limited observations 
				- (15 cats, 100 temperatures, etc.)
					- what would the distance between those two look like

##### Graph
![[KolmogorovSmirnov.png]]

##### Research Question
- **Kolmogorov-Smirnov (KS) Test**:
- Research Question: 
	- Are our data random samples drawn from a normal distribution with $$μ = \bar{x}_{data} \quad σ = sd_{data}$$?
		- mu equal to mean of data
		- sigma equal to standard deviation of data
- What are the statistical hypotheses associated with this research question?
	- Null hypothesis: 
		- The sample data do not differ from the ideal distribution
	- Alternate Hypothesis: 
		- The sample data differ from the ideal distribution
	- **H<sub>0</sub>** = Data are **normal** (*null*)
	- **H<sub>A</sub>** = Data are **not normal** (*alternate*)
- notes:
	- want the null to be true
		- data normal, mean is significant
		- data should be normal
	- how close are data to idealized curve?
	- if data perfectly normal
		- length of arrows would sum to zero
	- Distance = 0 (ideal)
	- $$D\neq0$$ 
		- (alternate)
	- want to test null that distance (D) equal zero
		- probability of getting my actual distance value if:
			- the true distance is equal to zero
		- run KS Test, measure actual distances
			- get distance value of:
				- d = 0.02
			- close to zero but not exact
	- probability that with random sampling:
		- observe a little bit of distance 
		- if the truth is that:
			- the true distance between the population I sampled from 
			- and the idealized normal population 
				- is zero
	- Probability of getting our distance number given:
		- the null is true, i.e.
		- the true distance is equal to 0
			- if null is true, how likely is my observation
			- $$0.05\geq P(Dist|TrueD=0)$$
		- probability of getting the distance measurement from my data
			- pink lines
		- if the true distance between my population and a normal distribution representing my population would be zero
			- if that value is less than or equal to 0.05
				- Reject the null
		- less than or equal to 5% chance of getting my distance value 
			- when the null is true, 
			- and observe that value
				- got lucky, or
				- model is bad
					- null hypothesis is wrong
			- Reject null
			- accept alternate
				- that data are not normally distributed
		- p-value = probability of our data given the null being true (LE)
			- conditional probability statement

##### The Kolmogorov-Smirnov test

- Calculates the probability that our data are drawn from this ideal distribution
	- P-value = 
		- the probability that the sample data are drawn from the “ideal” distribution
	- Null hypothesis: 
		- The sample data do not differ from the ideal distribution
	- If the p-value is ≤ 0.05 (less then a 5% chance) then: 
		- we *reject* the null hypothesis as a reasonable explanation of our data
			- Alternate Hypothesis: 
				- The sample data differ from the ideal distribution
			- Our data are not normally distributed
				- X bar is not equal to Mu
- notes:
	- if do get a small p-value
		- then our alternate hypothesis:
			- the sample data differ from the idealized normal distribution
		- our data aren't normal
			- so estimate of the mean can no longer be trusted
		- X bar isn't a good estimate of our data anymore
			- because Mu doesn't exist
			- bc the data aren't random variables drawn from a normal distribution
		- calculating averages of measurements
			- average only matters if data are normally distributed

### Testing Normality

#### Common Normality Tests

- The Kolmogorov-Smirnov test:
	- Weak to data with many repeating values 
	- & not specific to the normal distribution
		- don't expect the universe to be normally distributed
			- maybe expect exponential decay rate, etc.
		- can test against any underlying mathematical distribution
			- test whether data meets assumption of that function
		- how far away data are from the normal
			- get distance value
		- prove normal distribution
- The Shapiro-Wilks test:
	- Weak to data with many repeating values
		- like KS Sample
	- and Weak to small sample sizes
		- all tests are weak to small sample sizes
			- SW more than KS
		- examples:
			- can't test if dice/coin loaded from one roll/flip
		- tests for normality require large/sufficient sample sizes 
			- to see through randomness
- The D'Agostino's K<sup>2</sup> test:
	- Specific to the Normal Distribution.
	- Complex but powerful.
- Eyeball Test:
	- Examine the histogram of your data.
	- Completely subjective but time effective
#### R Code

##### Experiment 1

###### Histogram

```r
turtle<-rnorm(30,mean=6,1.4)
#measure 30 turtles
#avg mass 6.4 pounds
#stdev 1.4 pounds
hist(turtle)
ks.test(x=turtle,pnorm,mean(turtle),sd(turtle))
#function
#input: x=data turtle
```
- test if normally distributed
	- start with eyeball test
- ks test:
	- tell it what distribution to use
		- probabilities of normal dist
	- `pnorm` - own function
	- specific to my data
		- mean and standard deviation
	- input:
		- data
		- type of distribution
			- that we think our data are drawn from
		- and parameter estimates of that distribution
			- normal distribution
			- with a mean equal to X bar of turtles 
			- and a standard deviation equal to 
				- the standard deviation of turtles
	- output: 
		- get a distance value
		- and p-value
###### Image

![[turtleHistogram.png]]

###### KS Test

```r
> ks.test(x=turtle,pnorm,mean(turtle),sd(turtle))
	Exact one-sample Kolmogorov-Smirnov test

data:  turtle
D = 0.11683, p-value = 0.7646
alternative hypothesis: two-sided
```

###### Question

- Were the data random variables drawn from a random distribution?
	- Yes, the p-value was greater than 0.05
- Notes:
	- Calculated the distance from our data
		- got distance score of 0.084
		- 0.9693
	- probability of getting a distance score greater than 0.05 
		- given the true distance is equal to 0
			- $$P(D \geq 0.085 | True D = 0) = 0.9693$$
		- interested in any score more extreme than my distance score
			- probability of my observed distance or an even more extreme value
				- if truth is that score should be equal to zero
		- probability of this event occurring
			- 97% of the time
			- if sampled 30 turtles
			- from a distribution
			- with a mean equal to our mean
			- and standard deviation with sd
			- you would get distance values
			- greater than or equal to the distance value we observed
		- 97 times / 100 with null being true
			- we'd get a distance value at least that big
				- if not bigger
			- why reject the truth
			- if 97% of time
			- would get distance score
			- or something more extreme
			- if that was the truth
		- failed to reject the null
			- nowhere near sufficient evidence to disprove
			- so null is best model describing our universe
				- data are normally distributed
					- because p-value is greater than cutoff threshold
		- when p-value is big:
			- failed to reject
			- null can happen
			- data is not surprising
			- given null being true
				- that number or greater
				- 97% chance to get observation 
					- if it was true that null is 
						- correct statement about the universe
				- alternate:
					- data aren't normal

##### Experiment 2

###### Histogram

```r
BB<-rlnorm(30,meanlog=1.5,.5)
hist(BB)
ks.test(x=BB,pnorm,mean(BB),sd(BB))
```

###### Image

![[plantHistogram.png]]

###### KS Test

```r
> ks.test(x=BB,pnorm,mean(BB),sd(BB))
	Exact one-sample Kolmogorov-Smirnov test

data:  BB
D = 0.16126, p-value = 0.3758
alternative hypothesis: two-sided
```

###### Question

- Were the data random variables drawn from a normal distribution?
	- Yes, the p-value was greater than 0.05.
		- failed the eyeball test 
			- but passed KS test
		- mathematical interpretation is correct
			- failing to reject null
			- because ks test says 21% 
			- of getting this distance value or greater
			- if the null is true
				- above threshold
		- estimates of unknowable universe
		- ideal from deductive reasoning
		- failed to reject null
		- 25% chance of getting this distance value if null is true
			- estimate


#### Skew

- ##### **The distribution of data can deviate from normal in predictable ways**
	- ways we can deviate from normality
		- how far away mean is from median
	- **Left Skew**:
		- When the mean is drawn further left than the median and mode
			- mean is smaller than median
			- median is more positive than mean
	- **Right Skew**:
		- When the mean is drawn further right than the median and mode
			- if mean is greater than median
				- looks like mean has travelled right
	- **Width** (*kurtosis*):
		- shape
			- too skinny
			- or too wide
- skew:
	- direction of skewness
		- deviation from normality
	- how far away from the middle of the data the mean is
		- positive/negative skew
		- left/right
- can fix with mathematical transformations
##### Images
###### Left Skew
![[leftSkew.png]]
###### Right Skew
![[rightSkew.png]]
###### Width (kurtosis)
![[widthSkew.png]]

### Transformations
- ###### **We can attempt to bring data back into a normal shape with data transformations**
	- ##### **Square root transformation**
		- $$x_i \rightarrow \sqrt{x_i}$$
		- In r: 
	```r
	sqrt(data$A)
	```
	- ##### Log

### Transformations
- ###### **We can attempt to bring data back into a normal shape with data transformations**
	- ##### **Square root transformation**
		- $$x_i \rightarrow \sqrt{x_i}$$
		- In r: 
	```r
		sqrt(data$A)
	```
	- ##### **Log transformation**
		- $$x_i \rightarrow \log(x_i)$$
		- In r:
	```r
		log(data$A)
	```
		- ln()
	- ##### **Reciprocal transformation**
		- $$x_i \rightarrow \frac{1}{x_i}$$
			- In r:
	```r
		1/(data$A)
	```
	- ##### **Rank transformation**
		- 1.3, 3.4, 27, 0.5 ~ 2, 3, 4, 1
		- In r:
		```r
		rank(data$A)
		```
		- Last resort
			- All other transformations can be back transformed
			- We lose information about our data
				- can't back transform rank
			- Medical Literature
##### Graphs
##### Sqrt
![[sqrtData.png]]
##### Log
![[logData.png]]
- natural log
##### Reciprocal
![[reciprocalData.png]]
##### Rank
![[rankData.png]]

#### Data Shape

- **Wait, I can just change the shape of my data whenever and however I want?**
	- *Yes*.
	- do the same to **all** of your observations
	- The data have already been transformed!
		- As soon as you collected the data, you transformed it.
		- Our math is in base 10…
		- pH is already log transformed concentration…
		- Height of a tree is just a fancy cube root of volume…
	- already transforming the universe by measuring it
		- transform data to look normal
		- pass KS test, etc so we can find means
- So nothing is holding you back from performing more math on your data...
	- As long as you keep track of your units!

### R Code

```r

```





---

Previous: [BILD 5 Lecture 10](BILD_5_LE_10.md).
Next: [BILD 5 Lecture 12](BILD_5_LE_12.md).