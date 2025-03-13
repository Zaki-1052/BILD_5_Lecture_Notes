---
course: BILD 5
type: lecture
lecture_num: 16
date: 2/12
---

# BILD 5 Lecture 16
- ## 2/12

## T Tests

|                      | T Score                                            | Null Hypothesis | Code | Geom |
| -------------------- | -------------------------------------------------- | --------------- | ---- | ---- |
| Single Sample T Test | $$t = \frac{\bar{x} - \theta}{SE_x}$$              |                 |      |      |
| Paired T Test        | $$t = \frac{\bar{\Delta} - \theta}{SE_\Delta}$$    |                 |      |      |
| 2 Sample T Test      | $$t = \frac{\bar{x}_1 - \bar{x}_2}{SE_{x_1,x_2}}$$ |                 |      |      |
### Experiment
#### Research Question
- Response Variable
	- Participants broken up into two groups
		- Treatment and Control
- Research Question:
	- **Is there a Difference in Means between the T + C?**
		- (treatment and control groups)
#### Null/Alternate
- Null: H<sub>o</sub>
	- $\bar{X_T} = \bar{X_C}$
	- $\bar{X_T} - \bar{X_C} = 0$
		- There is no difference in means between T+C
- Alternate: H<sub>A</sub>
	- $\bar{X_T} \neq \bar{X_C}$
		- T + C not equal to each other
#### T Test
- **T-Test**:
	- #### **Two Sample T-Test**
#### Control/Treatment
- Control
	- D = 0.14
	- P = 0.245
- Treatment
	- D = 0.15
	- P = 0.15
#### C/T R Code
##### Histograms
```r
Control|>ggplot(mapping=aes(x=Response))+
  geom_histogram()
Treatment|>ggplot(mapping=aes(x=Response))+
  geom_histogram()
```
##### KS Test
```r
ks.test(Control$Response,pnorm,mean(Control$Response),sd(Control$Response))
ks.test(Treatment$Response,pnorm,mean(Treatment$Response),sd(Treatment$Response))
```
#### Graphs
##### Control Graph
![[controlHistogramResponse.png]]


##### Treatment Graph
![[treatmentHistogramResponse.png]]
#### Normality
- Both treatment and control groups are normal
	- KS Test Null Hypothesis H<sub>o</sub>
		- D = 0
			- want small D scores
	- H<sub>o</sub>: Data are **NORMAL**
- KS Test:
	- **p-value** is greater than 0.05
		- failed to reject the null hypothesis statement
		- so accept the null that the data is **normal**
#### T Test

```r
> t.test(Treatment$Response,Control$Response)

	Welch Two Sample t-test

data:  Treatment$Response and Control$Response
t = 1.2463, df = 88.031, p-value = 0.216
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.01137307  0.04963224
sample estimates:
 mean of x  mean of y 
0.08942095 0.07029136 

> 
```

- t-score:
	- t = 1.246
- degrees freedom:
	- DF = 88.03
		- unequal variance
- p-value
	- ***p = 0.216***
- **We fail to reject the null**: 
	- There is no significant difference in the means of the log treatment and log control
#### Visualization
- What type of data visualization should we build?
	- Box Plot with two boxes
- PID: **A18247936**

### R Code

```r
#T test Day 2

#Single Sample t test

BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)

meanBD<-mean(BarleyData)

sdBD<-sd(BarleyData)

SEBD<-sdBD/sqrt(length(BarleyData))

ExpectedMU<-6.2

t_scoreBD<- (meanBD-ExpectedMU)/SEBD

t.test(BarleyData,mu = 6.2)


#Paired t test

Control <- c(3.5, 3.9, 3.2, 3.1, 1.5, 3.2, 3.5, 3.8, 4.6, 1.1, 2.9, 1.9)
Treatment <- c(5.4, 5.5, 2.7, 4.4, 1.7, 4.2, 5.6, 5.1, 5.3, 4.5, 5.6, 1.6)

cbind(Control,Treatment)
delta<-Control-Treatment
cbind(Control,Treatment,delta)

DeltaMean<-mean(delta)

t.test(delta,mu = 0)
#or
t.test(Control,Treatment,paired = TRUE)
#It is the same thing!


#Two sample t test

Group1<-c(16, 19, 13, 15, 15, 17, 11, 17, 13, 15, 15, 15, 11, 15,  8, 16, 20, 10, 16, 10)
Group2<-c(19, 18, 18, 15, 17, 16, 18, 19, 20, 15, 14, 19, 13, 20, 21, 19, 12, 16, 16, 15)

t.test(Group1,Group2)
t.test(Group1,Group2,var.equal = TRUE)
curve(dt(x,100),xlim=c(-5,5),lwd=5)
curve(dt(x,1),xlim=c(-5,5),col="goldenrod",lwd=5,add=TRUE)


#Let's run a real example!
LectData<- read.csv("Week6Lect.csv")

library(tidyverse)

Control<-LectData|>filter(Group=="control")
Treatment <-LectData|>filter(Group=="treatment")


#What do we do next?
```

#### More Code

```r


Control|>ggplot(mapping=aes(x=Response))+
  geom_histogram()
Treatment|>ggplot(mapping=aes(x=Response))+
  geom_histogram()


ks.test(Control$Response,pnorm,mean(Control$Response),sd(Control$Response))
ks.test(Treatment$Response,pnorm,mean(Treatment$Response),sd(Treatment$Response))

t.test(Treatment$Response,Control$Response)


```

---

Previous: [BILD 5 Lecture 15](BILD_5_LE_15.md).
Next: [BILD 5 Lecture 17](BILD_5_LE_17.md).