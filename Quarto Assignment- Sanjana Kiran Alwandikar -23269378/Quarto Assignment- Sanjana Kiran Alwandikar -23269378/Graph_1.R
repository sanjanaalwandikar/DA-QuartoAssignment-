library(RColorBrewer)
data <- read.csv("/Users/vaishnavimanjunatha/Downloads/unicef_metadata.csv")


blue_colors <- c("#D6EAF8", "#AED6F1", "#85C1E9")
orange_colors <- c("#FDEBD0", "#FAD7A0", "#F8C471")

MExpenditure_by_country <- aggregate(Military.expenditure....of.GDP. ~ country, data, sum)
filtered_data <- MExpenditure_by_country[MExpenditure_by_country$Military.expenditure....of.GDP. >= 220 & MExpenditure_by_country$Military.expenditure....of.GDP. <= 400, ]

top_countries <- head(filtered_data, 6)

print(top_countries)
barplot(top_countries$Military.expenditure....of.GDP., 
        names.arg = top_countries$country, 
        main = "Military Expenditure based on country",
        xlab = "Country",
        ylab = "Military expenditure (% of GDP)",
        col = c(blue_colors, orange_colors))
