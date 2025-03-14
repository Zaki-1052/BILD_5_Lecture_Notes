#What if I want to compare 3 groups?
library(tidyverse)

A<-c(56,63,45,41,71,60,78,50,68,62)
B<-c(40,48,60,38,32,44,66,22,45,54)
C<-c(71,57,64,44,73,50,79,67,84,61)
data<-data.frame(A,B,C)

better_Data<-pivot_longer(data,1:3,names_to = "island",values_to = "birdcall")
View(better_Data)

model<-lm(birdcall~island,data =better_Data)
model
mean(A)
mean(A)-mean(B)
mean(C)-mean(A)

model$residuals
head(better_Data)
56-mean(A)

ks.test(model$residuals,"pnorm",mean(model$residuals),sd(model$residuals))

hist(model$residuals)


anova(model)


TukeyHSD(aov(model))

mean(A)

plot<-ggplot(data=better_Data,mapping=aes(x=island,y=birdcall,fill=island)) +
  theme_classic() +
  scale_fill_manual(values = c("cornflowerblue", "darkorange2", "gold1"))+
  xlab("Island") +
  ylab("Birdcall") +
  annotate(geom="text",x=c("A","B","C"),y=c(85,75,90),label=c("A","B","A"))+
  guides(fill="none")+
  geom_boxplot()
plot
