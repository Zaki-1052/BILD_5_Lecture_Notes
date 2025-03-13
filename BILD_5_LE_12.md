---
course: BILD 5
type: lecture
lecture_num: 12
date: 2/3
---

# BILD 5 Lecture 12
- ## 2/3
	- ## Experimental Design

## Observation vs. Manipulation

### Test

#### Code

```r
#### Test for normality
Dat<-rnorm(n=30,mean=3,sd=2)
hist(Dat)
ks.test(x=Dat,y=pnorm,mean(Dat),sd(Dat))
	Exact one-sample Kolmogorov-Smirnov test

data:  Dat
D = 0.091076, p-value = 0.9454
alternative hypothesis: two-sided
```

#### Image

![[histogramDat.png]]

#### Question:

- Are 'Dat' normally distributed?
	- Yes?

### Learning Objectives

- Learning Objectives
	- experimentation itself is imperfect
		- can never understand the entire universe 
			- because we can't sample it
		- even with subsampling, not perfect model
- Identify the sources of error that come from our experimental design
	- experiment isn't truly random variables drawn from a distribution
		- not honest -- 
		- **bias** and **error**
			- from choices
			- can't fix
				- so know where they come from
- Define pseudo-replication
	- how many truly random samples we've taken from the universe
		- examples - 
			- sample size and experimental unit 
- Identify the sample size and experimental unit from an experimental design

### Experimentation

#### So you have a hypothesis:
- So you have a hypothesis…
	- Lecture:
		- null and alternate statement
			- contained all information about that hypothesis
		- model that variation in nature
		- $H_0 \cdot μ = 2$
		- $H_A \cdot μ \neq 2$
		- P(Data|H<sub>0</sub>)
	- There is variation in nature
		- You want to model that variation to better explain and predict the universe 
			- (some small part of it anyway)
		- You will *need data to inform your model*
			- test null hypothesis w observations
				- test with p-value
					- probability of our data given the null hypothesis
						- need data/info about universe
	- Types of experiments:
		- Natural (Observational)
			- easier to do
			- cheaper
			- just observe
		- Manipulative
			- control variables
			- tell us more about the universe
			- more money

#### Natural Experiments

- Utilize natural phenomenon to observe variation
- Find a gradient, pattern, difference in nature
	- finding differences in nature and proposing null hypotheses against those differences 
- Observe without interfering
- Static (snapshot) vs. longitudinal (trajectory)
	- static: make the observation once
		- how many *today*
	- **longitudinal**:
		- common in *natural experiments*
		- because things change
			- observe over a longer period of time

#### Manipulative Experiments

- Control or modify some factor in the study
	- or both control and modify
	- changing something
	- manipulating the universe
	- **not** about field/lab
- Field vs. Lab
- *in vivo* vs *in vitro*
- Static (snapshot) vs. longitudinal (trajectory)
	- design choice
	- more static experiments
	- can still do others
- Press vs Pulse
	- press (pressure)
		- continuously happening
		- fertilize every season/month
			- longevity
	- pulse
		- single moment where manipulation was done
			- and that manipulation deteriorated over time
		- drug trials, etc
	- comparison:
		- does the event that manipulates the universe happen once
		- or is it something that's continuously happening to participants in our design

### Question

#### What would you do?

- Research Question: 
	- Incorrect:
		- **How** will rising temperatures influence soil carbon storage under Pacific coastal pines (*Pinus contorta*)?
			- how is inductive
				- not deductive
	- Correct:
		- **Will** rising temperatures modify the amount of soil carbon storage under Pacific coastal pines (*Pinus contorta*)?
- Questions:
	- What is the null and alternate hypothesis for this research question?
		- **Null**: 
			- Rising temperatures will **not** modify the amount of soil carbon storage...
				- The carbon storage at temperature one will be equal to the carbon storage at temperature two.
					- H<sub>0</sub>: C<sub>s</sub>T1 = C<sub>s</sub>T2
			- Carbon storage at temperature one will not be equal to carbon storage at temperature two.
				- $H_A: C_s{T1} \neq C_s{T2}$
			- Time and carbon storage continuous
				- slope of graph will be equal to 0
					- or not equal to zero
	- Would you use a **natural** or manipulative experiment to test this question? 
		- What would it look like?
			- natural- save money
				- tradeoffs
				- good reasons to manipulate
				- money main reason for natural
				- maybe measure variables

### Bias

- ##### **Goals of a good experiment**
	- Eliminate bias
	- Reduce error
	- Appropriate experimental unit
	- Balanced design
- ##### **Why do we care about bias?**
	- There is variation in nature
		- standard variation of dataset
			- estimate variation correctly
			- standing genetic variation on which selection can apply
	- **Variation** ~ Model + Error
		- How much variation is our model capturing?
			- *choices*
		- Model = Our understanding of the system
			- Slope
			- Difference of means
			- The shape of the data
		- Error = random chance + **bias**
		- Observation ~ Model + random chance + **bias**
			- If we eliminate bias:
				- we can quantify exactly how much of the total variation our model is explaining

#### How do we eliminate bias?

- Bias happens when something in our experimental design favors some data and not others
	- ex: ruler stops at 10, tall tree is 12
	- weaker measurements on one scale
1. Simultaneous Control groups
	- A control group receives all treatment except the manipulation
	- Helps us identify the exact influence of the treatment
		- only remaining variation must be due to what we did
2. Random assignment
	- Assignment into the treatment or control group must be random and equal!
	- Sample size is determined by the smallest group in your design
3. Blind (Hide Information)
	- Scientists and participants should not be able to identify which group an individual is in
- Observation ~ Model + random chance + **bias ↓**

### Error

#### How can we minimize random error?

- Observation ~ Model + **random chance** + bias
- Replication
	- As sample size (n) increases, standard error decreases
		- only flip a coin twice, no meaningful data
		- 2 heads/tails is normal
		- roll a loaded die once
		- need more signal (n)
	- The Law of Large Numbers!
- Independence
	- Each sample should be independent from all others
	- Avoid Pseudo-replication

### Pseudo-Replication

- ##### **What is pseudo-replication?**
- Treating non-independent observations as if they were statistically independent.
	- creating pseudo-replicants
	- coffee-drinking model
	- not random samples
	- model is about ucsd
	- sub sample isn't random
	- only from bild 5
	- don't have 300 random samples from university
	- model for UCSD
	- measure BILD 5
	- don't actually have 300 random independent variables
- The Experimental Unit: 
	- The independent unit to which treatments are assigned.

#### Examples
##### Example 1
- **What is pseudo-replication?**
	- You want to know the effect of a new fertilizer on crop yield. 
	- You find 5 farmers who are willing to loan you use of some of their land to test the experiment. 
		- You design the following:
###### Image

![[cropLand.png]]

###### Questions
- What is the sample size?
	- true random variables in our study
	- **5**
		- 5 fields
		- each farmer gave 4 subplots within land
			- same irrigation schedule, etc in a field
		- each field is independent
		- 5 classrooms
	- predict treatment group based on other in same field
	- but cannot do the same thing for across different fields
	- can't be ten, not all random samples from a similar pop
	- don't have 300 samples of students from bild 5
	- final: 
		- what is the sample size of the experiment?
- What is the experimental unit?
##### Example 2
- **What is pseudo-replication?**
	- **Experiment**:
		- To determine the side effect of a drug, 40 participants were first split into treatment and control groups. 
		- They were given a full battery of bloodwork tests at the beginning of the study and then asked to come back each week for 6 weeks, totaling 240 blood tests.
	- Questions:
		- What is the sample size in this experiment?
			- **40**
				- unit of replication: patient
			- increase scope of experiment:
				- increase number of experiments
			- group vs sample size
				- group size = 20
				- sample size = 40
					- number of randomly assigned participants
		- What is the experimental unit?
			- participant
				- randomly assigned to each group
##### Example 2
- **What is pseudo-replication?**
	- **Experiment**:
		- To determine how elevation influences the presence of Anise Swallowtail butterflies (a common butterfly in the western United States), you set up 10 elevation transects on Mount Tamalpais (Marin County, CA). 
			- Along each elevation transect you identify 10 ideal locations to observe butterfly density, giving you 100 total sample sites.
		- Questions:
			- What is the sample size in this experiment?
				- ~~10~~
				- **1**
			- What is the experimental unit?
				- ~~each transect~~
				- **mountain**
		- notes:
			- not 100 individual sites
				- would be pseudo-replication
			- 10 transects:
				- different sites
					- block or field
			- wrong:
				- each elevation is like group (treatment)
				- transect is the replicate
			- correct:
				- sample size: **1**
			- all still the same mountain
				- most common pseudo-replication error
			- if research question was specific to mountain
				- 10 transects would be correct
			- but because general behavior:
				- needs to say something about the range
				- might be different on different mountains
			- question:
				- what is the universe that RQ is questioning
					- what is field/unit of replication in that universe
			- different effects on different mountains
			- think about overall scope of question
				- #TODO: experiment: check what llms say
			- only sampled one thing about universe
				- if you're testing on mice, inductive
					- not necessarily applied to humans

#### Common Experimental Designs

- ##### Blocked Experiment:
	- Multiple treatments happen in each experimental unit
	- Common in expensive, large scale manipulation experiments
	- Common in Natural experiments
- ##### Nested Experiment:
	- Each experimental unit holds one treatment group
	- Common in natural experiments
- ##### Paired Experiment:
	- Each experimental unit contains one of each treatment
	- Powerful way to determine the amount of variation the model predicts
	- Ideal design for small manipulation studies
		- ( #TODO: watch lecture vid for paired notes)
##### Images

###### Blocked Experiment

![[blockedExperiment.png]]

###### Nested Experiment

![[nestedExperiment.png]]

###### Paired Experiment

![[pairedExperiment.png]]


### Notes
- misidentifying experimental design
	- pseudo-replication
- common to lie with statistics
- **Blocked Exp**:
	- more than one mountain
	- Have specific fields/sites/locations that we have to sub-sample within
		- not just treatment and control
		- measure 20 different types of fertilizer in each block
	- block is replicated, moved around
		- site to to site similarly
		- multiple treatments happen
			- pea fog experiments
			- blocking within genotypes etc
	- common in:
		- expensive large scale manipulations
- **Nested Exp**:
	- when each experimental unit holds one or more treatment groups
	- example:
		- Mount Tam 
	- experimental things measured 
		- all nested in one sample
		- genotype variation
	- common in:
		- natural experiments
			- don't get the chance to manipulate things
			- each has its own distinct condition
			- measuring that condition multiple times 
			- impossible to measure the whole mountain simultaneously
				- Mount Tam
- **Paired Exp**:
	- where each experimental unit contains one of each
		- the treatment and the control
			- group one and group two
	- powerful way to determine the amount of variation a model predicts
		- bc don't have to actually average all of our control conditions and all of our treatment conditions
	- paired = simplified blocked experiment
	- specifically:
		- can ask for the difference within each of our experimental units
			- that difference is the only thing that we care about
	- examples:
		- common in organismal studies
		- humans (medicine)
			- hand cream - rash
				- create control without active ingredient
			- each one arm for each ingredient
		- enormous variation in how humans are responding to both treatment and control
		- paired accounts for this because don't care about total size
			- instead care about difference between treatment and control
		- if on average difference is big/small:
			- active ingredient is working in one of two directions
		- split experimental unit into fairly into two groups
			- treatment and control groups
		- pair design

---

Previous: [BILD 5 Lecture 11](BILD_5_LE_11.md).
Next: [BILD 5 Lecture 13](BILD_5_LE_13.md).
