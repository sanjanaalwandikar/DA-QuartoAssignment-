                    library(ggplot2)
                    data <- read.csv("/Users/vaishnavimanjunatha/Downloads/unicef_metadata.csv")  
                    
                    revenue_by_country <- aggregate(GNI..current.US.. ~ country, data, sum)
                    
                    revenue_by_country <- revenue_by_country[order(-revenue_by_country$GNI..current.US..), ]
                    
                    top_10_countries <- head(revenue_by_country, 10)
                    n <- nrow(top_10_countries)
                    colors <- sample(colors(), n)
                    
                    ggplot(top_10_countries, aes(x = country, y = GNI..current.US.., size = GNI..current.US..,color = colors)) +
                      geom_point(alpha = 0.7) +
                      scale_size_continuous(range = c(3, 12)) +
                      scale_y_continuous(labels = scales::comma_format(scale = 1e-6, suffix = "M"), limits = c(0, max(top_10_countries$GNI..current.US..) * 1.2)) +  
                      labs(title = "GNI Based on Country",
                           x = "Country",
                           y = "Revenue (GNI US dollars)",
                           size = "Revenue") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels
        axis.text.y = element_text(angle = 0, vjust = 0.5))

