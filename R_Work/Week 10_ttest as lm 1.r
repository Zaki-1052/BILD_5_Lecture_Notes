Cat<-rnorm(7,12,2)
racoon<-rnorm(7,15,2)
t.test(Cat,racoon)
library(tidyverse)

data<-data.frame(Cat,racoon)
longdat<-pivot_longer(data,1:2,names_to = "Animal",values_to = "mass")
model<-lm(longdat$mass~longdat$Animal)
mean(Cat)
mean(racoon)-mean(Cat)
hist(model$residuals)
ks.test(model$residuals,y="pnorm",mean(model$residuals),sd(model$residuals))
plot(model)

summary(model)


model<-lm(longdat$mass~longdat$Animal)
hist(model$residuals)
cooks.distance(model)
plot(x = 1:14,y = cooks.distance(model))
which.max(cooks.distance(model))
#remove outlier
ORData<-longdat[-9,]
bettermodel<-lm(ORData$mass~ORData$Animal)
t.test(ORData$mass~ORData$Animal)
summary(bettermodel)
