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




Control|>ggplot(mapping=aes(x=Response))+
  geom_histogram()
Treatment|>ggplot(mapping=aes(x=Response))+
  geom_histogram()


ks.test(Control$Response,pnorm,mean(Control$Response),sd(Control$Response))
ks.test(Treatment$Response,pnorm,mean(Treatment$Response),sd(Treatment$Response))

t.test(Treatment$Response,Control$Response)

