## 3.4 Using Colors in a Bar Graph[](https://r-graphics.org/recipe-bar-graph-colors#RECIPE-BAR-GRAPH-COLORS)

### 3.4.1 Problem[](https://r-graphics.org/recipe-bar-graph-colors#problem-16)

You want to use different colors for the bars in your graph.

### 3.4.2 Solution[](https://r-graphics.org/recipe-bar-graph-colors#solution-16)

Map the appropriate variable to the fill aesthetic.

We’ll use the `uspopchange` data set for this example. It contains the percentage change in population for the US states from 2000 to 2010. We’ll take the top 10 fastest-growing states and graph their percentage change. We’ll also color the bars by region (Northeast, South, North Central, or West).

First, take the top 10 states:

```
library(gcookbook) # Load gcookbook for the uspopchange data set
library(dplyr)

upc <- uspopchange %>%
  arrange(desc(Change)) %>%
  slice(1:10)

upc
#>             State Abb Region Change
#> 1          Nevada  NV   West   35.1
#> 2         Arizona  AZ   West   24.6
#> 3            Utah  UT   West   23.8
#>  ...<4 more rows>...
#> 8         Florida  FL  South   17.6
#> 9        Colorado  CO   West   16.9
#> 10 South Carolina  SC  South   15.3
```

Now we can make the graph, mapping Region to fill (Figure [3.9](https://r-graphics.org/recipe-bar-graph-colors#fig:FIG-BAR-GRAPH-FILL)):

```
ggplot(upc, aes(x = Abb, y = Change, fill = Region)) +
  geom_col()
```

![A variable mapped to fill](https://r-graphics.org/R-Graphics-Cookbook-2e_files/figure-html/FIG-BAR-GRAPH-FILL-1.png)

Figure 3.9: A variable mapped to fill

### 3.4.3 Discussion[](https://r-graphics.org/recipe-bar-graph-colors#discussion-10)

The default colors aren’t the most appealing, so you may want to set them using `scale_fill_brewer()` or `scale_fill_manual()`. With this example, we’ll use the latter, and we’ll set the outline color of the bars to black, with `colour="black"` (Figure [3.10](https://r-graphics.org/recipe-bar-graph-colors#fig:FIG-BAR-GRAPH-FILL-MANUAL)). Note that _setting_ occurs outside of `aes()`, while _mapping_ occurs within `aes()`:

```
ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")
```

![Graph with different colors, black outlines, and sorted by percentage change](https://r-graphics.org/R-Graphics-Cookbook-2e_files/figure-html/FIG-BAR-GRAPH-FILL-MANUAL-1.png)

Figure 3.10: Graph with different colors, black outlines, and sorted by percentage change

This example also uses the `reorder()` function to reorder the levels of the factor `Abb` based on the values of `Change`. In this particular case it makes sense to sort the bars by their height, instead of in alphabetical order.

### 3.4.4 See Also[](https://r-graphics.org/recipe-bar-graph-colors#see-also-13)

For more about using `reorder()`, see Recipe [15.9](https://r-graphics.org/recipe-dataprep-factor-reorder-value#RECIPE-DATAPREP-FACTOR-REORDER-VALUE).

For more information about using colors, see Chapter [12](https://r-graphics.org/chapter-colors#CHAPTER-COLORS).

[](https://r-graphics.org/recipe-bar-graph-counts)[](https://r-graphics.org/recipe-bar-graph-color-neg)