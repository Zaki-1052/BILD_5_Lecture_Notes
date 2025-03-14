length.cm<-c(64,69,71,67,63,62,66,60,65,68)

weight.g<-c(130,148,180,175,120,127,141,118,120,159)

cbind(length.cm,weight.g)

cov(length.cm,weight.g)



#But there is a sneaky issue in Covariance, It is unit dependent!


length.in<-length.cm/2.54
weight.lbs<-weight.g*0.00220462
cov(length.in,weight.lbs)


##We can fix this issue with a z transformation

zlength.cm<-(length.cm-mean(length.cm))/ sd(length.cm)
sum(zlength.cm)
zlength.in<- (length.in-mean(length.in))/ sd(length.in)
scale(length.cm)
cbind(zlength.cm,zlength.in,scale(length.cm))

mean(zlength.cm)
sd(zlength.cm)

cov(scale(length.in),scale(weight.g))
cor(length.in,weight.g)
r<-cor(length.in,weight.g)

Ser <- sqrt(1-(r^2))/sqrt(10-2)
tscore <- (cor(length.in,weight.g)-0)/Ser

cor.test(length.in,weight.g)

cor.test(length.in,weight.g,method = "spearman")

cor.test(rank(length.in),rank(weight.g))
plot(rank(length.in),rank(weight.g))
