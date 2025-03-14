tvals<-NA
pvals<-NA
for(i in 1:10000){
  randomSample<-rnorm(20,mean=3,sd=1)
  tvals[i]<-t.test(randomSample,mu=3)$statistic
  pvals[i]<-t.test(randomSample,mu=3)$p.value
}
hist(tvals)
hist(pvals)
