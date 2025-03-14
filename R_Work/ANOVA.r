######T tests, Day 1#####
t.score<-NA
for(i in 1:100000){
  sample<-rnorm(n = 20,mean = 6.2,sd = .427)
  t.score[i]<-(mean(sample)-6.2)/(sd(sample)/sqrt(20))
}

hist(t.score)
abline(v=-1.41,col="magenta",lwd=2)
abline(v=1.41,col="magenta",lwd=2)

barley<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,4,5,7)
t.test(x = barley,mu = 6.2)

FL<-rnorm(n = 30,mean = .4,sd = .05)
RB<-rnorm(30,mean = .2,sd=.05)
t.test(x = FL,y = RB,var.equal = T)
t.test(x = FL,y = RB)


curve(dt(x,df = 1),xlim=c(-5,5),lwd=2)
curve(dt(x,df = 5),xlim=c(-5,5),lwd=2,col="mediumaquamarine",add=TRUE)
curve(dt(x,df = 40),xlim=c(-5,5),lwd=2,col="palegreen2",add=TRUE)

curve(dnorm(x),xlim=c(-5,5),lwd=2,col="tomato",add=TRUE)


tscore<-NA
Pvals<-NA
for(i in 1:10000){
  sample<-rnorm(n = 30,mean = 0,sd = 1)
  Effect<-mean(sample)-0
  SE<-(sd(sample)/(sqrt(30)))
  tval<-Effect/SE
  tscore[i]<-Effect/SE
  Pvals[i]<-pt(q = abs(tval),df = 29,lower.tail = FALSE)*2
}
hist(tscore)
hist(Pvals)




#####Multiple Comparisons

A<-c(56,63,45,41,71,60,78,50,68,62)
B<-c(40,48,60,38,32,44,66,22,45,54)
C<-c(71,57,64,44,73,50,79,67,84,61)

AB<-t.test(A,B)
BC<-t.test(B,C)
AC<-t.test(A,C)
AB$p.value
BC$p.value
AC$p.value
p.adjust(c(0.01734729,0.002458293,0.3138771),method = "bonferroni")

p.adjust(c(0.01734729,0.002458293,0.3138771),method="holm")


AB$p.value*2
AC$p.value*1
BC$p.value*3


#ANOVA


mean(A)
mean(B) 
mean(C)
response<-c(A,B,C)
treatment<-c(rep("A",10),rep("B",10),rep("C",10))
cbind(response,treatment)
model<-lm(response~treatment)
model

anova(model)



###Post hoc test

#TukeyHSD

TukeyHSD(x = aov(model))

