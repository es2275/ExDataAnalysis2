## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 2

baltimore <- subset(NEI, fips == "24510")

baltimoredata <- aggregate(Emissions ~ year, baltimore, sum)

ggplot(baltimoredata, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity", fill = "lightgreen") +
  labs(
    x = "Year",
    y = "PM2.5 Emissions (Tons)",
    title = "Total PM2.5 Emissions From all Baltimore City Sources"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

png("plot2.png")
dev.off()
