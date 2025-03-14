#What if I want to compare 3 groups?

A<-c(56,63,45,41,71,60,78,50,68,62)
B<-c(40,48,60,38,32,44,66,22,45,54)
C<-c(71,57,64,44,73,50,79,67,84,61)

#t tests?

#No, instead a linear model


#First, tidy up the data.
data<-data.frame(A,B,C)
library(tidyverse)
better_Data<-pivot_longer(data,1:3,names_to = "island",values_to = "birdcall")
head(better_Data)

#Then build a model where your Y variable is some function of X

model<-lm(birdcall~island,data =better_Data)
model

model$fitted.values #These are the predicted values Y hat
model$residuals #These are the residuals, how far away the observations are from the fitted values

#The residuals need to be normal!

ks.test(model$residuals,"pnorm",mean(model$residuals),sd(model$residuals))

#Once the residuals look good, we can test our model. If the residuals looked bad, we would transform the data, build a new model, and test the residuals again. 

anova(model)

#If the model test rejects the null, we can run post hoc tests. We will use a Tukey test, which will compare which groups are significantly different.


TukeyHSD(aov(model)) #A little strange, but to make this work, we have to nest two functions. The input to the TukeyHSD() function is the aov() function. The input to the aov() function is the linear model object we built above.
