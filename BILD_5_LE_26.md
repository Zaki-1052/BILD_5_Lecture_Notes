---
course: BILD 5
type: lecture
lecture_num: 26
date: 3/10
---

# BILD 5 Lecture 26
- ## 3/10

## Introduction to Multivariate Thinking:
### Categories, Factors, & Ordination: PCA

- DNA --> RNA --> AA (proteins) --> Metabolites
	- shapes that catalyze reactions
		- millions of columns
- Genotype to Phenotype
	- too much data
- wild type and mutant strain
	- x column
- RNA Sequences
	- 10k! columns
### Outline
- Clustering
	- How do we group things if we don’t know what group they belong to?
- Factor analysis
	- Clustering in multiple dimensions
- Ordination
	- Visualizing multivariate space on a 2 dimensional plane.
- **What is the goal of a “good” statistical model?**
	- What do you think?
		- Understand the world with as few inputs as possible
			- R^2 value
			- Biggest fit
				- R^2 = 100% or 1
	- Explain as much variation in the universe as possible
		- 

| Data |
|------|
| 2    |
| 2    |
| 2    |
| 2    |
| 2    |
| 2    |
| 2    |
-->

| Model |
|-------|
| 2     |

| Data |
|------|
| 2    |
| 2    |
| 2    |
| 2    |
| 10   |
| 10   |
| 10   |
-->

| Model |
|-------|
| 5.4   |

| Group 1 | Group 2 |
|---------|---------|
| 2       | 10      |
### Clustering
- How few groups are needed to define a system?
#### Figures
##### Table

| Data |
| ---- |
| 6.1  |
| 3.2  |
| 6.0  |
| 4.1  |
| 5.7  |
| 3.8  |
| 4.5  |
##### Histograms
###### Data 1
![[clusteringDataHistograms.png]]
###### Data 2
- too many
![[clusteringDataHistogram.png]]
#### More Clustering Notes
- What if we wanted to cluster based on more than one variable?
- How many groups would you create?

| Petal length (cm) | Flower color |
|------------------|--------------|
| 4.5              | White        |
| 3.9              | Yellow       |
| 5.0              | White        |
| 1.2              | White        |
| 0.8              | White        |
| 1.1              | Yellow       |
| 0.9              | White        |
- identify how much each of these models capture
	- find R^2 of 
		- 2 split by size/color
			- etc
	- if split too much, R^2 just 1
		- capture everything by individual groups
			- too many t tests
- adjusted: multiply R^2 by penalty value
- Adjusted R Squared value to find best cluster
- Clustering: reduce rows
	- use average values
### Factoring
#### Notes
- Can we represent these data with fewer **columns**?
	- 10k columns
		- chemical metabolites
		- relative abundance
	- want to reduce the total number of columns
- notes:
- two columns of continuous correlated info
- r squared of relationship is 0.9
	- then 90% of variation in columns can be explained by one column
	- so reduce it down to one because only losing 10% of variation
- points have euclidian distance from each other
	- draw tangents with right angels
	- can project best position relative to others
	- that point should be on line of best fit
	- fitted positions on correlation
- relative similarity between points
- instead of x and y
	- relative positions
- correlation best fit line becomes the x axis
	- rotate graph
	- projecting values to be on a new tilt
- measure how far each point is from the origin
	- 1 axis explaining 88% of total variation
		- formerly just 50%
	- distance between dots on correlated line
		- made one column biologically important enough to ignore the other
#### Figures
![[PCABoardGraph.jpg]]
- **R value = 0.9**
##### Factoring Table 1

| Petal length (cm) | Stamen Length (cm) |
|------------------|-------------------|
| 4.5              | 7.4               |
| 3.9              | 6.6               |
| 5.0              | 6.0               |
| 1.2              | 2.5               |
| 0.8              | 2.2               |
| 1.1              | 2.0               |
| 0.9              | 1.9               |
##### Factoring Graph
![[factoringGraphPL.png]]
##### Factoring Table 2

| PCA 1 (88% of total variation) |
|-------------------------------|
| 2.1                           |
| 1                             |
| 2.5                           |
| -0.4                          |
| -2                            |
| -0.7                          |
| -1.5                          |
#### Factoring Notes 2
- This process is called principal component analysis
- The goal is to reduce dimensionality by finding shared patterns in multivariate space.
- The created axis is still: 
	- Independent
	- Normal (as long as the input was)
	- Centered at zero
	- Usable in other statistical models
### Ordination
- The process of visualizing multidimensional data
![[ordinationGraphPC.png]]
- individuals clustering with one another
- hard to see differences in correlation
- in 3D space axes independent
- can see hidden trends
- clustering applied to PC axes
	- how many clusters getting in PCA space
- don't cluster raw data
	- (lecture vid)
#### How much variation can you display in physical dimensions?
- Non-metric vs metric
	- NMDS, PCA
- Unstructured vs structured
	- PCA, RDA
- Number of adjacent matrices

---

Previous: [BILD 5 Lecture 25](BILD_5_LE_25.md).
Next: [BILD 5 Lecture 27](BILD_5_LE_27.md).