## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 1

plot1data <- aggregate(Emissions ~ year, NEI, sum)
ggplot(plot1data, aes(x = factor(year), y = Emissions / 1e6)) +
  geom_bar(stat = "identity", fill = "pink") +
  labs(
    x = "Year",
    y = "PM2.5 Emissions (Million Tons)",
    title = "Total PM2.5 Emissions From All US Sources"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

png("plot1.png")
dev.off()
