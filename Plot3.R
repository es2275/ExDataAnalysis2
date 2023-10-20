## Setting Up
setwd("~/Desktop")

# Load ggplot2
library(ggplot2)

# Load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Plot 3

baltimore <- subset(NEI, fips == "24510")


plot3 <- ggplot(baltimore, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ type, scales = "free", ncol = 1) +
  labs(
    x = "Year",
    y = "PM2.5 Emission (Tons)",
    title = "PM2.5 Emissions in Baltimore (1999-2008) by Source Type"
  ) +
  scale_fill_brewer(palette = "Set1") +  
  theme_minimal()

plot3

png("plot3.png")
dev.off()
