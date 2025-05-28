# ggplot2 title : main, axis and legend titles

Tools

- [Prepare the data](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#prepare-the-data)
- [Example of plot](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#example-of-plot)
- [Change the main title and axis labels](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#change-the-main-title-and-axis-labels)
- [Change the appearance of the main title and axis labels](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#change-the-appearance-of-the-main-title-and-axis-labels)
- [Remove x and y axis labels](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#remove-x-and-y-axis-labels)
- [Infos](https://www.sthda.com/english/wiki/ggplot2-title-main-axis-and-legend-titles#infos)

  

The aim of this **tutorial** is to describe how to modify **plot titles** (**main title**, **axis labels** and **legend titles**) using **R software** and **ggplot2** package.

The functions below can be used :

```
ggtitle(label) # for the main title
xlab(label) # for the x axis label
ylab(label) # for the y axis label
labs(...) # for the main title, axis labels and legend titles
```

The argument _label_ is the text to be used for the main title or for the axis labels.

  

Related Book:

[![](https://www.datanovia.com/en/wp-content/uploads/dn-tutorials/affiliate-marketing/images/ggplot2-book.png)  
GGPlot2 Essentials for Great Data Visualization in R](https://www.datanovia.com/en/udft)

# Prepare the data

ToothGrowth data is used in the following examples.

```
# convert dose column from a numeric to a factor variable
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
head(ToothGrowth)
```

```
##    len supp dose
## 1  4.2   VC  0.5
## 2 11.5   VC  0.5
## 3  7.3   VC  0.5
## 4  5.8   VC  0.5
## 5  6.4   VC  0.5
## 6 10.0   VC  0.5
```

Make sure that the variable _dose_ is converted as a factor using the above R script.

# Example of plot

```
library(ggplot2)
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_boxplot()
p
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-example-1.png "ggplot2 title, axis labels, legend titles, R programming")

# Change the main title and axis labels

Change **plot titles** by using the functions _ggtitle()_, _xlab()_ and _ylab()_ :

```
p + ggtitle("Plot of length \n by dose") +
  xlab("Dose (mg)") + ylab("Teeth length")
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-title-and-axis-labels-1.png "ggplot2 title, axis labels, legend titles, R programming")

Note that, you can use **\n** to split long title into multiple lines.

Change **plot titles** using the function **labs()** as follow :

```
p +labs(title="Plot of length \n by dose",
        x ="Dose (mg)", y = "Teeth length")
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-plot-titles-labs-1.png "ggplot2 title, axis labels, legend titles, R programming")

It is also possible to change **legend titles** using the function **labs()**:

```
# Default plot
p <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose))+
  geom_boxplot()
p
# Modify legend titles
p + labs(fill = "Dose (mg)")
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-legend-titles-1.png "ggplot2 title, axis labels, legend titles, R programming")![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-legend-titles-2.png "ggplot2 title, axis labels, legend titles, R programming")

# Change the appearance of the main title and axis labels

Main title and, x and y axis labels can be customized using the functions **theme()** and **element_text()** as follow :

```
# main title
p + theme(plot.title = element_text(family, face, colour, size))
# x axis title 
p + theme(axis.title.x = element_text(family, face, colour, size))
# y axis title
p + theme(axis.title.y = element_text(family, face, colour, size))
```

The arguments below can be used for the function _element_text()_ to change the appearance of the text :

  

- **family** : font family
- **face** : font face. Possible values are “plain”, “italic”, “bold” and “bold.italic”
- **colour** : text color
- **size** : text size in pts
- **hjust** : horizontal justification (in [0, 1])
- **vjust** : vertical justification (in [0, 1])
- **lineheight** : line height. In multi-line text, the _lineheight_ argument is used to change the spacing between lines.
- **color** : an alias for colour

  

```
# Default plot
p <- ggplot(ToothGrowth, aes(x=dose, y=len)) + geom_boxplot() +
  ggtitle("Plot of length \n by dose") +
  xlab("Dose (mg)") + ylab("Teeth length")
p
# Change the color, the size and the face of
# the main title, x and y axis labels
p + theme(
plot.title = element_text(color="red", size=14, face="bold.italic"),
axis.title.x = element_text(color="blue", size=14, face="bold"),
axis.title.y = element_text(color="#993333", size=14, face="bold")
)
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-color-size-face-1.png "ggplot2 title, axis labels, legend titles, R programming")![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-change-color-size-face-2.png "ggplot2 title, axis labels, legend titles, R programming")

# Remove x and y axis labels

It’s possible to hide the **main title** and **axis labels** using the function **element_blank()** as follow :

```
# Hide the main title and axis titles
p + theme(
  plot.title = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_blank())
```

![ggplot2 title, axis labels, legend titles, R programming](https://www.sthda.com/sthda/RDoc/figure/ggplot2/ggplot2-title-hide-axis-labels-1.png "ggplot2 title, axis labels, legend titles, R programming")

# Infos