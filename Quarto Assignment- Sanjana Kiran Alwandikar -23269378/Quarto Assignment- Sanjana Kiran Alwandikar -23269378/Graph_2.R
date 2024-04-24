library(ggplot2)

data <- read.csv("/Users/vaishnavimanjunatha/Downloads/unicef_metadata.csv") 
indicator <- read.csv("/Users/vaishnavimanjunatha/Downloads/unicef_indicator_1.csv")

ggplot(data, aes(x = year, y = Inflation..consumer.prices..annual...)) +
  geom_area( fill = "white", color="skyblue", size=.4, alpha=0.9, linetype=1) +
  labs(title = "Country Based Inflation Plot",
       x = "Year",
       y = "Inflation, consumer prices (annual %)") +
  theme_minimal()