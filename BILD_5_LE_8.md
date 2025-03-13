---
course: BILD 5
type: lecture
lecture_num: 8
date: 1/24
---

# BILD 5 Lecture 8
- ## 1/24
	- ## Describing Data
		- ## Variance

## Variance

### Notes

- start with an assumption
	- population you're measuring can be explained by a number
	- true number that exists to explain that population --
- Have a population
	- number is parameter
		- μ (mean)
	- can't measure entire population
		- take a bit ==
- Experiment:
	- best guess of Mu parameter:
		- mean
	- maximum likelihood estimate of Mu ==
- Best estimation of μ:
	- sum(x)/n
$$
μ = \frac{\sum(x_i)}{n} \times \infty
$$
- average/mean:
	- add up numbers and divide by number of numbers you have
- if repeat experiment an infinite number of times:
	- most of those experiments would be near true parameter
		- very rarely by random chance would you get extremely different means from the truth
	- distribution of means would itself be normally distributed
	- value exists somewhere randomly in that distribution
	- middle of distribution would be μ
		- μ is true parameter
	- the universe can in fact be explained through numbers that we can estimate those numbers through experimentation
	- but our estimate is itself a random variable drawn from the distribution of all possible estimates
		- what it means to say you know the *mean* of something
	- don't get to know where we exist on the graph of distribution all possible x
		- `X̄`
	- want control over shape of distribution
		- don't control outcome of experiment
		- shape of distribution under our control
		- because it changes with sample size
			- low/high n
			- closer/further from the truth
			- shape of curve
			- law of large numbers
		- if sample size is bigger, experiment is taking a bigger chunk out of the population
		- if sample size infinitely large, would have measured entire population
			- would already know μ
			- no need for statistics
		- if sample better, more likely to be closer to the truth
		- have distribution that can help us predict just how close to the truth we are
		- to get to that prediction, we need variance
- μ in middle distribution curve of X
- experiment will be in shape
	- shape of curve changes with sample size
	- if sample more data, more likely to be closer to truth
	- distribution to predict how confident we are
	- confidence interval
- calculate mean - normally distributed
- sample from all possible X
- Measure shape of distributions
	- Mean is top of curve
- shape = how wide or skinny distribution is
- normal distribution:
	- know that we calculate a mean when we assume that the population we're interested in is normally distributed
		- but that mean is itself a random variable drawn from its own different normal distribution, which is a distribution of all possible means
- how do we measure the shape of these distributions
- mean is just the location
	- where on the number line is the top of the hump of the normal distribution
	- shape is how wide or skinny is that normal distribution is
- predict the future:

### Learning Objectives

- Answer the question: What controls the shape of the normal distribution?
	- σ
- Apply this shape parameter to the central limit theorem
	- Standard error
- Introduce degrees of freedom

### Example

- How can we predict future fruit yields?
	- Data from 10 individual plants
	- Yield of fruit mass in grams
	- What will our next yield be?
- *Ȳ*
	- mean
		- no repeated value for mode
		- mean is best guess
		- prediction of whole population
		- next year we are going to again randomly sample from the population of all possible fruit masses from these trees
		- want to predict y variable in stats
		- best guess:
			- most likely for next year's fruits
				- mean of Y
				- distance from actual observation
				- how bad of a predictor is the mean
				- take each observation, for each, calculate how far away from mean (expectation)
					- sum the deviations
					- useless number because would become zero

#### How bad is our prediction?

$$ Y_i - \bar{Y} $$
- **Observation** - (minus) **Mean**
- ##### **Sum of Deviations**:

> [!theorem] Sum of Deviations
> $$
> \sum(Y_i - \bar{Y}) = 0
> $$

- absolute values, you're just going to end up == 0
- middle of density of distribution
- mean is in the middle
- length of arrows pointing down == length of arrows pointing up
- def of mean: 
	- values smaller contribute negative
	- values bigger contribute positive
	- mean is middle of values
	- calculate mean of those lengths == 0
		- centering data on the mean
- values smaller and larger than it
- centering data
- become 0 if use sum
- square it instead
	- negative numbers become positive etc
		- pos number stay positive
	- total squared distance points are away from the mean
		- but dependent on number of dots
		- more trees = greater squared distances from the mean will become
		- any dot added can only contribute positively to this mean value
			- number changes when increase sampling
		- instead calculate the variance
	- variance:
		- whats the **average** distance a point is away from the mean
		- like average:
			- adding numbers divided by number of observations minus 1
	- average:
		- numerator = sum of data == same
			- sum of observations or how far observations are away from the mean
		- n is the degrees of freedom
			- `n-1` here

- ##### **Sum of Squared Deviations**:

> [!Theorem] Sum of Squared Deviations
> $$
> \sum(Y_i - \bar{Y})^2 \neq 0
> $$

###### **Calculations:**
1. (17.7 - 18.45)²
2. (18.7 - 18.45)²
3. (17.2 - 18.45)²
4. (20.1 - 18.45)²
5. (19.1 - 18.45)²
6. (17.7 - 18.45)²
7. (18.9 - 18.45)²
8. (19.8 - 18.45)²
9. (15.8 - 18.45)²
10. (19.5 - 18.45)²
**Final Result:**
- Sum of Squared Deviations = 16.045

- calculate variance
- because change sample size otherwise
- average from mean
- divide by number of observations minus 1
- degrees of freedom minus 1
- any time calculate average:
	- sum of observations over the **degrees of freedom**
		- $DF = (n-1)$
		- denominator is how many random numbers are in set
		- average over degrees of freedom
		- degrees of freedom = $n - 1$

- **On average, How far away is each datum from the mean?**

> [!Definition] Variance
> $$
> \text{Variance} = \frac{\sum(Y_i - \bar{Y})^2}{n-1}
> $$

- **Variance** = (*Sum of Squares*/*Degrees of Freedom)*
###### Variance Image

![[variance.png]]

### Degrees of Freedom

#### What are degrees of freedom?

##### Definition

> [!Definition] Degrees of Freedom
> - **The maximum number of data that can vary without changing the final calculation**
> 	- number of random variables that can change in sample

##### Examples

###### Non-Numeric

- Lets start with a non-numeric example:
	- If you are going to mix two colors of paint together in a new bucket to make green paint, you have to pour one color in, then the other.
	- Before you begin, the empty bucket has one degree of freedom, because either color is free to be poured into the bucket without influencing the final color.
		- random chance of which is being poured in first
			- 50-50 blue/yellow poured in first
			- after no choices left
				- bucket must end green
				- if know end state, and blue poured first
				- don't need to tell the rest that happened
				- can already deduce yellow will go next
	- But once we choose the first color, the only way to make green is to add the other color. It is locked in.
		- There is no longer a choice. The bucket now has 0 degrees of freedom
			- you already know the ending
			- not random any more
###### Buckets Image

![[buckets.png]]

###### Numeric Example

- Now lets look at a numeric example.
- These fruit mass data 
	- n = 10
	- µ = 18.45
		- Imagine randomly sampling from the normal distribution these data were drawn from 
			- (We pick 10 fruits again).
				- know the mean of Y bar (Ȳ), know ten samples
				- first addition to graph could be anywhere:
					- $(\infty, -\infty)$
				- 1-9 could be any value
				- since know system had 10 observations w specific mean
				- tenth value if fixed, has to be there
				- not random, forced into it by first 9 random values
				- when calculating arithmetic mean, estimate of parameter µ (Mu)
					- sum of data divided by n
					- because don't know anything about system
					- trying to figure out end color of bucket
					- every sample taken is a random variable
					- free parameter, allowed to exist as any number in the universe until you sample it and look at it -- until measurement
					- every value is a degree of freedom
					- but when you have Ȳ fixed piece of info
						- in the numerator
					- don't actually have ten free choices
						- only have 9
					- how many truly random numbers are in the set
						- denominator for any average we are taking
		- If the mean of the dataset must equal 18.45 and we plan to sample 10 fruits, how many degrees of freedom do we have?
	- We need the mean of the dataset to calculate the variance.
		- What are the degrees of freedom in this dataset when we are trying to calculate the variance?
-  See [[variance.png]]
	- sigma is parameter
	- Standard Deviation
	- population has mew and sigma
		- σ and µ
		- population and shape
		- two parameters that explain the normal distribution
	- if interested in calculating variance:
		- average squared distance that a free parameter is from the mean
			- n-1
	- number is weird
		- variance was squared
		- we square root it

#### Variance vs. StDev

- **On average, How far away is each datum from the mean?**

> [!Definition] Variance
> $$
> \text{Variance} = \frac{\sum(Y_i - \bar{Y})^2}{n-1}
> $$

- **Variance** = (*Sum of Squares*/*Degrees of Freedom)*
- But there is one little problem with variance…
	- Sum of **Squares**
		- $$x^2$$
	- So instead, we use the **standard deviation**:

> [!Definition] Standard Deviation
> $$
> \text{Standard Deviation} = \sqrt{\frac{\sum(Y_i - \bar{Y})^2}{n-1}}
> $$

- estimate of sigma == square root of variance
	- standard deviation of Y
	- S or σ
		- exists in population
	- Mu (µ) & Sigma (σ)
		- parameter and shape
	- true normal distribution that can explain our population of interest
		- defined with Mu and Sigma
		- estimate X bar and StDev of X
			- greek letters for parameters
			- Arabic letters for statistics

### The Parameters of the Normal Distribution

##### Mean
- Mean = µ
- The center of the data, where the highest frequency occurs
	- prediction of the future if data are normally distributed
	- most likely outcome to happen next
- Location Parameter
	- Where is the distribution located on a number line?
##### StDev
- Standard Deviation = σ
- The average distance a sampled datum is from the mean
- Shape parameter
	- How wide or skinny our normal distribution is

### Notes

- predict the shape parameter of the central limit theorem
	- hint on average how far away our experiment is from the truth
- **definitions**:
	- sigma estimates how far away a value is from the mean
	- Mu parameter is universal truth
	- our mean from our experiment is a random sample from the central limit theorem
	- if we know sigma of CLT, we know on average how far away our experiment is from the truth
- one experiment is random value in distribution
	- unless repeated infinite times, never know true location of middle of distribution
	- but estimate shape parameter of distribution
	- on average how far away from the truth
	- that distance is called the confidence interval
- predict how far away estimate is from truth/mean/
- σ = How far away a value is from the mean µ
- µ Central Limit Theorem == Universal Truth
- X̄<sub>exp</sub> = Random Sample from CLT

- x from experiment is random location in curve
- but if estimate shape parameter of distribution
	- estimate how far away on average from the truth
		- == **Confidence Interval**
- normal distribution of mean of x
- StDev sigma of x
- distributions are statements of probability
	- how likely is it that a given event might occur
	- if data are normally distributed:
		- greater likelihood of events near the middle occurring
		- very low likelihood of events of edges happening
- Curve X̄, S<sub>x</sub> sigma distance from middle/mean

- stats q:
	- if travel one standard deviation in either direction from mean
	- what proportion of the total area under curve is swept away by being +/-1 standard deviation from the mean
	- /how far away is proportion of curve swept away plus or minus 1
		- 68.28% (68.3 or 68%)
	- if travel two standard deviations, how much area 
		- 95%
	- three standard deviations
		- 99.7%
	- five stdev
		- higgs boson particle
		- 5 sigma certainty
		- different fields have different levels of expectation for extreme values
			- 3 -25 / +25 3
- model wrong/broken
	- µ = X̄
		- null hypothesis (testing)
		- if out of curve, not =
		- $µ \neq X̄$
- start w assumption of population that can be measured with numbers
- create experiment, sub-sample from population
- w number, due to CLT:
	- how likely number meets null expectation
	- or was expectation deductively wrong
		- scientific method mathematically
		- make good questions/guesses

---

Previous: [BILD 5 Lecture 7](BILD_5_LE_7.md).
Next: [BILD 5 Lecture 9](BILD_5_LE_9.md).