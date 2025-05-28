# How To Rotate x-axis Text Labels in ggplot2

[datavizpyr](https://datavizpyr.com/author/jsresponder/) · August 31, 2020 ·

One of the common problems while making data visualization is making the axis label clearly legible. Often they tend to overlap and make it difficult to read the text labels. There are [a few ways we can make the axis text label](https://datavizpyr.com/how-to-dodge-overlapping-text-on-x-axis-labels-in-ggplot2/) easy to read.

In this tutorial, we will learn how to rotate axis text labels so that it is easy to read axis text labels. We will use [TidyTuesday dataset](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-09-01/readme.md) on world-wide crop yield.  

Let us load tidyverse, the suite of R packages and set a ggplot2 theme for our plots.

|   |   |
|---|---|
|1<br><br>2|`library``(tidyverse)`<br><br>`theme_set``(``theme_bw``(16))`|

### Boxplot example with overlapping x-axis label text

Let us load the file containing global crop yield across multiple years directly from TidyTuesday github page.

|   |   |
|---|---|
|1|`key_crop_yields <- readr::``read_csv``(``'[https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv](https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv)'``)`|

Let us get a quick peek at the data.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9<br><br>10<br><br>11<br><br>12<br><br>13<br><br>14<br><br>15|`key_crop_yields %>%` `head``()`<br><br>`## # A tibble: 6 x 14`<br><br>``##   Entity Code   Year `Wheat (tonnes … `Rice (tonnes p… `Maize (tonnes …``<br><br>`##   <chr>  <chr> <dbl>            <dbl>            <dbl>            <dbl>`<br><br>`## 1 Afgha… AFG    1961            1.02              1.52             1.4`<br><br>`## 2 Afgha… AFG    1962            0.974             1.52             1.4`<br><br>`## 3 Afgha… AFG    1963            0.832             1.52             1.43`<br><br>`## 4 Afgha… AFG    1964            0.951             1.73             1.43`<br><br>`## 5 Afgha… AFG    1965            0.972             1.73             1.44`<br><br>`## 6 Afgha… AFG    1966            0.867             1.52             1.44`<br><br>``## # … with 8 more variables: `Soybeans (tonnes per hectare)` <dbl>, `Potatoes``<br><br>``## #   (tonnes per hectare)` <dbl>, `Beans (tonnes per hectare)` <dbl>, `Peas``<br><br>``## #   (tonnes per hectare)` <dbl>, `Cassava (tonnes per hectare)` <dbl>, `Barley``<br><br>``## #   (tonnes per hectare)` <dbl>, `Cocoa beans (tonnes per hectare)` <dbl>,``<br><br>``## #   `Bananas (tonnes per hectare)` <dbl>``|

We will be making a boxplot of rice yield for selected countries to show how to rotate x-axis text labels

|   |   |
|---|---|
|1<br><br>2<br><br>3|`countries <-` `c``(``"China"``,` `"Taiwan"``,` `"Philippines"``,`<br><br>               `"India"``,``"Bangladesh"``,` `"Malaysia"``,`<br><br>               `"Mexico"``,` `"United States"``)`|

Let us make a boxplot using geom_boxplot() and with jittrered data points using geom_jitter(). In the boxplot, we have the selected countries are on x-axis and rice yield in tonnes per hectare on y-axis.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)`|

We can see that some of the countries overlap on x-axis.

![Overlapping X-axis Text Labels in ggplot2](https://datavizpyr.com/wp-content/uploads/2020/09/boxplot_with_overlapping_x_axis_text_labels.png)

Overlapping X-axis Text Labels in ggplot2

### How To Rotate x-axis Text Label to using guides()

With ggplot2 3.5.0 we have a new way to rotate x-axis text labels to angle we want using guide_axis() function. In the example below we use guides() function as additional layer with guide_axis() as its argument. In the example below we rotate the labels by 90 degree angle, but that could customized to other angle interest.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8<br><br>9|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)+`<br><br>  `guides``(x =`  `guide_axis``(angle = 90))+`<br><br>  `labs``(title=``"Rotate axis label: guides() & guide_axis()"``)`<br><br>`ggsave``(``"rotating_x_axis_text_label_using_guides_guide_axis_ggplot2.png"``)`|

![Rotate x-axis text label using guides() and guide_axis() in ggplot2](https://datavizpyr.com/wp-content/uploads/2020/08/rotating_x_axis_text_label_using_guides_guide_axis_ggplot2.png)

Rotate x-axis text label using guides() and guide_axis() in ggplot2

### How To Rotate x-axis Text Label to using scale_x_discrete() & guide_axis()

Another variant of using guide axis() function to rotate x-axis text labels is to use with scale_x_discrete() function instead of guides(). In the example below we rotate the labels by 90 degree angle, but we can change that.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6<br><br>7<br><br>8|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)+`<br><br>  `scale_x_discrete``(guide=`  `guide_axis``(angle = 90))+`<br><br>  `labs``(title=``"Rotate axis label: scale_x_discrete() & guide_axis()"``)`<br><br>`ggsave``(``"rotating_x_axis_text_label_using_scale_x_discrete_guide_axis_ggplot2.png"``)`|

![Rotate x-axis text label using scale_x_discrete() and guide_axis() in ggplot2](https://datavizpyr.com/wp-content/uploads/2020/08/rotating_x_axis_text_label_using_scale_x_discrete_guide_axis_ggplot2.png)

rotating_x_axis_text_label_using_scale_x_discrete_guide_axis_ggplot2

### How To Rotate x-axis Text Label to 90 Degrees

To make the x-axis text label easy to read, let us rotate the labels by 90 degrees. We can rotate axis text labels using theme() function in ggplot2. To rotate x-axis text labels, we use “axis.text.x” as argument to theme() function. And we specify “element_text(angle = 90)” to rotate the x-axis text by an angle 90 degree.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)+`<br><br>  `theme``(axis.text.x =` `element_text``(angle = 90))`|

We have successfully rotated x-axis text labels to 90 degrees and thus avoided overlapping x-axis labels..

![How to rotate x-axis text labels 90 degree?](https://datavizpyr.com/wp-content/uploads/2020/09/how_to_rotate_x_axis_text_labels_90degree.png)

How to rotate x-axis text labels 90 degree?

### Rotating x-axis Text Label by 45 Degrees

Notice that rotating x-axis text labels to 90 degree takes extra space in the plot. One way to make it better is to rotate x-axis label to 45 degree instead of 90 degrees.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)+`<br><br>  `theme``(axis.text.x =` `element_text``(angle = 45))`|

![How to rotate x-axis text labels 45 degree?](https://datavizpyr.com/wp-content/uploads/2020/09/how_to_rotate_x_axis_text_labels_45degree.png)

How to rotate x-axis text labels 45 degree?

### Adjusting the Rotated x-axis Text Label using “hjust”

Rotating x-axis text labels to 45 degrees makes the label overlap with the plot and we can avoid this by adjusting the text location using hjust argument to theme’s text element with element_text(). We use axis.text.x as we want to change the look of x-axis text.

|   |   |
|---|---|
|1<br><br>2<br><br>3<br><br>4<br><br>5<br><br>6|`key_crop_yields %>%`<br><br>  `filter``(Entity %``in``% countries) %>%`<br><br>  `ggplot``(``aes``` (Entity,` ```Rice` ``(tonnes per hectare)`)) +``<br><br>  `geom_boxplot``() +`<br><br>  `geom_jitter``(width=0.15)+`<br><br>  `theme``(axis.text.x =` `element_text``(angle = 45, hjust=1))`|

Now we have successfully rotated x-axis text labels to make the labels legible.

![How to rotate x-axis text labels 45 degree?](https://datavizpyr.com/wp-content/uploads/2020/09/how_to_rotate_x_axis_text_labels_45degree_hjust.png)

How to rotate x-axis text labels 45 degree?

Note that rotating axis text labels are not always the best solution. In most cases we can use coord_flip() to switch and and y-axis and make the axis text easy to read. And with g[gplot2 version 3.3.0, we can avoid overlapping label texts by moving the labels](https://datavizpyr.com/how-to-dodge-overlapping-text-on-x-axis-labels-in-ggplot2/) along y-axis alternatively.