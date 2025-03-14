Cat<-rnorm(7,12,2)
racoon<-rnorm(7,15,2)
t.test(Cat,racoon)
library(tidyverse)

data<-data.frame(Cat,racoon)
longdat<-pivot_longer(data,1:2,names_to = "Animal",values_to="mass")
model<-lm(longdat$mass~longdat$Animal)
mean(Cat)

mean(racoon)-mean(Cat)


hist(model$residuals)
ks.test(model$residuals,y="pnorm",mean(model$residuals),sd(model$residuals))
cooks.distance(model)

bigCat<-Cat
bigCat[1]<-60
data<-data.frame(bigCat,racoon)
longdat<-pivot_longer(data,1:2,names_to = "Animal",values_to="mass")
model1<-lm(longdat$mass~longdat$Animal)
cooks.distance(model1)

plot(model)
summary(model)