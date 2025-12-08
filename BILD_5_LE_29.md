---
course: BILD 5
type: lecture
lecture_num: 29
date: 3/15
---

# BILD 5 Lecture 29
- ## 3/17

## Review Session

- Exam basics:
	- 25 multiple choice questions
	- 2 extra credit qs: 52 total points
	- be conservative on multiple answer qs

| TYPE                                       | Null                                                     | test                                                                         | X/Y               | KS Test: <br>p > 0.05 | EDA                                     | Primary Test                                                      | fig                          | tidy columns                                                 |
| ------------------------------------------ | -------------------------------------------------------- | ---------------------------------------------------------------------------- | ----------------- | --------------------- | --------------------------------------- | ----------------------------------------------------------------- | ---------------------------- | ------------------------------------------------------------ |
| **2 Sample**                               | $\Delta \bar{x} = 0$<br>$\bar{x_1} - \bar{x_2} = \theta$ | $t = \frac{\bar{x}_1 - \bar{x}_2}{PSE_{x_1,x_2}}$                            | group/response    | residuals             | histogram of the residuals              | **welsch t test** - uncorrected<br>(p value not summary, but r^2) | two boxes                    | col: continuous y<br>col: categorical x<br>row=n sample size |
| **Paired**<br>*mean of deltas/ difference* | $\Delta x_{1,2} = \theta$<br>$\Delta = \theta$           | $\frac{\bar{x} - \theta}{SE_x}$<br>$\frac{\bar{\Delta} - \theta}{SE_\Delta}$ | delta             | Deltas                | histogram of the deltas                 | t.test(group1,group2, PAIRED=TRUE)<br>t.test(Delta, Mu = 0)       | one box                      | tidy by default<br>1 pre, post, delta<br>1 pre, post         |
| **Correlation**<br>*rho=theta*             | $\rho = \theta$                                          | $\frac{\rho-\theta}{SE_r}$                                                   | continuous        | x,y                   | scatterplot(x,y)<br>histogram(x,y)      | cor.test                                                          | scatterplot (still line)     | group 1, group 2                                             |
| **Regression**<br>*slope = theta*          | $\beta_1 = \theta$<br>$\hat{y_i}=\bar{y}$<br>            | $\frac{\beta_1-\theta}{SE_{\beta_1}}$                                        | continuous        | x,y                   | $SP_{x,y}$,$h_x,h_y$                    | summary(lm)                                                       | scatterplot with shadow line | same as correlation                                          |
| **ANOVA**<br>*predicted = mean y*          | $\hat{y_i}=\bar{y}$<br>                                  | $f = \frac{MS_{Model}}{MS_{Residuals}}$                                      | groups/continuous | residuals             | $h_r$/boxplot<br>histogram of residuals | summary(lm) / anova(lm) - both                                    | n boxes                      | groups, measurement                                          |
predicted values of y equal to the mean of y
slope = cov(x,y)/var(x)
mean square of model / mean square of residuals
regression & correlation = continuous x and y
welsch correction = difference in variance
decreases degrees freedom of t distribution
lm=linear model

- type I and type II error

|          | H<sub>o</sub>                       | H<sub>A</sub> |
| -------- | ----------------------------------- | ------------- |
| exp R Ho | Type I Error<br>alpha $\alpha$ 0.05 | TP            |
| fr Ho    | TN                                  | Type II Error |
|          |                                     | Beta $\beta$  |
- can calculate power:
	- how often fail to reject null when should have detected difference
		- false negative / missed story
- standard deviation vs. standard error:
	- lecture vid




---

add to crib sheet:

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



---

Previous: [BILD 5 Lecture 28](BILD_5_LE_28.md).
Next: [BILD 5 Lecture 30](BILD_5_LE_30.md).