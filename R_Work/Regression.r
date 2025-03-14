mass.g<-c(17.7,18.7,17.2,20.1,19.1,17.7,18.9,19.8,15.8,19.5)
nitrogen.ppm<-c(8.26,7.45,6.95,8.53,9.37,8.49,9.7,9.09,7.34,9.69)

FruitData<-data.frame(mass.g,nitrogen.ppm)
hist(FruitData$mass.g)
ks.test(x = FruitData$mass.g,y=pnorm,mean(FruitData$mass.g),sd(FruitData$mass.g))
hist(FruitData$nitrogen.ppm)
ks.test(x = FruitData$nitrogen.ppm,y=pnorm,mean(FruitData$nitrogen.ppm),sd(FruitData$nitrogen.ppm))

ggplot(data=FruitData,mapping=aes(x=nitrogen.ppm, y=mass.g))+
  geom_point()


model1<-lm(mass.g~nitrogen.ppm)
model1$coefficients[2]
#Is our model any good?
plot(model1)


names(model1) #look at all the different objects contained in the model!

###With this information we can calculate the different sums of squares


#Recall the total variation in Y that we expect:
totalSS<-sum((mass.g-mean(mass.g))^2)


#the amount of variation accounted for in the model is

modelSS<-sum((model1$fitted.values-mean(mass.g))^2)

modelSS/totalSS #Our coefficient of determination!

summary(model1)

#But why is it called r squared?
plot(model1$fitted.values,mass.g)
cor(model1$fitted.values,mass.g)^2

#Is our model different from the null?

#t test!
summary(model1)
t.score<-(0.9176-0)/0.3477
pt(t.score,8,lower.tail = FALSE)*2


#ANOVA. We can also examine if the amount of variation captured in our model is more than the average variation not captured.
# Y = b1X + b0 + error
anova(model1)
summary(model1)

ggplot(data=FruitData,mapping=aes(x=nitrogen.ppm, y=mass.g))+
  geom_point()+
  geom_smooth(method="lm")
