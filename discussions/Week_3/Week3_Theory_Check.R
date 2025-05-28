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