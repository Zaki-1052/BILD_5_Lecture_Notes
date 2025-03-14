---
course: BILD 5
type: lecture
lecture_num: 28
date: 3/14
---

# BILD 5 Lecture 28
- ## 3/14
## Bayesian Analysis
## Modifying our models to challenge our bias:
### The dirty history of statistics and a better way forward
- **Statistics textbooks love this guy**
- Sir Ronald Aylmer Fisher
	- “the father of statistics”
	- Null Hypothesis testing
	- ANOVA 
	- z- Distribution
	- F- Distribution
	- r-z Transformation
	- Maximum Likelihood
	- Random effects
	- Modern experimental design
	- Modern synthesis
	- Sexual selection
- **But…**
- **Sir Ronald Aylmer Fisher**
	- Eugenicist
	- Founding chairman of the University of Cambridge Eugenics Society
	- Wrote and edited for *The Eugenics Review*
	- Supported Nazi scientists before and after WWII
	- Used his statistical techniques to show tautological correlations between class and “civility”
> [!quote] Sir Ronald Aylmer Fisher
> “I have no doubt also that the [Nazi] Party sincerely wished to benefit the German racial stock, especially by the elimination of manifest defectives, such as those deficient mentally, and I do not doubt that von Verschuer gave, as I should have done, his support to such a movement.”
- **Fisher was trapped in his biases, despite inventing the tools to remove them**
- Fisher, and many others of his colleagues saw statistics as a way to examine the unknown, not challenge what was already “known”
- But our job is not to examine the unknown, but to question our current models of the universe
### Testing the Null Hypothesis
- The Null hypothesis is what we test in classical statistics
- It is a statement that we know nothing about the system
- There is no way in this system to incorporate an uncertainty about the null state
### Bayesian Analysis
- **Bayesian Analysis is about modifying your current belief**
- Before you do an experiment, you have some understanding about the universe!
	- We don’t live in a vacuum
		- NOT $H_o = t = 0$
		- Believe there are differences
		- Not a single number
			- Change the shape of understanding
			- Range of uncertainty
				- Test with an experiment
			- How strong is the data?
		- Properly weight the amount of evidence that will change our mind
![[bayesianAnalysis.png]]
#### Sheep Speaking Shakespeare
- You have some underlying idea about how likely it is that a sheep can recite all of sonnet 17 
	- (Who would believe my verse in time to come?)
- You can probably draw what that probability is:
- Your “trustworthy” friend swears they saw it happen one time at like burning man or something, dude. 
	- How does your probability estimate change?
- What if multiple independent news outlets cover the story with video evidence and sworn testimony and you look at a calendar and it isn’t April 1st?
![[posteriorUnderstanding.png]]
- ALL scientific facts can change
### Modifying our Prior understanding
- #### Bayes Theorem
$$P(A|B) = \frac{P(A) \times P(B|A)}{P(B)}$$
#### Let’s look at a simple example of Bayesian thinking
- A mammogram has an 80% chance to detect cancer when present and an 9.6% chance to detect cancer when cancer is not present.
- What do you tell a woman who gets a positive mammogram?
$$P(\text{Cancer}|M+)=\frac{P(C) \times P(M+|C)}{P(M+)}$$
- Cancer rate for women of 40 is 1%
	- $P(C)=0.01$
$$\frac{0.01 \times 0.80}{(0.01 \times 0.8)+(0.99 \times 0.096)} = 0.07763975155 = 7.76\% $$
- Probability of a positive mammogram:
	- top plus false positive
#### Your responsibility
- Our job as scientists is to question our beliefs and modify our models of the universe with incoming data
- Statistics can be a powerful tool for the liar, and the cheat
- You now have enough understanding of statistics to be dangerous
##### Use your new found power well.

---

Previous: [BILD 5 Lecture 27](BILD_5_LE_27.md).
Next: [BILD 5 Lecture 29](BILD_5_LE_29.md).