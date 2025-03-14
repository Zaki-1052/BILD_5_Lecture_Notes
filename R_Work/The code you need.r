#The code you need. It is only 4 lines, and 2 of them you saw last week:

#Here are some data, not in a csv or data frame, so keep that in mind for homework.
mass.g<-c(17.7,18.7,17.2,20.1,19.1,17.7,18.9,19.8,15.8,19.5)
nitrogen.ppm<-c(8.26,7.45,6.95,8.53,9.37,8.49,9.7,9.09,7.34,9.69)

#Correlation

cor.test(mass.g,nitrogen.ppm)
#Order does not matter!
cor.test(nitrogen.ppm,mass.g)#identical output

#Regression

#Build a model:

model<-lm(mass.g~nitrogen.ppm)

#Test the model

summary(model) #Good, lots of info

anova(model) #Also fine, less info

r2<-7.4667/(7.4667 + 8.5783)
r2
