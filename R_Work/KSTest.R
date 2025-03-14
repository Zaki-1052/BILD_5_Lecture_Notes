turtle<-rnorm(30,mean=6,1.4)
hist(turtle)
ks.test(x=turtle,pnorm,mean(turtle),sd(turtle))

BB<-rlnorm(30,meanlog=1.5,.5)
hist(BB)
ks.test(x=BB,pnorm,mean(BB),sd(BB))