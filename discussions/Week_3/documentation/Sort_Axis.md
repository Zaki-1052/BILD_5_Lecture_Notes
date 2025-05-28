# [Sorting the x-axis in bargraphs using ggplot2](https://sebastiansauer.github.io/ordering-bars/ "Sorting the x-axis in bargraphs using ggplot2")

## June 05, 2017

Reading time ~2 minutes

Some time ago, I [posted about how to plot frequencies using ggplot2](https://sebastiansauer.github.io/percentage_plot_ggplot2_V2/). One point that remained untouched was how to sort the order of the bars. Let’s look at that issue here.

First, let’s load some data.

```
data(tips, package = "reshape2")
```

And the usual culprits.

```
library(tidyverse)
library(scales)  # for percentage scales
```

First, let’s plot a standard plot, with bars _un_sorted.

```
tips %>% 
  count(day) %>% 
  mutate(perc = n / nrow(tips)) -> tips2

ggplot(tips2, aes(x = day, y = perc)) + geom_bar(stat = "identity")
```

![plot of chunk unnamed-chunk-3](https://sebastiansauer.github.io/images/2017-06-05/figure/unnamed-chunk-3-1.png)

Hang on, what could ‘unsorted’ possibly mean? There must be some rule, by which ggplot2 determines order.

And the rule is:

- if factor, the order of factor levels is used
- if character, an alphabetical order ist used

# Sorting bars by factor ordering

Albeit it appears common not to like factors, now that’s a situation when they are useful. Factors provide an easy for sorting, see:

```
tips2$day <- factor(tips2$day,levels = c("Fri", "Sat", "Sun", "Thur"))
```

Now let’s plot again:

```
ggplot(tips2, aes(x = day, y = perc)) + geom_bar(stat = "identity")
```

![plot of chunk unnamed-chunk-5](https://sebastiansauer.github.io/images/2017-06-05/figure/unnamed-chunk-5-1.png)

# Sorting bars by some numeric variable

Often, we do not want just _some_ ordering, we want to order by frequency, the most frequent bar coming first. This can be achieved in this way.

```
ggplot(tips2, aes(x = reorder(day, -perc), y = perc)) + geom_bar(stat = "identity")
```

![plot of chunk unnamed-chunk-6](https://sebastiansauer.github.io/images/2017-06-05/figure/unnamed-chunk-6-1.png)

Note the minus sign `-`, leaving it out will change the ordering (from low to high).

Happy plotting!