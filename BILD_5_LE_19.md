---
course: BILD 5
type: lecture
lecture_num: 19
date: 2/21
---

# BILD 5 Lecture 19
- ## 2/21

## ANOVA 2

### Part 1

#### Notes

- Running multiple t-tests
	- 3 minutes in 
	- 3 hypotheses
		- $\bar{A} - \bar{B} = 0$
		- $\bar{B} - \bar{C} = 0$
		- $\bar{A} - \bar{C} = 0$
			- ALL H<sub>o</sub>
	- Null: 
		- Only a single mean is sufficient
		- these groups don't matter
		- don't need three different means
##### Graph 1
![[anovaBoxPlot.jpg]]

#### Notes 1
- 3 hypotheses
	- $\bar{A} - \bar{B} = 0$
	- $\bar{B} - \bar{C} = 0$
	- $\bar{A} - \bar{C} = 0$
		- ALL H<sub>o</sub>
- Null: 
	- expected value of y
		- best guess
		- equal to 
	- grand mean of y
- groups don't matter
	- clump data into one tidy column
	- Only a single mean
		- don't need 3 - 
			- they are all the same
- test whether null or groups different from one another
- Null:
	- $H_o : \hat{y} = \bar{y}$
		- predicted value is equal to mean of y
- Alternate:
	- $H_o : \hat{y} \neq \bar{y}$
- **notes**:
	- clustered observations
	- 3 different groups
	- if null true
		- and best estimate is mean of y
	- some amount of total variation in system not explained
	- **variance**
	- if null true:
		- can't explain length of arrows
		- just:
			- random noise/
			- standard deviation/
			- sampling error
		- things I can't explain
	- but if can explain with the model
		- mean of group a/b/c matters
	- can explain length of pink error
		- bc this mean is some distance away from the true mean of y
	- for each observation
		- blue arrows some component of red arrows
		- some proportion of variation that model is explaining
	- is still some residual variation
		- observations aren't perfectly aligned with group means either
			- not aligned perfectly with grand mean of y
	- end up with yellow arrows
		- how far away observations are from *model*
			- **residuals**
##### Graph 2
![[anovaGraph2.jpg]]

#### Notes 2
- **review:**
- total amount of variation in universe:
	- can be explained in part by model
	- and in part by random noise model doesn't capture
- null:
	- residuals
	- length of pink arrows
		- equal to length of yellow arrow
		- plus length of blue arrow
	- total amount of variation in universe
		- can be explained in part by model
		- and in part by random noise that the model doesn't capture
	- testing hypothesis
- different bc blue arrows account for a large portion of length of pink arrows
- null data:
	- groups don't matter
		- all have a similar mean
	- grand mean of y
		- arrows
	- total variation in observations
		- unexplained
			- does group help explain that variation
	- means of each of these groups close to the grand mean
		- cluster of yellow dots mostly there
		- blue arrows not a big amount of pink errors
			- now a small amount
	- residual arrows:
		- remaining variation can't explain
			- is quite large
- anova:
	- if groups different:
		- variation explained by model
		- should be most of total variation observed
			- blue arrows should explain a lot of the pink arrows
	- if same:
	- if group doesn't matter
		- then blue arrows small
			- bc difference in means 
				- between groups
			- isn't explaining much of the variation
				- observed in the dots
		- variation is just yellow random chance
			- yellow and pink similar
##### Graph 3
![[anovaGraph3.jpg]]

#### Notes 3

- $\sum(\hat{y_i}-\bar{y})^2$
	- **Model** SS
		- blue
			- how far away the predicted value is from the mean of Y
				- sum of predicted values - y bar all squared
- $\sum(y_i - \hat{y})^2$
	- **Residual** SS
		- yellow arrows
			- add distance between observations and blue mean
				- blue lines mean = predicted values (hat)
		- how far away are observations from where they should be if the model is right?
- $\sum(y_i - \bar{y})^2$ 
	- $/ (n-1)$ = *variance*
	- **Total** SS
		- pink line
- components of variance
- SS = sums of squares
- question:
	- are predicted values just wiggling noise around the mean y
		- null would be true
- alternate:
	- some better prediction to make than mean of y
		- model is that prediction
- when testing null:
	- believe predicted value is equal to the mean of y
		- when we build a model
			- we let it be different by a little bit
		- if x does explain y
			- these means would be our predictions
				- test and get p-value
- 2 tidy columns:
	- island and bird 
- r^2 value is length of blue arrows divided by length of pink arrows
- $R^2$
- **R-squared value:**
	- proportion of variation that the blue arrows describe
	- divided by the total variation we observe
		- value between 0 and one
	- telling us the proportion of variation 
		- that the blue lines are overlapping the pink lines
			- useful example:
			- cell metabolism:
				- prior model explain 45% of variation of total samples in lab
				- new model could explain 55% of variation
					- could use r squared value to 
						- talk about how biologically meaningful model is
				- not a p-value
					- talks about how much of the total variation of the universe 
						- that your model is capturing
				- explain some meaningful part of universe with immense variation
					- like the human body
			- understand how much of the total spread of data
				- is because model is predicting these things to be different
					- blue to pink arrow
					- big vs small r squared value
- how much of the total variation of the universe your model is capturing
- f-value:
	- average contribution of a blue arrow
		- divided by the
	- average contribution of a yellow arrow
		- average f should be agnostic of sample size
	- ratio between blue and yellow
		- yellow arrows are unexplainable variation
			- could be bias mistake 
				- or standard deviation
			- yellow arrows are noise
				- model can't account for it
		- signal-to-noise ratio
			- yellow arrows: 
				- unexplained variation
			- ratio of signal-to-noise
				- = f-statistic
- p-value:
	- f-statistic:
		- probability of getting my f-statistic when null hypothesis is true
			- = p-value
	- $P(F|H_o TRUE) = \text{p-value}$
		- ratio gives ability to test null hypothesis
- bigger f score:
	- the further away our group means are away from the mean of y
		- the more obvious it should be that group matters
- means closer or farther
- standard deviations 
##### Similar
![[similarBoxplot.png]]
#### Explained
- the further away our means are
	- the bigger our signal gets
- but even if means were different
	- if variances were big
- harder to tell differences
	- boxes get bigger/wider
	- standard deviations increase
		- noise increasing
			- won't be able to distinguish difference
	- f-statistic asking:
		- are means further/closer to each other
		- are standard deviations that make up groups
			- small enough that can distinguish them apart from one another
- null:
	- there is only one group
		- aren't different populations
			- same population
				- three mountains
				- but continuous range
- population matters
	- different phenotypes in three populations
### Post-Hoc Testing

#### Notes P1

- what happens when we reject the null
	- before so that we didn't have to run multiple t-tests
- null: wrong
	- predicted values of y equal to y bar
- accepted alternate: 
	- predicted values of y *not* all just equal to grand mean of y
- groups matter
	- control/treatment
- three groups:
	- placebo
	- current drug
	- new drug
		- better than nothing at all
		- but still want to know
			- which group is different from one another
- got a single test for a single hypothesis
	- but still have a biological question
- is treatment different enough from control
	- original treatment is better than control
	- but are last two different
- ***important***:
	- valid **only** after rejecting null
- perform after demonstrated difference is real
- identify which group is different
	- **post-hoc testing**
- after you've demonstrated there's a difference
	- with ratios - is real difference
- who is causing the difference
	- which of my groups are in fact different from one another
- 3 groups:
	- compared them 
	- built a model
		- that model better at explaining variation were were interested in
			- than the null model
				- so total mean 56.4
					- model doesn't matter
			- or group does matter
```r
Coefficients:
(Intercept)      islandB      islandC  
       59.4        -14.5          5.6  
```
- have two models
- want to know which is better
- anova 
	- creates arrows and ratios
	- sums of squares
	- means of squares
	- f value
	- probability of getting f-ratio if the null is true
		- reject null
		- know groups are different from each other
- question:
	- which groups are causing that difference
	- which of groups are in fact 
		- different from each other
- tukey post-hoc test
- tukey honest significant difference test 
- fn(aov(model))
- TukeyHSD

#### Code

```r
> TukeyHSD(aov(model))
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = model)

$island
     diff        lwr        upr     p adj
B-A -14.5 -28.259051 -0.7409486 0.0373574
C-A   5.6  -8.159051 19.3590514 0.5775808
C-B  20.1   6.340949 33.8590514 0.0033079

> mean(A)
[1] 59.4
> 
```

#### Notes P2

- output:
	- get multiple comparisons of means
	- and 95% family wise confidence levels
- difference in means
	- confidence interval
	- 14.5 around true difference
	- multiple comparisons
- b and a are different 
	- from one another
- c and a aren't 
	- that different from one another
	- probability of getting this difference
	- if the truth is that those two groups 
		- aren't different from one another
			- 58% - too high
				- random chance
- do instead of a bunch of t-tests
- probability of getting true difference 58%
- b and c likely different
- post-hoc test
	- instead of t-tests
- only get to do this test
	- after we reject the null
		- from the f-score
- but only after rejecting null with f-score
- sketch:
	- numbers on y-axis
- tukey test:
	- which plot looks correct

#### Graphs

##### Post-Hoc Drawing
![[postHocDrawing.png]]

##### Boxplot
![[anovaBoxPlot.png]]

#### Notes P3

- categorical x groups
- continuous y response
	- box plot
- if they share letters, 
	- they're not different from one another
- mean of group A:
	- 59.4
- B-A=14.5
- C 5.6 more
- difference between A and B is significant
- letter annotations
- a and c weren't different from one another
	- couldn't distinguish whether should treat as same groups
		- or different groups
- groups that share a lack of significance
	- share an identity
		- will get the same letter
- c and b different
	- already have different letters
- building post-hoc tests
	- geometry not sufficient
- tell where differences truly exist
	- demonstrated that null is bad
		- done anova to demonstrate
			- and support alternate
- which groups are driving that alternate model?
	- in this case: 
		- B
			- significantly lower than a or c
- can't really distinguish if a and c have different means
	- of if they are just the same population
- if share letters
	- then not different from one another
- **Statement**:
	- *Box plots that share a letter are not significantly different from each other using a Tukey HSD test.*

---

Previous: [BILD 5 Lecture 18](BILD_5_LE_18.md).
Next: [BILD 5 Lecture 20](BILD_5_LE_20.md).