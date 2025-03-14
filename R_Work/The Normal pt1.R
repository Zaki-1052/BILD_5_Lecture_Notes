####The Normal Distribution

#Lets create our universe
set.seed(27)
TrueMean<-13
TrueSD<-3

#Lets perform our experiment  
N<-15
X<-rnorm(n = N,mean = TrueMean,sd = TrueSD)
hist(X)

Expmean<-mean(X)
abline(v =Expmean , col="turquoise", lwd=2)

ExpSD<-sd(X)

#But our experiment was just one outcome from an infinte number of possible outcomes

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
abline(v =Expmean , col="darkred", lwd=2)


#So,what is controlling the shape of this distribution?
#Better experiment
AllMeans2<-NA
for(i in 1:10000){
  TempX<-rnorm(n = 150,mean = TrueMean,sd = TrueSD)
  AllMeans2[i]<-mean(TempX)
}
par(mfrow=c(1,2))
hist(AllMeans,xlim=c(9,16))
hist(AllMeans2,xlim=c(9,16))

#Sample size!

# We can estimate the shape parameter of the CLT with the standard error
St.Error<-ExpSD/sqrt(N)
#Compare that to
sd(AllMeans)
St.Error


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
