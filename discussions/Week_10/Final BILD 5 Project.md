---
title: The Effect of Cold Showering on Immune Response
author: Zakir Alibhai
date: 3/10/25
output:
  html_document:
    df_print: paged
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(eval = TRUE)
knitr::opts_chunk$set(error = TRUE)
```

```{r main instructions, include=FALSE}
# Final Term Project Write-up Instructions

#Please read the following, and be sure to follow all instructions. There is no resubmit opportunity for this assignment:

#1.  Each section will have headings and 1-2 code blocks. Do not edit the headings for each section (anything with one or more #'s at the start of the line. The first code block will be instructions for that section and will not be knit into the final document. The second code block (if present) will be for you to include your own code needed to complete the section. It will be knitted and presented in the final document. 

#2.  Examine all the feedback you got on your proposal so far. Do you need to modify your question, prediction, hypothesis, experimental design, or analytical plan? This term paper will be graded on its own merit, separate from how you did on any of the checkpoints. You are not held to the decisions you made on previous checkpoints. You are only required to use the data you were given and the same primary statistical test that you included on the survey generating your simulated data.

#3. Make any citations as needed, including the original paper, but if you need additional evidence, include it. You must include inline citations (Author, year), as well as a bibliography at the end. This includes any URLs where you copied code. You do not need to cite any course materials. Remember, copying code is encouraged. It's your words that need to be original.

#4. Feel free to copy and paste anything you'd like from your previous checkpoint assignments.

#5. You are welcome to use ChatGPT or any generative AI to help generate your code. However you MUST properly cite all instances where it was used and include an annotation stating how you used it. This should be brief and you are ultimate responsible for everything you include, regardless of its origin. Un-annotated, un-sited code using functions from outside of the class can be docked points.

#6. You will often be instructed to write text in specific places inside square brackets. Delete the square brackets and all instructional text contained within before you submit.

#6.  Knit your .RMD document as an html and submit the html to Canvas. It is due Sunday the 16th at 11:59pm. Be aware that late penalties will be assessed.
```

```{r Section1 instructions, include=FALSE}
#This section states which of the three class papers you chose to base your study on. #Only remove text where it instructs to. 

```

# [Term Project Description]{.underline}

My project builds upon the study referenced below. I have proposed a potential follow-up experiment to extend the study's findings. The project utilizes simulated data, structured and analyzed as if collected from a real experiment. While the outcomes do not provide scientific evidence, they showcase my skills in formulating and addressing relevant biological questions through statistics, experimental design, and programming.

### Article citation:

Citation: Buijze GA, Sierevelt IN, van der Heijden BCJM, Dijkgraaf MG, Frings-Dresen MHW (2016). The Effect of Cold Showering on Health and Work: A Randomized Controlled Trial. PLoS ONE 11(9): e0161749. doi:10.1371/journal.pone.0161749

### Brief statement on the findings from the original article that led to your followup experiment:

The original article concluded basically that cold showers reduce the number of days of work participants miss from feeling sick, but not the actual number of days they get ill. This led to me question whether there was a mental component to cold showers that strengthened or generally affected 

------------------------------------------------------------------------

```{r Section2 instructions, include=FALSE}
#Below the appropriate headings, write in your responses.

#The Question: Write out your overall biological research question for your project in a single sentence.

#Disclaimer: Do not edit this line.

#Rationale and Background: Include here a short paragraph (~300-500 words) providing basic, relevant background and your rationale for asking the question. Pretend your audience is a UCSD undergraduate first-year biology major.

```

# [The Question]{.underline}

[Input your answer and delete these brackets]

#### Disclaimer: This project analyzes simulated data. The questions and hypotheses are real, but the results and conclusions are not.

### *Rationale and Background:*

[Input your answer and delete these brackets]

------------------------------------------------------------------------

```{r Section3 instructions, include=FALSE}
#Fill out the following sections. Each should only be a single sentence.


```

# [Hypotheses]{.underline}

### *A Statistical Null Hypothesis:*

[Input your answer and delete these brackets]

### *A Statistical Alternative Hypothesis:*

[Input your answer and delete these brackets]



------------------------------------------------------------------------

```{r Section4 instructions, include=FALSE}

#You will also use this page to describe your overall experimental design. Each should be written in paragraph form and can be up to 300 words max. If appropriate, it should cover each of the following issues: randomization, controls (positive and/or negative), blinding. Make sure that this description matches the data you will be analyzing, not a bigger experiment with more variables that you will not have data for.

#Explanatory and Response Variables - explicitly and simply state your explanatory/independent/x variable and your response/dependent/y variable.

#Sample size - include a description of your sample size and a justification for your choice.

```

# [Experimental Design]{.underline}

[Input your answer and delete these brackets]

### *Variables:*

First Variable

[Input your answer and delete these brackets: This should be your Independent variable if appropriate]

Second Variable

[Input your answer and delete these brackets: This should be your Dependent variable if appropriate]

### *Sample size:*

[Input your answer and delete these brackets]

### *Sample size justification:*

[Input your answer and delete these brackets. How is your sample size a realistic value for the study?]

------------------------------------------------------------------------

```{r Section5 instructions, include=FALSE}

#Primary statistical analysis: Name the analysis you included on the survey form. In the next line, include a brief justification as to why this test is appropriate.

```

# [Data Analysis Plan]{.underline}

[Input your answer and delete these brackets]

[Your 100 word justification here. For example, if you chose correlation, why did you not choose regression?]

------------------------------------------------------------------------

```{r Section6 instructions, include=FALSE}

#Assumptions and Exploratory Data Analysis (EDA): List the assumptions of your chosen test here.

#Enter your code for all testing of assumptions and figures for EDA in the next code block. This will include reading in your data and making it tidy. You should also display the top of your data table - head(). Any figures you make or statistics your code creates should be labeled appropriately. It should be understandable to someone that does not have access to read your code.

#After the code block, write a paragraph discussing your EDA results and if you had to do anything regarding outliers or data transformations. Remember to justify all of your decisions in writing.

```

# [Assumptions and Exploratory Data Analysis (EDA)]{.underline}

[Input your answer and delete these brackets]

```{r Section6 STUDENT CODE BLOCK1, attr.source='.numberLines', include=TRUE}
#USE THIS BLOCK TO INPUT NECESSARY CODE.

```

### *Interpretation of EDA:*

[Input your answer and delete these brackets]

------------------------------------------------------------------------

```{r Section7 instructions, include=FALSE}

#Primary Statistical Analysis: In the next code block, you will conduct your primary statistical test and any necessary post-hoc tests. Do NOT include your own written interpretation here.

```

# [Primary Statistical Analysis]{.underline}

```{r Section7 STUDENT CODE BLOCK2, attr.source='.numberLines', include=TRUE}
#USE THIS BLOCK TO INPUT NECESSARY CODE.

```


------------------------------------------------------------------------

```{r Section8 instructions, include=FALSE}

#Primary Figure: In the next code block, you will create a single well-designed figure in ggplot that will clearly show a reader patterns in your data.

```

# [Data Visualization]{.underline}

```{r Section8 STUDENT CODE BLOCK4, attr.source='.numberLines', include=TRUE}
#USE THIS BLOCK TO INPUT NECESSARY CODE.

```

------------------------------------------------------------------------

```{r Section9 instructions, include=FALSE}

#Conclusions: This is the section where you will use what you have learned in this course to make conclusions based on your results. What patterns/differences do you see in your data? How certain/uncertain are you in those results. THIS IS ONE OF THE MOST IMPORTANT SECTIONS OF THE TERM PROJECT. Demonstrate to us that you understand what your results can and cannot tell you. Make it as long as you need to.

#Future Directions: Are there any confounding variables that your data/experimental design did not include? Briefly discuss what you would do differently if there were no restrictions placed on your design, aside from ethical and reasonable logistic considerations.

#Citations

```

# [Conclusions]{.underline}

[Input your answer and delete these brackets]

------------------------------------------------------------------------

# [Citations]{.underline}

[Input your answer in APA format and delete these brackets]


