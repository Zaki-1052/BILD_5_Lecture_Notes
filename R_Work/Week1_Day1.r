A <- 8

A

B <- 2

A * B
B-3

greeting <- "hello"
greeting

question <- "What is happening?"
question

Numbers <- c(1,2,3)
Numbers

BigNumbers <-c(100,1000,10.3)

NumbersCM <- Numbers*2.54
NumbersCM

BigNumbers[2]
BigNumbers[2:3]
Numbers <- BigNumbers

PopTarts <- c(1,2,.5,"dinosaur") # Bad vector - numbers and strings
# Everything becomes a string
PopTarts
PopTarts[2]+2
PopTarts[2]
PopTarts[2]
PopTarts[4]
PopTarts[1]

Breakfast <- c("eggs","poptarts","noodles")

BadNumbers <- c(1,2)
Numbers+BadNumbers
result <- Numbers+BadNumbers


# Logical arguments


BigNumbers
lessThan100<-BigNumbers<100
lessThan100

greaterThan100<-BigNumbers>100
greaterThan100

BigNumbers>=100
BigNumbers<=100
BigNumbers==100
BigNumbers!=100

#print
cat(greaterThan100)
print(greaterThan100)

#rewrite objects
BigNumbers <-c(100,1000,10.4)



