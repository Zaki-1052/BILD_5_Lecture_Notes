#T test Day 1

BarleyData<-c(3,5,4,7,5,6,8,9,6,4,5,2,5,6,9,6,4,5,7)

meanBD<-mean(BarleyData)

sdBD<-sd(BarleyData)

SEBD<-sdBD/sqrt(length(BarleyData))

ExpectedMU<-6.2

t_scoreBD<- (meanBD-ExpectedMU)/SEBD


