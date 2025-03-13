---
course: BILD 5
type: lecture
lecture_num: 2
date: 1/8
---

# BILD 5 Lecture 2
- ## 1/8

## RStudio

### Numbers

- `CNTRL+ENTER` to run a line
- Assign numbers to objects

```R
4+4
> 4+4
[1] 8
> 
```

### Objects

- `#Objects`

```R
A <- 8

A

B <- 2

A * B
B-3

greeting <- "hello"

question <- "What is happening?"
question
```

- Numerical and Text Objects
- `<-` = get objects - assigns value

### Concatenation

- Concatenate:

```R
Numbers <- c(1,2,3)
Numbers

BigNumbers <-c(100,1000,10.3)

NumbersCM <- Numbers*2.54
NumbersCM
```

### Vectors

- Vectors

```R
BigNumbers[2]
BigNumbers[2:3]
Numbers-BigNumbers
Numbers

PopTarts <- c(1,2,.5,"dinosaur") # Bad vector - numbers and strings
# Everything becomes a string
PopTarts
PopTarts[2]+2 #Error: Math on letters
PopTarts[2]
PopTarts[4]
PopTarts[1]

Breakfast <- c("eggs","poptarts","noodles")

BadNumbers <- c(1,2)
Numbers+BadNumbers

> Numbers
[1] 1 2 3
> BadNumbers
[1] 1 2
```

- `PopTarts[2]+2`
	- trying to do math on letters - error
	- this is a bad vector because:
		- converts every element into a string


### Logical Arguments

- Logical Arguments

```R
BigNumbers
lessThan100 <-BigNumbers<100
lessThan100

> BigNumbers
[1]  100.0 1000.0   10.3
> lessThan100 <-BigNumbers<100
> lessThan100
[1] FALSE FALSE  TRUE

greaterThan100<-BigNumbers>100
greaterThan100

BigNumbers>=100
BigNumbers<=100
BigNumbers==100
BigNumbers!=100

> greaterThan100<-BigNumbers>100
> greaterThan100
[1] FALSE  TRUE FALSE
> > BigNumbers>=100
[1]  TRUE  TRUE FALSE
> BigNumbers<=100
[1]  TRUE FALSE  TRUE
> BigNumbers==100
[1]  TRUE FALSE FALSE
> BigNumbers!=100
[1] FALSE  TRUE  TRUE

#print
cat(greaterThan100)
print(greaterThan100)

> cat(greaterThan100)
FALSE TRUE FALSE
> print(greaterThan100)
[1] FALSE  TRUE FALSE
```


---

### Code

```R
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
```

### Console

```R
> A <- 8
> > A
[1] 8
> > B <- 2
> > A * B
[1] 16
> B-3
[1] -1
> > greeting <- "hello"
> greeting
[1] "hello"
> > question <- "What is happening?"
> question
[1] "What is happening?"
> > Numbers <- c(1,2,3)
> Numbers
[1] 1 2 3
> > BigNumbers <-c(100,1000,10.3)
> > NumbersCM <- Numbers*2.54
> NumbersCM
[1] 2.54 5.08 7.62
> > BigNumbers[2]
[1] 1000
> BigNumbers[2:3]
[1] 1000.0   10.3
> Numbers <- BigNumbers
> > PopTarts <- c(1,2,.5,"dinosaur") # Bad vector - numbers and strings
> # Everything becomes a string
> PopTarts
[1] "1"        "2"        "0.5"      "dinosaur"
> PopTarts[2]+2
Error in PopTarts[2] + 2 : non-numeric argument to binary operator
```

---

Previous: [BILD 5 Lecture 1](BILD_5_LE_1.md)
Next: [BILD 5 Lecture 3](BILD_5_LE_3.md)