---
course: BILD 5
type: lecture
lecture_num: 5
date: 1/15
---

# BILD 5 Lecture 5
- ## 1/15

## Exploratory Data Visualization

### R Demonstration

#### Code

```r
#Continuous
dat <- c(2,3.3,1000,0.02)


#Count

Num_of_birds <- c(1,5,12,15,0)
int_num_of_birds <- as.integer(Num_of_birds)


#Ordinal
temps<-c("low","med","high")
ordertemps<-factor(temps,ordered = TRUE,levels = c("low","med","high"))

#Binomial
color<-c("red","orange")
logicol<-color=="red"

#Categorical

sandwich <- c("BLT","Grilled Cheese", "Hot Dog?")
```

#### Environment

```r
Values

color
chr [1:2] "red" "orange"
dat
num [1:4] 2 3.3 1000 0.02
int_num_of_birds
int [1:5] 1 5 12 15 0
logicol
logi [1:2] TRUE FALSE
Num_of_birds
num [1:5] 1 5 12 15 0
ordertemps
Ord. factor w/ 3 levels "low"<"med"<"high": 1 2 3
sandwich
chr [1:3] "BLT" "Grilled Cheese" "Hot Dog?"
temps
chr [1:3] "low" "med" "high"
```


### Types of Data
#### Example:
- Classify each column

| Species | Height (m) | Number of nests |
|---------|------------|----------------|
| *P. angustifolia* | 12 | 0 |
| *P. angustifolia* | 9 | 1 |
| *P. angustifolia* | 18 | 1 |
| *P. fremontii* | 22 | 0 |
| *P. fremontii* | 17 | 1 |
| *P. trichocarpa* | 24 | 2 |
| *P. trichocarpa* | 30 | 0 |
- Column 1:
	- **Categorical**
		- All models wrong - closely related
			- Technically true
		- But we do have hierarchy
			- Phylogenetic tree 
			- Evolutionary biology
		- Distance between categories are **different**
			- *Ordinal*
		- if knew average genome types
			- could be continuous
			- evolutionary history
				- nucleotides, etc.
- Column 2:
	- **Continuous**
		- better tools - precision
		- don't let units determine type of data
		- scale run out of sig figs
- Column 3:
	- **Count**
- Question: if you categorized the data type differently, like ordinal or count instead of categorical or continuous, would you graph the data differently in formats like a tree, pie, line or bar differently depending on the type?
#### Binary Data

- Binary data can look like a lot of different things!
	- We have to ask ourselves: 
		- When the data were collected, were only two outcomes possible?
- binomial data that has been summarized
	- looks like continuous and count
	- summaries about true binomial data

| Coin Flips | Proportion of "Heads" in 10 flips | Number of "Heads" in 10 flips |
| ---------- | --------------------------------- | ----------------------------- |
| Head       | 0.4                               | 4                             |
| Tail       | 0.7                               | 7                             |
| Tail       | 0.2                               | 2                             |
| Head       | 0.8                               | 8                             |
| Tail       | 0.4                               | 4                             |
| Tail       | 0.5                               | 5                             |
| Tail       | 0.3                               | 3                             |
### Why do we Visualize Data?

- Lets say you are working as a statistical consultant for a company, and they send you some data and ask for a summary and correlation
	- continuous data

| x         | y        |
| --------- | -------- |
| 32.331111 | 61.41110 |
| 53.42146  | 26.18688 |
| 63.92020  | 30.83219 |
| 70.28951  | 82.53365 |
| 34.11883  | 45.73455 |
| 67.67072  | 37.11095 |
| 53.25913  | 97.47577 |
| 63.51498  | 25.10008 |
| 67.98054  | 80.95717 |
| 67.37247  | 29.72040 |
| 15.56075  | 80.06564 |
| 71.79077  | 71.06547 |

- You run some summary statistics and report back the following:
	- Sample Size: 142
	- Mean of X: 54.26
		- Standard deviation of X: 16.77
	- Mean of Y: 47.83
	- Standard deviation of Y: 26.94
	- Correlation of -0.064 (p=0.44)
- Your work is great! They ask for another project and send you the following data.

| x       | y       |
| ------- | ------- |
| 55.3846 | 97.1795 |
| 51.5385 | 96.0256 |
| 46.1538 | 94.4872 |
| 42.8205 | 91.4103 |
| 40.7692 | 88.3333 |
| 38.7179 | 84.8718 |
| 35.6410 | 79.8718 |
| 33.0769 | 77.5641 |
| 28.9744 | 74.4872 |
| 26.1538 | 71.4103 |
| 23.0769 | 66.4103 |
| 22.3077 | 61.7949 |
- You run some summary statistics and report back the following:
	- Sample Size: 142
	- Mean of X: 54.26
		- Standard deviation of X: 16.77
	- Mean of Y: 47.83
		- Standard deviation of Y: 26.94
	- Correlation of -0.064 (p=0.44)
- Our two projects have the same statistics!
	- Sample Size: 142
	- Mean of X: 54.26
		- Standard deviation of X: 16.77
	- Mean of Y: 47.83
		- Standard deviation of Y: 26.94
	- Correlation of -0.064 (p=0.44)
- **datasauRus** package in R
	- don't tell stories with numbers well
	- check for dinosaur in data
	- visualize not just numbers
	- don't mean anything
	- patterns if tools break:
		- scatterplot diaganol
		- cone shape
	- need true random data

**Why do we visualize data?**
- Demonstrate patterns that the numbers alone may hide

![[datasauRus.png]]

### What makes a good figure?

- There are a number of conventions that help scientists.
	- Axis position and placement
	- Data priority and placement
	- Plot geometry and style
	- Color, shape and legibility
	- Format:
		- In a publication, titles are often omitted and information is put in a caption and in the text.
		- In a presentation, information is normally included in the figure.

- what you put on an axis changes story
- how much information you display changes
- show all information you have
- don't remove outliers
- plot geometry
	- line vs scatter plot
- add trendline
	- positive relationship
- this is too much in pub:
	- (fine for presentation)

![[goodFigure.png]]

#### Are tables figures?

- Often, all we want to do with a figure is visualize the distribution of a data set.

| Hospital                     | Operations | Survivors | Deaths | SurvivalRate |
| ---------------------------- | ---------- | --------- | ------ | ------------ |
| London - Harley Street       | 418        | 413       | 5      | 0.988038     |
| Leicester                    | 607        | 593       | 14     | 0.976936     |
| Newcastle                    | 668        | 653       | 15     | 0.977545     |
| Glasgow                      | 760        | 733       | 27     | 0.964474     |
| Southampton                  | 829        | 815       | 14     | 0.983112     |
| Bristol                      | 835        | 821       | 14     | 0.983234     |
| Dublin                       | 983        | 960       | 23     | 0.976602     |
| Leeds                        | 1038       | 1016      | 22     | 0.978805     |
| London - Brompton            | 1094       | 1075      | 19     | 0.982633     |
| Liverpool                    | 1132       | 1112      | 20     | 0.982332     |
| London - Evelina             | 1220       | 1185      | 35     | 0.971311     |
| Birmingham                   | 1457       | 1421      | 36     | 0.975292     |
| London - Great Ormond Street | 1892       | 1873      | 19     | 0.989958     |
#### The problem with pie

- Which hospital had more operations?
	- A: Glasgow
	- B: Bristol
- Pie chart vs. Bar chart
	- Pie charts don't give useful information

![[pieProblem.png]]


---

Previous: [BILD 5 Lecture 4](BILD_5_LE_4.md).
Next: [BILD 5 Lecture 6](BILD_5_LE_6.md).