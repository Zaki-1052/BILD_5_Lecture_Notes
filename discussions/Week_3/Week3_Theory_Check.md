# Week 3 Theory Check

## AI Q&A

### Question 1

- Explain: What is in each of the following Datasets in the R programming language: mtcars, iris, ToothGrowth, and chickwts

#### Answer 1

```
Let me help you understand these classic R datasets in a clear and educational way.

**Dataset Explanations:**

1. **mtcars (Motor Trend Cars)**
- Contains data from Motor Trend magazine (1974)
- 32 cars with 11 different specifications
- Includes features like mpg, cylinders, horsepower, weight
- Used to analyze automobile performance characteristics

2. **iris (Fisher's Iris Dataset)**
- Famous dataset collected by botanist Edgar Anderson
- Contains 150 samples from 3 species of iris flowers
- Measures 4 features: sepal length/width, petal length/width
- Classic dataset for classification and visualization tasks

3. **ToothGrowth**
- Study on guinea pig tooth growth
- Examines effect of Vitamin C on tooth length
- 60 observations with 3 variables:
    - Tooth length
    - Supplement type (VC = Vitamin C or OJ = Orange Juice)
    - Dosage (0.5, 1, or 2 mg)

4. **chickwts (Chicken Weights)**
- Experiment on effect of feed supplements on chicken growth
- 71 chicks measured
- Records final weight and feed type
- Six different feed supplements tested
```

### Question 2

- Tell me more about the 'ToothGrowth' dataset: Explain what each variable in the dataset represents

#### Answer 2

```
I'll break down the ToothGrowth dataset in detail.

**ToothGrowth Dataset Variables Explained:**

1. **len (Tooth Length)**
    - Numeric measurement in millimeters (mm)
    - Represents the length of odontoblasts (tooth cells)
    - Primary response variable in the study
    - Range: approximately 4-35 mm
2. **supp (Supplement Type)**
    - Categorical variable with 2 levels:
    - "VC" = Vitamin C (ascorbic acid)
    - "OJ" = Orange Juice
    - Represents different delivery methods of Vitamin C
3. **dose (Dosage Amount)**
    - Numeric variable measured in milligrams/day
    - Three dosage levels: 0.5, 1.0, and 2.0 mg
    - Represents amount of supplement administered

**Additional Context:**
- Study included 60 guinea pigs
- Each pig received one of the two supplement types
- Each supplement was given at one of three dose levels
- Goal: Compare effectiveness of delivery methods (OJ vs VC) and dosage amounts on tooth growth
```

### Question 3

- Generate code in the R programming language to make a figure using ggplot2. 
- Format: 'Box Plot'. 
	- x-axis: dosage levels (categorical)
	- y-axis: tooth length (continuous)
	- legend variables: color code by supplement type
- Before beginning, verify if this is a valid format. 

#### Answer 3

```
Yes, this is a perfectly valid format for visualizing the ToothGrowth dataset! A box plot is an excellent choice as it will show:
- Distribution of tooth length for each dosage level
- Comparison between supplement types
- Median, quartiles, and potential outliers

Here's the R code using ggplot2 to create this visualization:
```
```r
# Load required libraries
library(ggplot2)

# Create the box plot
ggplot(ToothGrowth, aes(x=factor(dose), y=len, fill=supp)) +
  geom_boxplot() +
  labs(title="Guinea Pig Tooth Growth by Dosage and Supplement Type",
       x="Dose (mg/day)",
       y="Tooth Length (mm)",
       fill="Supplement Type") +
  scale_fill_brewer(palette="Set2", labels=c("Orange Juice", "Vitamin C")) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right"
  )
```
```
This code will create a box plot with:
- Dosage levels (0.5, 1.0, 2.0) on the x-axis
- Tooth length on the y-axis
- Different colors for OJ and VC supplements
- Clear labels and a clean theme

Would you like me to explain any part of this code or help you run it?
```

### Question 4

- Please clean up the attached figure. Make the title centered over the graph, use different colors (Red for Vitamin C and Yellow for Orange Juice). Use a different theme and explain what the outlying dots are. Lastly, analyze whether a line plot would be appropriate for this scenario, given that the dosage was given over time, or whether it should stay as a box plot.

#### Answer 4

- I'll help modify the code and explain the visualization choices.
```r
# Load required libraries
library(ggplot2)

# Create the enhanced box plot
ggplot(ToothGrowth, aes(x=factor(dose), y=len, fill=supp)) +
  geom_boxplot() +
  labs(title="Impact of Vitamin C Delivery Method on Guinea Pig Tooth Growth",
       subtitle="Comparing Orange Juice vs Vitamin C Supplements",
       x="Dose (mg/day)",
       y="Tooth Length (mm)",
       fill="Supplement Type") +
  scale_fill_manual(values=c("orange", "red"), 
                    labels=c("Orange Juice", "Vitamin C")) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face="bold"),
    plot.subtitle = element_text(hjust = 0.5, face="italic"),
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_blank()
  )
```
```
**Explanation of Changes & Analysis:**

1. **About the Outlier Dots:**
    - The individual points shown outside the boxplots are statistical outliers
    - These represent individual measurements that fall beyond 1.5 times the interquartile range (IQR)
    - They're important to show as they represent actual data points, not errors
2. **Box Plot vs Line Plot Analysis:**
    - While the dosage varies (0.5, 1.0, 2.0), this isn't actually time-series data
    - Each measurement was taken at a single point in time
    - Box plots are more appropriate because they show:
        - Distribution of measurements at each dose level
        - Median tooth length
        - Variability in the data
        - Clear comparison between supplement types
    - A line plot might misleadingly imply continuous progression over time
3. **Visual Improvements:**
    - Used theme_bw() for better contrast
    - Added informative subtitle
    - Changed colors to match supplement types (orange for OJ, red for VC)
    - Centered and bolded title
    - Removed minor grid lines for cleaner look

Would you like me to make any additional adjustments to the visualization?
```

### Question 5

- Better, but as shown, the title overflows. That should be the only thing left to fix.

#### Answer 5

- I'll modify the code to fix the title overflow by breaking it into shorter lines and adjusting the text size:
```r
# Load required libraries
library(ggplot2)

# Create the enhanced box plot with fixed title
ggplot(ToothGrowth, aes(x=factor(dose), y=len, fill=supp)) +
  geom_boxplot() +
  labs(title="Effect of Vitamin C Delivery Methods\non Guinea Pig Tooth Growth",
       subtitle="Comparing Orange Juice vs Vitamin C Supplements",
       x="Dose (mg/day)",
       y="Tooth Length (mm)",
       fill="Supplement Type") +
  scale_fill_manual(values=c("orange", "red"), 
                    labels=c("Orange Juice", "Vitamin C")) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face="bold", size=11),
    plot.subtitle = element_text(hjust = 0.5, face="italic", size=10),
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_blank()
  )
```
```
Changes made:

1. Split the title into two lines using "\n"
2. Reduced title font size to 11pt
3. Reduced subtitle font size to 10pt
4. Shortened the title wording while maintaining clarity

This should now display properly without any overflow issues while maintaining the clean look of the visualization.
```

### Question 6

- Better. Lastly, explain why you chose to use 'factor(dose)' and the function of 'scale_fill_manual' when concatenating the vectors of the supplements, as well as functions like panel.grid and the parameters passed in the theme.

#### Answer 6

```
Let me explain these important R functions and their purposes:

1. **factor(dose)**
- Purpose: Converts numeric dose values into categorical factors
- Why it's needed:
    - The original 'dose' variable is numeric (0.5, 1, 2)
    - Box plots require categorical x-axis values
    - factor() tells ggplot2 to treat these numbers as discrete categories
    - Without factor(), R would treat dose as continuous, causing incorrect plotting

2. **scale_fill_manual()**
```
```r
scale_fill_manual(values=c("orange", "red"), 
                 labels=c("Orange Juice", "Vitamin C"))
```
```
- Purpose: Customizes the fill colors and labels for the plot
- Components:
    - values=c(): Specifies custom colors for each group
    - labels=c(): Defines how groups appear in the legend
- Why it's useful:
    - Provides meaningful colors (orange for OJ, red for VC)
    - Makes the visualization more intuitive
    - Allows full control over color scheme

3. **theme() Parameters**
```
```r
theme(
    plot.title = element_text(hjust = 0.5, face="bold", size=11),
    plot.subtitle = element_text(hjust = 0.5, face="italic", size=10),
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_blank()
)
```
```
- **plot.title/subtitle**: Controls text formatting
    - hjust = 0.5: Centers text horizontally
    - face: Sets font style (bold/italic)
    - size: Controls font size
- **panel.grid.major**: Controls major gridlines
    - color = "grey90": Light grey for subtle grid
    - Helps read values without being distracting
- **panel.grid.minor**: Controls minor gridlines
    - element_blank(): Removes minor gridlines
    - Reduces visual clutter

These elements work together to create a professional, readable visualization that effectively communicates the data relationships while maintaining visual appeal and clarity.
```

## Working Code

```r
# Load required libraries
library(ggplot2)

ggplot(ToothGrowth, aes(x=factor(dose), y=len, fill=supp)) +
  geom_boxplot() +
  labs(title="Effect of Vitamin C Delivery Methods\non Guinea Pig Tooth Growth",
       subtitle="Comparing Orange Juice vs Vitamin C Supplements",
       x="Dose (mg/day)",
       y="Tooth Length (mm)",
       fill="Supplement Type") +
  scale_fill_manual(values=c("orange", "red"), 
                    labels=c("Orange Juice", "Vitamin C")) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face="bold", size=11),
    plot.subtitle = element_text(hjust = 0.5, face="italic", size=10),
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_blank()
  )
```

### Figure Image

![[ToothGrowth-v3.png]]