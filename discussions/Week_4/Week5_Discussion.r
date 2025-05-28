# Load required libraries
library(ggplot2)
library(tidyr)

# Create new dataframe with area calculations
iris_areas <- data.frame(
  Species = iris$Species,
  Sepal_Area = iris$Sepal.Length * iris$Sepal.Width,
  Petal_Area = iris$Petal.Length * iris$Petal.Width
)

# Convert to long format
iris_long <- tidyr::pivot_longer(
  iris_areas,
  cols = c(Sepal_Area, Petal_Area),
  names_to = "Measurement",
  values_to = "Area"
)

# Create the plot
ggplot(iris_long, aes(x = Measurement, y = Area, fill = Species)) +
  # Add points first (behind boxes)
  geom_point(aes(color = Species),
             position = position_dodge(width = 0.7),
             size = 1.5,
             alpha = 0.3) +
  # Add notched boxplots
  geom_boxplot(notch = TRUE,
               alpha = 0.7,
               width = 0.7) +
  # Labels
  labs(
    title = "Flower Part Sizes Across Iris Species",
    subtitle = "Comparing Areas of Petals and Sepals Between Flowers",
    x = "Flower Part",
    y = expression("Area (cm"^2*")"),
    fill = "Species",
    color = "Species"
  ) +
  # Scales
  scale_x_discrete(labels = c("Sepal_Area" = "Sepal", "Petal_Area" = "Petal")) +
  scale_y_continuous(
    breaks = seq(0, 30, by = 3),
    minor_breaks = seq(0, 30, by = 1.5),
    limits = c(0, 30),
    expand = expansion(mult = c(0.02, 0.05))
  ) +
  # Colors
  scale_fill_manual(
    values = c("setosa" = "#4B0082",
               "versicolor" = "#1E90FF",
               "virginica" = "#FF69B4")
  ) +
  scale_color_manual(
    values = c("setosa" = "#4B0082",
               "versicolor" = "#1E90FF",
               "virginica" = "#FF69B4")
  ) +
  # Custom legend
  guides(
    color = guide_legend(
      override.aes = list(
        shape = 18,
        size = 8,
        alpha = 1
      ),
      keywidth = unit(1.5, "cm"),
      keyheight = unit(1, "cm")
    ),
    fill = "none"  # Hide fill legend since we're using color
  ) +
  # Theme
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 11),
    plot.subtitle = element_text(hjust = 0.5, size = 10, face = "italic"),
    panel.grid.major = element_line(color = "grey90"),
    panel.grid.minor = element_line(color = "grey95", size = 0.25),
    legend.position = "right",
    legend.key.size = unit(1.5, "cm"),
    legend.text = element_text(face = "italic"),
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 9),
    axis.text.x = element_text(face = "bold")
  )
