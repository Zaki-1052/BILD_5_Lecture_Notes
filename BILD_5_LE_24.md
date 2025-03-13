---
course: BILD 5
type: lecture
lecture_num: 24
date: 3/5
---

# BILD 5 Lecture 24
- ## 3/5

## Linear Modeling Final

### Question

- lm(y~x)
	- y is some function of x
	- examples:
		- anova
			- lizards
	- regression
		- correlation is *not*
	- two-sample t-test:
		- position on y depends on value of x
		- two sample t tests *are* linear models
	- not a linear model:
		- paired t-test
			- delta values are different from 0
			- y isn't some function of x
			- no change in x
			- same as single-sample t-test
- Which of the following tests are not a linear models? 
	- correlation & paired t test

### Steps in performing Linear Modeling

- **Step 1**: Look at the data!
	- make it tidy if needed
	- look at data identities of each column
		- categorical x and continuous y
		- what kind of analysis you would run
- **Step 2**: Propose the correct Null Hypothesis
	- Two-Sample T-Test:
	- H<sub>o</sub>: Mean(group1) = Mean(group2)
	- H<sub>o</sub>: Predicted Y = mean(Y)
		- same null hypotheses
		- because two-sample = linear model
			- not correlation:
				- multiple traits of the same individual rise together
				- correlation is not just related
				- continuous measurements of two variables
					- either rise together
					- or one rises and another falls
	- $\bar{\text{cat}} = \bar{\text{racoon}}$
	- $\hat{y_i} = \bar{y}$
- **Step 3**: Build the correct model to test your hypothesis
	- y = mass, x = animal
	- `lm(y~x)`
- **Step 4**: Check the assumptions of the model
	- Normality
		- Of what?
			- normality of y doesn't matter to the model for bimodal
		- normality of residuals:
			- how far away from its own mean
			- not from y
				- normality of how far each observation is from its own mean
		- if correlation, need both normal
		- if paired, need delta column normal
		- transformations:
			- only a **log** or sqrt data
	- Outliers
		- **Remove if Cook’s distance is 0.5 or more!**
	- Pseudo replicates?
		- each row of tidy dataset is new experimental unit
			- not just sub samples from the same field/individual
- **Step 5**: Fix model with new data
	- do model checking tests before getting a p-value
- **Step 6**: Test the null hypothesis
	- welsch correction with **t-test**, not summary
- **Step 7**: Interpret your results
	- Might need a post-hoc test
		- t.test():
			- t = -2.7
			- df = 9.8
			- P = 0.023
			- CI = -6.4,-0.6
			- mean(Cat) = 11.01
			- Raccoon = 14.52
		- summary:
```r
(Intercept)     SE      t          P
   11.01       0.94   11.76      0.00 ***
ORData$Animalracoon   
    3.35        1.27    2.75     0.019 ** 
```
- summary stats:
	- values
		- R^2: 0.41
			- explains 41% of variation
				- with one observation about the universe
		- F = 7.55
		- P = 0.019
			- use the p-value from the t-test
				- it can be welsch corrected
					- for degrees freedom
				- two-sample t-test
					- run both - & summary
			- linear model: 
- **Step 8**: Build a figure to help tell the story

### R Code
#### Input
```r
model<-lm(longdat$mass~longdat$Animal)
hist(model$residuals)
cooks.distance(model)
plot(x = 1:14,y = cooks.distance(model))
which.max(cooks.distance(model))
#remove outlier
ORData<-longdat[-9,]
bettermodel<-lm(ORData$)
t.test(ORData$mass~ORData$Animal)
summary(bettermodel)
```
#### Output
```r
> cooks.distance(model)
          1           2           3           4           5           6           7           8           9          10          11          12 
0.001383026 0.047919018 0.024448144 0.006956106 0.184081462 0.018954009 0.021532425 0.112997880 0.234897141 0.135809572 0.126976064 0.006405520 
         13          14 
0.120777833 0.123528467
> which.max(cooks.distance(model))
9 
> t.test(ORData$mass~ORData$Animal)

	Welch Two Sample t-test

data:  ORData$mass by ORData$Animal
t = -3.1499, df = 10.377, p-value = 0.009892
alternative hypothesis: true difference in means between group Cat and group racoon is not equal to 0
95 percent confidence interval:
 -5.7181503 -0.9937074
sample estimates:
   mean in group Cat mean in group racoon 
            12.66707             16.02300 

> summary(bettermodel)

Call:
lm(formula = ORData$mass ~ ORData$Animal)

Residuals:
    Min      1Q  Median      3Q     Max 
-2.8608 -1.4621 -0.2911  1.8405  2.4614 

Coefficients:
                    Estimate Std. Error t value Pr(>|t|)    
(Intercept)          12.6671     0.7768   16.31 4.71e-09 ***
ORData$Animalracoon   3.3559     1.0585    3.17  0.00891 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 1.903 on 11 degrees of freedom
Multiple R-squared:  0.4775,	Adjusted R-squared:   0.43 
F-statistic: 10.05 on 1 and 11 DF,  p-value: 0.008913

> 
```

#### Plot

![[cooksDistancePlot.png]]

### Review Table

| Tests           | H<sub>o</sub> | test stat               | x   | y   | normality                    | EDA | figure | tidy table / n |
| --------------- | ------------- | ----------------------- | --- | --- | ---------------------------- | --- | ------ | -------------- |
| Paired T Test   |               |                         |     |     |                              |     |        |                |
| 2 Sample T Test |               |                         |     |     |                              |     |        |                |
| ANOVA           |               |                         |     |     | KS(residuals) <br>= p > 0.05 |     |        |                |
| Correlation     | $\rho=\theta$ | $\frac{r-\theta}{SE_r}$ |     |     |                              |     |        |                |
| Regression      |               |                         |     |     |                              |     |        |                |
#### Tidy Tables

##### Wide:

| ID  | T   | C    |
| --- | --- | ---- |
| 1   | 204 | 14.3 |
^ 25

##### Long/Tidy:

| Group | Resp |
| ----- | ---- |
| T     | 20.4 |
| C     | 14.3 |



---

Previous: [BILD 5 Lecture 23](BILD_5_LE_23.md).
Next: [BILD 5 Lecture 25](BILD_5_LE_25.md).