---
course: BILD 5
type: lecture
lecture_num: 9
date: 1/27
---

# BILD 5 Lecture 9
- ## 1/27
	- ## The Normal Distribution

## Confidence Intervals and the Universe

### Code

#### Part 1

```r
####The Normal Distribution

#Lets create our universe
set.seed(27)
TrueMean<-12
TrueSD<-2

#Lets perform our experiment  
N<-15
X<-rnorm(n = N,mean = TrueMean,sd = TrueSD)
hist(X)

Expmean<-mean(X)
abline(v =Expmean )

ExpSD<-sd(X)
#13.66
```
- 15 cats are random variables drawn from a normal distribution that has a mean of 13 and a standard deviation of 3.

#### Graph

![[HistogramX.png]]

#### Class Experiment

```r
TrueMean<-13
TrueSD<-3
```

![[histogramX2.png]]

#### All Means

```r
AllMeans<-NA
for(i in 1:10000){
  TempX<-rnorm(n = N,mean = TrueMean,sd = TrueSD)
  AllMeans[i]<-mean(TempX)
}

#The distribution of all possible experiments of this population
hist(AllMeans)

#And our experiment is just one of them!


mean(AllMeans)#Should be at the true Mu
sd(AllMeans)#Nowhere near sigma!
```
```r
> mean(AllMeans)#Should be at the true Mu
[1] 11.99999
> sd(AllMeans)#Nowhere near sigma!
[1] 0.521913
```

#### Image

![[allMeansHistogram.png]]

- Class:

![[allMeansHistogram3.png]]
- our experiment in distribution of all possible experiments not that close
	- far away
	- most experiments closer than our experiment
	- why StDev sigma parameter - on average 
	- how far away cat is from ideal cat mass
	- how far away experiment
		- this stdev = standard error

#### Class Values

```r
> mean(AllMeans)#Should be at the true Mu
[1] 12.99999
> sd(AllMeans)#Nowhere near sigma!
[1] 0.7828696
> Expmean
[1] 13.66017
> ExpSD
[1] 3.482528
```
- Mean is very close
- but that not equal to StDev
	- xBar 13.7
		- not 13
	- StDev 3.5 
		- not 3
	- 3.5 away from 13.7
	- never going to perfectly achieve parameters
		- random noise
		- universe sets soft expectations
- made assumption of normal distribution
	- sample dist
- estimates of sigma and Mu

#### Experiment 2

```r

#So,what is controlling the shape of this distribution?
#Better experiment
AllMeans2<-NA
for(i in 1:10000){
  TempX<-rnorm(n = 150,mean = TrueMean,sd = TrueSD)
  AllMeans2[i]<-mean(TempX)
}
par(mfrow=c(1,2))
hist(AllMeans,xlim=c(9,15))
hist(AllMeans2,xlim=c(9,15))

#Sample size!

# We can estimate the shape parameter of the CLT with the standard error
St.Error<-ExpSD/sqrt(N)
#Compare that to
sd(AllMeans)
St.Error
```
```r
> sd(AllMeans)
[1] 0.521913
> St.Error
[1] 0.5994565
```

#### Image

![[allMeansHistogram2.png]]

![[allmeansHistograms2.png]]

#### StDev


```r
> sd(AllMeans)
[1] 0.7828696
>> St.Error
>> [1] 0.8991848
```


#### Confidence Interval

```r
#So, the Standard error is how far away from the true Mu parameter the average experiment is


#Confidence Interval

UpperCI<- Expmean + 2*St.Error
LowerCI<- Expmean - 2*St.Error
cat(LowerCI,UpperCI)

#Why 2*SE?

qnorm(0.025)#Where is the bottom 2.5% of a normal distribution?
qnorm(0.975)#Where is the top 2.5% of a normal distribution?
UpperCI<- Expmean + 1.959964*St.Error
LowerCI<- Expmean - 1.959964*St.Error
cat(LowerCI,UpperCI)
```
```r
> cat(LowerCI,UpperCI)
11.2412 13.63902
> qnorm(0.025)#Where is the bottom 2.5% of a normal distribution?
[1] -1.959964
> qnorm(0.975)#Where is the top 2.5% of a normal distribution?
[1] 1.959964
> UpperCI<- Expmean + 1.959964*St.Error
> LowerCI<- Expmean - 1.959964*St.Error
> cat(LowerCI,UpperCI)
11.2652 13.61502
```

### Biology Connection

- Cat Mass
- 15 cats
- experimental:
	- Mean (**μ**): 
		- X̄ = 13.7
	- StDev (**σ**): 
		- S<sub>x</sub> = 3.5
	- 3.5 away from 13.7
- Estimates of true parameters sigma (**σ**) and Mu (**μ**)
- infinite outcomes:
	- calculate means 10k times
	- mean(AllMeans)
		- sample is itself a random variable from distribution
			- 12.9999
				- rounding error
				- very close
			- sd not near sigma
			- equal to Mu but not StDev
- **Standard Error:**
	- standard deviation σ parameter
		- see AllMeans histogram
	- StDev:
		- how far away cat mass vs
		- how far away from experiment
	- somewhat influenced by experimental data
	- but moreso by:
		- **quality of experimental design**
- Sample Size:
	- work harder: 
		- more data, more cats (sample size)
		- number of cats increased from same distribution
	- relationship between histograms
		- see Experiment 2
	- Change:
		- more individuals add to experiment, tighter distribution
		- on average, closer to truth with increased sample size
	- Distribution of all possible means in experiment:
		- shape of that distribution of all possible outcomes of the universe depends on the sample size of your experiment
		- no control over sigma (StDev) or Mu (mean)
		- but you do get control over:
			- Standard Error
		- The more individuals added to experiment = tighter distribution
			- on average, closer to the truth with an increase in sample size
	- can't create distributions because built from the truth
	- don't have a good way to estimate values or create loop
- standard error can be estimated:
	- standard deviation of data divided by square root of sample size
- StDev:
```r
> sd(AllMeans)
[1] 0.7828696
>> St.Error
>> [1] 0.8991848
```
- St. Error:
	- closer estimate to what it should be than Standard Deviation
		- never perfect
- on average: 
	- based on pink numbers
		- mean (13.7) and stdev (3.5)
	- experiment about 0.89 or 0.9 pounds away from the truth
		- plus or minus a pound on average
	- calculate confidence interval/standard error:
		- not going to run a loop
		- just samples from distribution
		- best able to estimate width of distributions:
			- use following SE equation:

> [!theorem] Standard Error
> $$SE = \frac{S_x}{\sqrt{n}}$$

- Just of one experiment
- biology determines importance of numbers
- distribution/shape of all possible experiments
	- if narrow, better
	- smaller standard error = 
		- more you can say about the universe
		- and with greater precision
			- best when standard error is smaller than binwidth of instrument collecting data on
			- blood pressure fluctuates:
				- careful test
				- measure small standard error
				- if standard error is smaller than day to day fluctuations of patients
					- then know the truth from a biology perspective
					- SE smaller than ruler
					- within average for human being
					- but if experiment has wider distribution
					- not convincing or useful
					- depends on question
		- standard error is distribution width of all possible experiments
		- how you rank/value number is dependent on biological interpretation
	- average distance from truth
		- not most useful
		- one standard deviation from mean
			- only containing 68% of all possible outcomes
	- Mu plus or minus standard error
		- want 95% confidence
	- take exp mean
```r
> Expmean
[1] 13.66017
```
- 2 sigma (standard errors) away from the mean
	- 2 times standard error
	- +/- 2 \* (times) St. Error
		- see *Confidence Interval*
```r
> cat(LowerCI,UpperCI)
> 11.8618 15.45854
```
- don't know truth, but...
	- from the 15 cats counted
		- 95% confident
		- bc 95% of all experiments that could have been conducted:
			- exist between 11.9 and 15.5
			- compelling thing to say about the universe
- 2\*SE b/c:
	- quantiles of normal distribution
		- where get 2.5% 
			- middle of 95%
				- split between remaining 2.5% 
					- from both sides
		- 68, 95 quantile, etc.
		- quantiles from normal distribution
			- numbers very close to 2
			- numbers for calculating confidence intervals
				- 1.96, etc.
				- true confidence intervals with better estimates of quantiles
				- doesn't change by much
					- 1.96 is sufficient
						- enough precision for biology
- See **Confidence Interval** Code
```r
> #Why 2*SE?
> > qnorm(0.025)#Where is the bottom 2.5% of a normal distribution?
[1] -1.959964
> qnorm(0.975)#Where is the top 2.5% of a normal distribution?
[1] 1.959964
> UpperCI<- Expmean + 1.959964*St.Error
> LowerCI<- Expmean - 1.959964*St.Error
> cat(LowerCI,UpperCI)
11.8978 15.42254
```
- 1.96
	- changes slightly
	- but not by much

---

Previous: [BILD 5 Lecture 8](BILD_5_LE_8.md).
Next: [BILD 5 Lecture 10](BILD_5_LE_12.md).