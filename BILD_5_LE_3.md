---
course: BILD 5
type: lecture
lecture_num: 3
date: 1/10
---

# BILD 5 Lecture 3
- ## 1/10

## Why Statistics?

- Error exists because we cannot sample everything in the universe
	- Statistics needed
	- Artificially small systems - can measure
- The probability a lecture attendee drank coffee this morning:
	- P = (Number of Attendees who drank coffee / number of total lecture attendees)
$$
P = x/n
$$
- Binary Data
	- Did or Did Not drink coffee
- `P` = probability of an event occurring
- `Q` = Probability of an event not occurring
- $P + Q = 1$
	- P = 0.1
	- Q = 1 - P
-  Binomial distribution in R
	- How useful of a model?
	- Predict the Future

## Parameter vs. Statistic

- ##### **Parameter**:
	- Universal truth
	- Unknowable in large systems
	- Perfect Census
- ##### **Statistic**:
	- Estimate of a parameter
	- Found through subsampling
	- Error of the estimate based on the number of samples and how they were collected
		- Close to the truth/parameter
		- How far away on binomial distribution
			- Collect enough good samples
			- Likelihood of truth increases
			- Shape of sampling distribution
				- All possible outcomes
			- Changes based on methodology
				- Curve becomes different

### Comparison Table

| Parameter                                               | Statistic                                        |
| ------------------------------------------------------- | ------------------------------------------------ |
| - `𝜇` = Location parameter of the normal distribution  | - `𝑥` = Arithmetic mean (average)               |
| - `𝜌` = Pearson product-moment correlation coefficient | - `r` = Correlation (how things change together) |
| - `𝛽` = Standard coefficients of linear models         | - `b` = Parts of a line (Y = **m**X + **b**)     |

#### Parameter
- `𝜇` = Location parameter of the normal distribution
- `𝜌` = Pearson product-moment correlation coefficient
- `𝛽` = Standard coefficients of linear models

#### Statistic
- `𝑥` = Arithmetic mean (average)
- `r` = Correlation (how things change together)
- `b` = Parts of a line (Y = **m**X + **b**)

Statisticians try to get the best estimate they can for the parameter they are interested in.

## Predictions

### Uncertainty

- When predicting future events, there is uncertainty
	- *Parameter* vs. *Statistic*
- In this lecture class we can know the true probability that a randomly sampled one of us had coffee this morning…
	- But we can only guess at the probability a randomly sampled one of us will have coffee tomorrow.

### Patterns

- Having complete data isn’t the end:
	- Finding patterns in data

#### Example:

Let us examine the state by state rate (number of cases/100000) of breast cancer in women above 65

- Highest rates in:
	- Rhode Island (504/100000), Hawaii, Nebraska
- Lowest rates in:
	- Nevada (360 cases/100000), New Mexico, Alaska
- USA average is 426.9/100000
- Why?
	- Why does Rhode Island have a dramatically higher cancer rate?
	- Why does Nevada have a dramatically lower cancer rate?

### The Law of Large Numbers

- **Finding *false* patterns in Data:**
- The closer sampling gets to a census, the more likely it is our statistic = parameter
- The average from multiple trials should approach the parameter
- Only true if sampling is random


---

Previous: [BILD 5 Lecture 2](BILD_5_LE_2.md)
Next: [BILD 5 Lecture 4](BILD_5_LE_4.md)