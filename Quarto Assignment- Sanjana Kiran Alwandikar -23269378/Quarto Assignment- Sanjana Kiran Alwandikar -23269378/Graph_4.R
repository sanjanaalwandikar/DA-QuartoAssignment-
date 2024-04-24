library(maps)
library(ggplot2)

data <- read.csv("/Users/vaishnavimanjunatha/Downloads/unicef_metadata.csv") 

# Plot world map
world_map <- map_data("world")
# Merge map data with your dataset based on country codes
merged_data <- merge(world_map, data, by.x = "region", by.y = "country", all.x = TRUE)

# Plot the map with ggplot2
ggplot() +
  geom_map(data = merged_data, map = merged_data,
           aes(x = long, y = lat, map_id = region, fill = GDP.per.capita..constant.2015.US..)) +
  scale_fill_gradient(name = "GDP per capita (constant 2015 US$)",
                      low = "lightblue", high = "lightyellow", na.value = "grey",
                      limits = c(5000,20000),
                      guide = "legend") +
  labs(title = "04. Country Based GDP Value",
       subtitle = "Data Source: Your Dataset",
       fill = "GDP per capita (constant 2015 US$)") +
  theme_void() +
  theme(legend.position = "bottom")+
  theme(plot.title = element_text(face = "bold", hjust = 0.5))


