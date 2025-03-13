---
course: BILD 5
type: lecture
lecture_num: 4
date: 1/13
---

# BILD 5 Lecture 4
- ## 1/13
	- ## Types of Data

## Learning Objectives

- What are data and how do we organize it all?
	- **Tidytable**
- 5 common data types
- Matching distributions to data 
	- (This is an objective for the whole week)
- Binomial, Uniform, Poisson

### What is a data?

- A datum (singular of data) is a piece of information
- Data is an organized set of pieces of information

## Data Tables

1. Each variable forms a column
	- property/datum
		- color/length
2. Each observation forms a row
	- each instance of subject
	- if observing animal
		- each row is a different animal
3. Each type of observational unit forms a table.

![[tidyData.png]]

## TidyVerse

### Rows

- Each row is an observation.
- Check all of the following items that are TRUE when each row is an observation.
	- The number of rows in the table will often be your sample size.
	- It is the shortest, most compact way of writing data.
	- Adding individual rows doesn’t add variables to the data set.
		- now more individuals to measure

### Columns

- Each column is a variable.
- Check all of the following items that are TRUE when each column is variable.
	- Finding measures like the mean only require comparing values within a single column.
	- Finding measures like correlation only require comparing values between different columns.
	- Adding individual columns makes it easy to add variables to your data set.

### Tables

- Avoid Subtitles of columns or rows
	- Avoid merging cells
		- don't add labels to tables
		- keep them tidy
		- no extra row on top/side
##### Variables
| ID  | Color* | Length (cm) | Mass (g) |
| --- | ------ | ----------- | -------- |
| A   | red    | 2.2         | 51       |
| B   | red    | 3.6         | 70       |
| C   | green  | 3.3         | 66       |
| D   | yellow | 2.8         | 55       |
| E   | yellow | 3.0         | 68       |
##### Template
| Identification | Color | Length | Mass |
|----------------|-------|---------|------|
| A              |       |         |      |
| B              |       |         |      |
| C              |       |         |      |
| D              |       |         |      |
| E              |       |         |      |
- *If you are collecting simple color data, look up the colors recognized in R to save time later!*

## Data Types

### Numeric
#### Continuous
- Any number on a number line between two points could be a reasonable value
	- number line
	- decimal point
###### Example
- dna methylation levels
- mass
- height
- time
- population / area
#### Count
- Any whole number (integer) between 0 and ∞
	- number of animals in ecosystem
###### Example
- number of base pairs
- \# of days - cal
- \# of rhinos
- sample size
- colony forming units

### Non-Numeric
#### Ordinal
- Ranked categories.
###### Example
- animals in an ecosystem food chain
	- categories = predator/prey etc 
		- ranked by number
- seasons
- how close to extinction
- cancer stage
- phylogeny (species)
- scale (5 options)
#### Binomial
- Only two outcomes
###### Example
- presence of dna mutation on genome or not
- time *limit*
- presence or absence of (\+\/\-)
- left/right
- bio sex/gamete size
- acid/base
- extinct/not extinct
#### Categorical
- Unordered with more than two outcomes
###### Example
- hair/eye/skin color
	- physical characteristic
- genotypes
- ~~species~~
- cell types
- genotypes

### Examples
- Measure with each category of data

---

Previous: [BILD 5 Lecture 3](BILD_5_LE_3.md).
Next: [BILD 5 Lecture 5](BILD_5_LE_5.md).